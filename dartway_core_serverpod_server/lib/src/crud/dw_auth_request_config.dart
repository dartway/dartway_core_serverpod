import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:dartway_core_serverpod_server/src/auth/dw_auth_utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

const verificationCodeKey = 'verificationCode';

final dwAuthRequestConfig = DwCrudConfig<DwAuthRequest>(
  table: DwAuthRequest.t,
  saveConfig: DwSaveConfig<DwAuthRequest>(
    allowSave: (
      Session session,
      DwSaveContext<DwAuthRequest> saveContext,
    ) async =>
        true,
    beforeSaveTransaction: (
      Session session,
      DwSaveContext<DwAuthRequest> saveContext,
    ) async {
      final authResponse = saveContext.currentModel.password == null
          ? null
          : await Emails.authenticate(
              session,
              saveContext.currentModel.userIdentifier,
              saveContext.currentModel.password!,
            );

      final hasPriorVerification = saveContext.currentModel.accessToken == null
          ? false
          : await DwAuthVerification.db
              .findFirstRow(
                session,
                where: (verification) => verification.accessToken
                    .equals(saveContext.currentModel.accessToken),
                include: DwAuthVerification.include(
                  dwAuthRequest: DwAuthRequest.include(),
                ),
              )
              .then(
                (value) =>
                    value != null &&
                    value.dwAuthRequest?.userIdentifier ==
                        saveContext.currentModel.userIdentifier,
              );

      final isConfirmed = authResponse?.success == true || hasPriorVerification;

      if (isConfirmed) {
        saveContext.currentModel.status = DwAuthRequestStatus.confirmed;
      } else {
        saveContext.currentModel.status = DwAuthRequestStatus.pending;
      }

      if (saveContext.currentModel.status == DwAuthRequestStatus.confirmed) {
        switch (saveContext.currentModel.requestType) {
          case DwAuthRequestType.login:
            saveContext.beforeUpdates
                .add(DwModelWrapper(object: authResponse!));
            break;
          case DwAuthRequestType.register:
            // TODO: Handle this case.
            throw UnimplementedError();
          case DwAuthRequestType.changePassword:
            final emailAuth = await EmailAuth.db.findFirstRow(session,
                where: (auth) =>
                    auth.email.equals(saveContext.currentModel.userIdentifier));
            emailAuth!.hash = await AuthConfig.current.passwordHashGenerator(
              saveContext.currentModel.extraData!['newPassword'] as String,
            );
            await EmailAuth.db.updateRow(session, emailAuth);
            break;
          case DwAuthRequestType.changeIdentifier:
            // TODO: Handle this case.
            throw UnimplementedError();
          case DwAuthRequestType.addAuthProvider:
            // TODO: Handle this case.
            throw UnimplementedError();
          case DwAuthRequestType.removeAuthProvider:
            // TODO: Handle this case.
            throw UnimplementedError();
          case DwAuthRequestType.custom:
            // TODO: Handle this case.
            throw UnimplementedError();
        }
      }

      if (saveContext.currentModel.status == DwAuthRequestStatus.pending) {
        final verificationCode = await DwCore
            .instance.authConfig?.generateVerificationCodeMethod
            ?.call(
          session,
          verificationRequest: saveContext.currentModel,
        );

        if (verificationCode != null) {
          saveContext.extras[verificationCodeKey] = verificationCode;
          saveContext.currentModel.verificationHash =
              DwAuthUtils.hashVerificationCode(verificationCode);
        }
      }
    },
    afterSaveSideEffects: (session, saveContext) async {
      if (saveContext.extras[verificationCodeKey] != null) {
        await DwCore.instance.authConfig?.sendVerificationCodeMethod?.call(
          session,
          verificationRequest: saveContext.currentModel,
          verificationCode: saveContext.extras[verificationCodeKey] as String,
        );
      }
    },
  ),
);
