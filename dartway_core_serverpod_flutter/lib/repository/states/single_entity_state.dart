import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DwSingleEntityState<T extends SerializableModel>
    extends FamilyAsyncNotifier<T?, DwSingleEntityStateConfig> {
  @override
  Future<T?> build(DwSingleEntityStateConfig config) async {
    debugPrint("Getting single ${DwRepository.typeName<T>()} with id $arg");

    return await DwCore.endpointCaller.dwCrud
        .getOne(
          className: DwRepository.typeName<T>(),
          filter: arg.backendFilter,
        )
        .then((response) => ref.processApiResponse<DwModelWrapper>(response))
        .then((res) => res == null ? null : res.model as T);
  }
}
