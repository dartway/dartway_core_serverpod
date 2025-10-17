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

      if (authResponse?.success == true) {
        saveContext.currentModel.status = DwAuthRequestStatus.confirmed;
        saveContext.beforeUpdates.add(DwModelWrapper(object: authResponse!));
      } else {
        saveContext.currentModel.status = DwAuthRequestStatus.pending;

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
