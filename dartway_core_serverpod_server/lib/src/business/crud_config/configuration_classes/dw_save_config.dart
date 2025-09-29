import 'dart:async';

import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

class DwSaveConfig<T extends TableRow> {
  const DwSaveConfig({
    required this.allowSave,
    this.validateSave,
    this.beforeSave,
    this.afterSave,
    this.afterSaveSideEffects,
  });

  /// Permissions check (both insert & update).
  final Future<bool> Function(
    Session session,
    T? initialModel,
    T newModel,
  ) allowSave;

  /// Validation hook (return error string or null).
  final Future<String?> Function(
    Session session,
    T? initialModel,
    T newModel,
  )? validateSave;

  /// Pre-processing inside transaction.
  /// Returns processed model and extra entities.
  final Future<DwPreSaveResult<T>> Function(
    Session session,
    Transaction transaction,
    T? initialModel,
    T newModel,
  )? beforeSave;

  /// Post-processing inside transaction.
  final Future<List<DwModelWrapper>> Function(
    Session session,
    Transaction transaction,
    T? initialModel,
    T savedModel, {
    List<DwModelWrapper>? beforeUpdates,
  })? afterSave;

  /// Side effects outside transaction (notifications, async tasks, etc.).
  final Future<void> Function(
    Session session,
    T? initialModel,
    T savedModel, {
    List<DwModelWrapper>? beforeUpdates,
    List<DwModelWrapper>? afterUpdates,
  })? afterSaveSideEffects;

  Future<DwApiResponse<DwModelWrapper>> save(
    Session session,
    T model,
  ) async {
    final isInsert = model.id == null;
    final initialModel =
        isInsert ? null : await session.db.findById<T>(model.id!);

    if (initialModel == null && !isInsert) {
      return DwApiResponse(
        isOk: false,
        value: null,
        error: 'Model with id ${model.id} not found, possibly deleted earlier',
      );
    }

    // Permissions
    if (true != await allowSave(session, initialModel, model)) {
      return DwApiResponse.forbidden();
    }

    // Validation
    if (validateSave != null) {
      final error = await validateSave!(session, initialModel, model);
      if (error != null) {
        return DwApiResponse(isOk: false, value: null, error: error);
      }
    }

    // Transaction
    List<DwModelWrapper>? beforeUpdates;
    late T savedModel;
    List<DwModelWrapper>? afterUpdates;

    try {
      await session.db.transaction((transaction) async {
        T processed = model;

        if (beforeSave != null) {
          final res =
              await beforeSave!(session, transaction, initialModel, model);
          processed = res.model;
          beforeUpdates = res.beforeUpdates;
        }

        savedModel = isInsert
            ? await session.db.insertRow<T>(processed, transaction: transaction)
            : await session.db
                .updateRow<T>(processed, transaction: transaction);

        if (afterSave != null) {
          afterUpdates = await afterSave!(
            session,
            transaction,
            initialModel,
            savedModel,
            beforeUpdates: beforeUpdates,
          );
        }
      });
    } on DatabaseException catch (e) {
      return DwApiResponse(
        isOk: false,
        value: null,
        error: 'Database error during save: $e',
      );
    }

    // Side effects (outside transaction)
    if (afterSaveSideEffects != null) {
      unawaited(afterSaveSideEffects!(
        session,
        initialModel,
        savedModel,
        beforeUpdates: beforeUpdates,
        afterUpdates: afterUpdates,
      ));
    }

    final updatedModels = [
      if (beforeUpdates != null) ...beforeUpdates!,
      DwModelWrapper(object: savedModel),
      if (afterUpdates != null) ...afterUpdates!,
    ];

    return DwApiResponse(
      isOk: true,
      value: DwModelWrapper(object: savedModel),
      updatedModels: updatedModels,
    );
  }
}
