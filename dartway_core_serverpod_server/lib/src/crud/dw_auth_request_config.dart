import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:dartway_core_serverpod_server/src/auth/dw_auth_request_extension.dart';
import 'package:dartway_core_serverpod_server/src/auth/dw_auth_utils.dart';
import 'package:serverpod/serverpod.dart';

const verificationCodeKey = 'verificationCode';

final dwAuthRequestConfig = DwCrudConfig<DwAuthRequest>(
  table: DwAuthRequest.t,
  saveConfig: DwSaveConfig<DwAuthRequest>(
    allowSave: (Session session, DwSaveContext<DwAuthRequest> ctx) async {
      // Update is not allowed
      if (ctx.currentModel.id != null) {
        // TODO: implement centralized logging and alerting
        session.log(
          'Attempt to update DwAuthRequest with id=${ctx.currentModel.id} rejected',
          level: LogLevel.warning,
        );
        throw Exception('DwAuthRequest objects cannot be updated.');
      }

      return true;
    },
    beforeSaveTransaction: (
      Session session,
      DwSaveContext<DwAuthRequest> saveContext,
    ) async {
      final userProfile =
          await saveContext.currentModel.findRelatedUserProfile(session);

      saveContext.extras['userProfile'] = userProfile;

      await saveContext.currentModel
          .tryVerify(session, userProfile: userProfile);

      if (saveContext.currentModel.status ==
          DwAuthRequestStatus.pendingVerification) {
        final verificationCode = await DwCore
            .instance.auth!.config.generateVerificationCodeMethod
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
    afterSaveTransaction: (
      Session session,
      DwSaveContext<DwAuthRequest> saveContext,
    ) async {
      if (saveContext.currentModel.status == DwAuthRequestStatus.verified) {
        saveContext.afterUpdates.addAll(
          await saveContext.currentModel.onVerified(
            session,
            userProfile:
                saveContext.extras['userProfile'] as SerializableModel?,
          ),
        );
      }
    },
    afterSaveSideEffects: (session, saveContext) async {
      if (saveContext.extras[verificationCodeKey] != null) {
        await DwCore.instance.auth!.config.sendVerificationCodeMethod?.call(
          session,
          verificationRequest: saveContext.currentModel,
          verificationCode: saveContext.extras[verificationCodeKey] as String,
        );
      }
    },
  ),
);
