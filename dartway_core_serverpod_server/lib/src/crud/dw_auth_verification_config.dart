import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:dartway_core_serverpod_server/src/auth/dw_auth_utils.dart';
import 'package:serverpod/serverpod.dart';

const verificationCodeKey = 'verificationCode';

final dwAuthVerificationConfig = DwCrudConfig<DwAuthVerification>(
  table: DwAuthVerification.t,
  saveConfig: DwSaveConfig<DwAuthVerification>(
    allowSave: (Session session,
            DwSaveContext<DwAuthVerification> saveContext) async =>
        true,
    beforeSaveTransaction:
        (Session session, DwSaveContext<DwAuthVerification> saveContext) async {
      final authRequest = await DwAuthRequest.db.findById(
        session,
        saveContext.currentModel.dwAuthRequestId,
      );

      if (saveContext.currentModel.verificationCode == null ||
          authRequest?.verificationHash !=
              DwAuthUtils.hashVerificationCode(
                  saveContext.currentModel.verificationCode!)) {
        throw Exception(
          'Invalid verification code',
        );
      } else {
        saveContext.currentModel.accessToken =
            DwAuthUtils.generateSecureToken();
      }
    },
  ),
);
