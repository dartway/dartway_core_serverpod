import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

/// Context for save operation.
/// Available on all stages of the lifecycle.
class DwSaveContext<T extends TableRow> {
  final int? currentUserId;
  final bool isInsert;
  final T? initialModel;
  Transaction? transaction;

  /// Current model (updated on each step).
  T currentModel;

  /// Updates made before and after the main save.
  final List<DwModelWrapper> beforeUpdates = [];
  final List<DwModelWrapper> afterUpdates = [];

  /// Arbitrary data between steps.
  final Map<String, dynamic> extras = {};

  DwSaveContext({
    required this.currentUserId,
    required this.isInsert,
    required this.initialModel,
    required this.currentModel,
  });
}
