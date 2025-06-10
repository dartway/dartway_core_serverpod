import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RefWatchAndReadExtension on Ref {
  Future<T?> readMayBeModelCustom<T extends SerializableModel>(
    DwBackendFilter backendFilter,
  ) async {
    return await read(
      DwRepository.singleEntityProvider<T>()(
            DwSingleEntityStateConfig(backendFilter: backendFilter),
          )
          .future,
    );
  }
}
