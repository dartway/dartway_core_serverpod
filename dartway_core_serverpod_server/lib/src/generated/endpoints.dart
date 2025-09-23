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
import '../endpoints/auth/dw_phone_auth_endpoint.dart' as _i2;
import '../endpoints/dw_crud_endpoint.dart' as _i3;
import '../endpoints/dw_real_time_endpoint.dart' as _i4;
import '../endpoints/dw_upload_endpoint.dart' as _i5;
import 'package:dartway_core_serverpod_server/src/generated/auth/phone/dw_phone_verification_request_type.dart'
    as _i6;
import 'package:dartway_core_serverpod_server/src/domain/dw_backend_filter.dart'
    as _i7;
import 'package:dartway_core_serverpod_server/src/domain/dw_model_wrapper.dart'
    as _i8;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'dwPhoneAuth': _i2.DwPhoneAuthEndpoint()
        ..initialize(
          server,
          'dwPhoneAuth',
          'dartway_core_serverpod',
        ),
      'dwCrud': _i3.DwCrudEndpoint()
        ..initialize(
          server,
          'dwCrud',
          'dartway_core_serverpod',
        ),
      'dwRealTime': _i4.DwRealTimeEndpoint()
        ..initialize(
          server,
          'dwRealTime',
          'dartway_core_serverpod',
        ),
      'dwUpload': _i5.DwUploadEndpoint()
        ..initialize(
          server,
          'dwUpload',
          'dartway_core_serverpod',
        ),
    };
    connectors['dwPhoneAuth'] = _i1.EndpointConnector(
      name: 'dwPhoneAuth',
      endpoint: endpoints['dwPhoneAuth']!,
      methodConnectors: {
        'verifyWithOneTimePassword': _i1.MethodConnector(
          name: 'verifyWithOneTimePassword',
          params: {
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'oneTimePassword': _i1.ParameterDescription(
              name: 'oneTimePassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwPhoneAuth'] as _i2.DwPhoneAuthEndpoint)
                  .verifyWithOneTimePassword(
            session,
            params['phoneNumber'],
            params['oneTimePassword'],
          ),
        ),
        'forceVerification': _i1.MethodConnector(
          name: 'forceVerification',
          params: {
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sendAuthenticationResponseToStream': _i1.ParameterDescription(
              name: 'sendAuthenticationResponseToStream',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwPhoneAuth'] as _i2.DwPhoneAuthEndpoint)
                  .forceVerification(
            session,
            phoneNumber: params['phoneNumber'],
            sendAuthenticationResponseToStream:
                params['sendAuthenticationResponseToStream'],
          ),
        ),
        'startVerification': _i1.MethodStreamConnector(
          name: 'startVerification',
          params: {
            'requestType': _i1.ParameterDescription(
              name: 'requestType',
              type: _i1.getType<_i6.DwPhoneVerificationRequestType>(),
              nullable: false,
            ),
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'requestExtraData': _i1.ParameterDescription(
              name: 'requestExtraData',
              type: _i1.getType<Map<String, String>?>(),
              nullable: true,
            ),
            'verificationExtraParams': _i1.ParameterDescription(
              name: 'verificationExtraParams',
              type: _i1.getType<Map<String, String>?>(),
              nullable: true,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['dwPhoneAuth'] as _i2.DwPhoneAuthEndpoint)
                  .startVerification(
            session,
            requestType: params['requestType'],
            phoneNumber: params['phoneNumber'],
            requestExtraData: params['requestExtraData'],
            verificationExtraParams: params['verificationExtraParams'],
          ),
        ),
      },
    );
    connectors['dwCrud'] = _i1.EndpointConnector(
      name: 'dwCrud',
      endpoint: endpoints['dwCrud']!,
      methodConnectors: {
        'getOne': _i1.MethodConnector(
          name: 'getOne',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i7.DwBackendFilter>(),
              nullable: false,
            ),
            'apiGroup': _i1.ParameterDescription(
              name: 'apiGroup',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i3.DwCrudEndpoint).getOne(
            session,
            className: params['className'],
            filter: params['filter'],
            apiGroup: params['apiGroup'],
          ),
        ),
        'getCount': _i1.MethodConnector(
          name: 'getCount',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i7.DwBackendFilter?>(),
              nullable: true,
            ),
            'apiGroup': _i1.ParameterDescription(
              name: 'apiGroup',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i3.DwCrudEndpoint).getCount(
            session,
            className: params['className'],
            filter: params['filter'],
            apiGroup: params['apiGroup'],
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
              type: _i1.getType<_i7.DwBackendFilter?>(),
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
            'apiGroup': _i1.ParameterDescription(
              name: 'apiGroup',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i3.DwCrudEndpoint).getAll(
            session,
            className: params['className'],
            filter: params['filter'],
            limit: params['limit'],
            offset: params['offset'],
            apiGroup: params['apiGroup'],
          ),
        ),
        'saveModel': _i1.MethodConnector(
          name: 'saveModel',
          params: {
            'wrappedModel': _i1.ParameterDescription(
              name: 'wrappedModel',
              type: _i1.getType<_i8.DwModelWrapper>(),
              nullable: false,
            ),
            'apiGroup': _i1.ParameterDescription(
              name: 'apiGroup',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i3.DwCrudEndpoint).saveModel(
            session,
            wrappedModel: params['wrappedModel'],
            apiGroup: params['apiGroup'],
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
            'apiGroup': _i1.ParameterDescription(
              name: 'apiGroup',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dwCrud'] as _i3.DwCrudEndpoint).delete(
            session,
            className: params['className'],
            modelId: params['modelId'],
            apiGroup: params['apiGroup'],
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
              (endpoints['dwUpload'] as _i5.DwUploadEndpoint)
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
              (endpoints['dwUpload'] as _i5.DwUploadEndpoint).verifyUpload(
            session,
            path: params['path'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i9.Endpoints()..initializeEndpoints(server);
  }
}
