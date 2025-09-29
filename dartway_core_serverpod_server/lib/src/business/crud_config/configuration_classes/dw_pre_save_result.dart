import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

/// Hook result: processed model + extra entities.
class DwPreSaveResult<T extends TableRow> {
  const DwPreSaveResult({
    required this.model,
    this.beforeUpdates = const [],
  });

  final T model;
  final List<DwModelWrapper> beforeUpdates;
}
