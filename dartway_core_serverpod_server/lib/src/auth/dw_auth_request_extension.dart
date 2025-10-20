import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:dartway_core_serverpod_shared/dartway_core_serverpod_shared.dart';
import 'package:serverpod/serverpod.dart';

import 'dw_auth_utils.dart';

extension DwAuthRequestVerification on DwAuthRequest {
  void setFailed(Session session, DwAuthFailReason reason) {
    session.log('Auth failed: $reason', level: LogLevel.warning);

    status = DwAuthRequestStatus.failed;
    failReason = reason;
    return;
  }

  Future<SerializableModel?> findRelatedUserProfile(Session session) async {
    final userProfile = await DwCore.instance.getUserProfileByIdentifier(
      session,
      userIdentifier,
    );

    userId = userProfile?.id;
    return userProfile;
  }

  /// Проверяет пароль / hash и возвращает статус
  Future<void> tryVerify(
    Session session, {
    required SerializableModel? userProfile,
  }) async {
    // TODO: add alternative logic for registration requests
    if (userProfile == null) {
      return setFailed(session, DwAuthFailReason.userNotFound);
    }

    if (password != null) {
      final userPassword = await DwUserPassword.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(userId),
      );
      if (userPassword == null) {
        return setFailed(session, DwAuthFailReason.passwordNotSet);
      }

      final isValid =
          DwAuthUtils.verifyPassword(password!, userPassword.passwordHash);

      if (!isValid) {
        return setFailed(session, DwAuthFailReason.invalidPassword);
      } else {
        status = DwAuthRequestStatus.verified;
        session.log(
          'Auth verified for userId=$userId ($userIdentifier) with password',
          level: LogLevel.info,
        );
        return;
      }
    } else if (accessToken != null) {
      final verification = await DwAuthVerification.db.findFirstRow(
        session,
        where: (t) => t.accessToken.equals(accessToken!),
        include: DwAuthVerification.include(
          dwAuthRequest: DwAuthRequest.include(),
        ),
      );

      if (verification != null &&
          verification.dwAuthRequest?.userIdentifier == userIdentifier) {
        status = DwAuthRequestStatus.verified;
        session.log(
          'Auth verified for userId=$userId ($userIdentifier) with accessToken',
          level: LogLevel.info,
        );
        return;
      } else {
        return setFailed(session, DwAuthFailReason.invalidAccessToken);
      }
    }

    status = DwAuthRequestStatus.pendingVerification;
    return;
  }

  Future<List<DwModelWrapper>> onVerified(
    Session session, {
    required SerializableModel? userProfile,
  }) async {
    switch (requestType) {
      case DwAuthRequestType.login:
        final authKey =
            await DwCore.instance.auth!.signInUser(session, userId!);
        return [
          DwModelWrapper(
            object: DwAuthData(
              key: authKey.key!,
              keyId: authKey.id!,
              userProfile: userProfile!,
            ),
          )
        ];
      case DwAuthRequestType.changePassword:
        final newPassword =
            extraData![DwCoreConst.authNewPasswordKey] as String;

        await DwAuth.instance.setUserPassword(
          session,
          userId: userId!,
          newPassword: newPassword,
        );

        return [];
      default:
        throw UnimplementedError('Unknown request type: $requestType');
    }
  }
}
