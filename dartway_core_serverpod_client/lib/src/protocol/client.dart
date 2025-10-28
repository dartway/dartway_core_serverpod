/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:dartway_core_serverpod_client/src/domain/api/dw_api_response.dart'
    as _i3;
import 'package:dartway_core_serverpod_client/src/domain/api/dw_model_wrapper.dart'
    as _i4;
import 'package:dartway_core_serverpod_client/src/domain/api/dw_backend_filter.dart'
    as _i5;
import 'package:serverpod_serialization/src/serialization.dart' as _i6;
import 'package:dartway_core_serverpod_client/src/protocol/cloud_files/dw_cloud_file.dart'
    as _i7;

/// {@category Endpoint}
class EndpointDwCrud extends _i1.EndpointRef {
  EndpointDwCrud(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dartway_core_serverpod.dwCrud';

  _i2.Future<_i3.DwApiResponse<_i4.DwModelWrapper>> getOne({
    required String className,
    required _i5.DwBackendFilter filter,
    String? apiGroup,
  }) =>
      caller.callServerEndpoint<_i3.DwApiResponse<_i4.DwModelWrapper>>(
        'dartway_core_serverpod.dwCrud',
        'getOne',
        {
          'className': className,
          'filter': filter,
          'apiGroup': apiGroup,
        },
      );

  _i2.Future<_i3.DwApiResponse<int>> getCount({
    required String className,
    _i5.DwBackendFilter? filter,
    String? apiGroup,
  }) =>
      caller.callServerEndpoint<_i3.DwApiResponse<int>>(
        'dartway_core_serverpod.dwCrud',
        'getCount',
        {
          'className': className,
          'filter': filter,
          'apiGroup': apiGroup,
        },
      );

  _i2.Future<_i3.DwApiResponse<List<_i4.DwModelWrapper>>> getAll({
    required String className,
    _i5.DwBackendFilter? filter,
    int? limit,
    int? offset,
    String? apiGroup,
  }) =>
      caller.callServerEndpoint<_i3.DwApiResponse<List<_i4.DwModelWrapper>>>(
        'dartway_core_serverpod.dwCrud',
        'getAll',
        {
          'className': className,
          'filter': filter,
          'limit': limit,
          'offset': offset,
          'apiGroup': apiGroup,
        },
      );

  _i2.Future<_i3.DwApiResponse<_i4.DwModelWrapper>> saveModel({
    required _i4.DwModelWrapper wrappedModel,
    String? apiGroup,
  }) =>
      caller.callServerEndpoint<_i3.DwApiResponse<_i4.DwModelWrapper>>(
        'dartway_core_serverpod.dwCrud',
        'saveModel',
        {
          'wrappedModel': wrappedModel,
          'apiGroup': apiGroup,
        },
      );

  _i2.Stream<_i6.SerializableModel> saveModelStream({
    required _i4.DwModelWrapper wrappedModel,
    required String channelName,
    String? apiGroup,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i6.SerializableModel>,
          _i6.SerializableModel>(
        'dartway_core_serverpod.dwCrud',
        'saveModelStream',
        {
          'wrappedModel': wrappedModel,
          'channelName': channelName,
          'apiGroup': apiGroup,
        },
        {},
      );

  _i2.Future<_i3.DwApiResponse<bool>> delete({
    required String className,
    required int modelId,
    String? apiGroup,
  }) =>
      caller.callServerEndpoint<_i3.DwApiResponse<bool>>(
        'dartway_core_serverpod.dwCrud',
        'delete',
        {
          'className': className,
          'modelId': modelId,
          'apiGroup': apiGroup,
        },
      );
}

/// {@category Endpoint}
class EndpointDwRealTime extends _i1.EndpointRef {
  EndpointDwRealTime(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dartway_core_serverpod.dwRealTime';
}

/// {@category Endpoint}
class EndpointDwUpload extends _i1.EndpointRef {
  EndpointDwUpload(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dartway_core_serverpod.dwUpload';

  _i2.Future<String?> getUploadDescription({required String path}) =>
      caller.callServerEndpoint<String?>(
        'dartway_core_serverpod.dwUpload',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<_i7.DwCloudFile?> verifyUpload({required String path}) =>
      caller.callServerEndpoint<_i7.DwCloudFile?>(
        'dartway_core_serverpod.dwUpload',
        'verifyUpload',
        {'path': path},
      );
}

class Caller extends _i1.ModuleEndpointCaller {
  Caller(_i1.ServerpodClientShared client) : super(client) {
    dwCrud = EndpointDwCrud(this);
    dwRealTime = EndpointDwRealTime(this);
    dwUpload = EndpointDwUpload(this);
  }

  late final EndpointDwCrud dwCrud;

  late final EndpointDwRealTime dwRealTime;

  late final EndpointDwUpload dwUpload;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'dartway_core_serverpod.dwCrud': dwCrud,
        'dartway_core_serverpod.dwRealTime': dwRealTime,
        'dartway_core_serverpod.dwUpload': dwUpload,
      };
}
