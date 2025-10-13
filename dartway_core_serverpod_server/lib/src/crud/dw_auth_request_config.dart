import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

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
      }
    },
  ),
);
