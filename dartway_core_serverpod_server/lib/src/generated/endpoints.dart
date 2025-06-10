/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/dw_crud_endpoint.dart' as _i2;
import '../endpoints/dw_real_time_endpoint.dart' as _i3;
import '../endpoints/dw_upload_endpoint.dart' as _i4;
import 'package:dartway_core_serverpod_server/src/extra_classes/dw_backend_filter.dart'
    as _i5;
import 'package:dartway_core_serverpod_server/src/extra_classes/dw_model_wrapper.dart'
    as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'dwCrud': _i2.DwCrudEndpoint()
        ..initialize(
          server,
          'dwCrud',
          'dartway_core_serverpod',
        ),
      'dwRealTime': _i3.DwRealTimeEndpoint()
        ..initialize(
          server,
          'dwRealTime',
          'dartway_core_serverpod',
        ),
      'dwUpload': _i4.DwUploadEndpoint()
        ..initialize(
          server,
          'dwUpload',
          'dartway_core_serverpod',
        ),
    };
    connectors['dwCrud'] = _i1.EndpointConnector(
      name: 'dwCrud',
      endpoint: endpoints['dwCrud']!,
      methodConnectors: {
        'getOneCustom': _i1.MethodConnector(
          name: 'getOneCustom',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i5.DwBackendFilter>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i2.DwCrudEndpoint).getOneCustom(
            session,
            className: params['className'],
            filter: params['filter'],
          ),
        ),
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i5.DwBackendFilter?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i2.DwCrudEndpoint).getAll(
            session,
            className: params['className'],
            filter: params['filter'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'saveModels': _i1.MethodConnector(
          name: 'saveModels',
          params: {
            'wrappedModels': _i1.ParameterDescription(
              name: 'wrappedModels',
              type: _i1.getType<List<_i6.DwModelWrapper>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i2.DwCrudEndpoint).saveModels(
            session,
            wrappedModels: params['wrappedModels'],
          ),
        ),
        'saveModel': _i1.MethodConnector(
          name: 'saveModel',
          params: {
            'wrappedModel': _i1.ParameterDescription(
              name: 'wrappedModel',
              type: _i1.getType<_i6.DwModelWrapper>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i2.DwCrudEndpoint).saveModel(
            session,
            wrappedModel: params['wrappedModel'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'modelId': _i1.ParameterDescription(
              name: 'modelId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i2.DwCrudEndpoint).delete(
            session,
            className: params['className'],
            modelId: params['modelId'],
          ),
        ),
      },
    );
    connectors['dwRealTime'] = _i1.EndpointConnector(
      name: 'dwRealTime',
      endpoint: endpoints['dwRealTime']!,
      methodConnectors: {},
    );
    connectors['dwUpload'] = _i1.EndpointConnector(
      name: 'dwUpload',
      endpoint: endpoints['dwUpload']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwUpload'] as _i4.DwUploadEndpoint)
                  .getUploadDescription(
            session,
            path: params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwUpload'] as _i4.DwUploadEndpoint).verifyUpload(
            session,
            path: params['path'],
          ),
        ),
      },
    );
  }
}
