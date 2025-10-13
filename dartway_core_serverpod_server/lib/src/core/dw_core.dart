// lib/dartway_core_serverpod_server.dart

// dw.dart
import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:dartway_core_serverpod_shared/dartway_core_serverpod_shared.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../crud/dw_auth_request_config.dart';

part '../crud/user_info_default_crud_config.dart';
part '../crud/user_profile_default_crud_config_builder.dart';

class DwCore<UserProfileClass extends TableRow> {
  final Table userProfileTable;
  final Map<String, Map<String, DwCrudConfig>> _crudConfiguration = {};
  late final DwAuthConfig? _authConfig;
  late final ColumnInt _userInfoIdColumn;

  static DwCore? _instance;

  static DwCore get instance {
    if (_instance == null) {
      throw Exception('DwCore not initialized. Call init() first.');
    }
    return _instance!;
  }

  /// Initialize DartWay Core
  static DwCore<UserProfileClass> init<UserProfileClass extends TableRow>({
    required Table userProfileTable,
    required List<DwCrudConfig> crudConfigurations,
    required Future<UserProfileClass> Function({
      required int userInfoId,
      required String userIdentifier,
      required Map<String, String> registrationExtraData,
    }) userProfileConstructor,
    DwAuthConfig? authConfig,
  }) {
    if (_instance != null) {
      throw Exception('DwCore already initialized');
    }
    _instance = DwCore<UserProfileClass>._(
      userProfileTable: userProfileTable,
      crudConfigurations: crudConfigurations,
      userProfileConstructor: userProfileConstructor,
      authConfig: authConfig,
    );

    return _instance! as DwCore<UserProfileClass>;
  }

  DwCore._({
    required this.userProfileTable,
    required List<DwCrudConfig> crudConfigurations,
    required Future<UserProfileClass> Function({
      required int userInfoId,
      required String userIdentifier,
      required Map<String, String> registrationExtraData,
    }) userProfileConstructor,
    required DwAuthConfig? authConfig,
  }) {
    _userInfoIdColumn = userProfileTable.columns.firstWhereOrThrow(
      (column) =>
          column is ColumnInt &&
          column.columnName == DwCoreConst.userInfoIdColumnName,
      'User profile table must have a userInfoId column',
    ) as ColumnInt;

    _crudConfiguration[DwCoreConst.dartwayInternalApi] = Map.fromEntries(
      [
        userInfoDefaultCrudConfig,
        userProfileDefaultCrudConfigBuilder(
          userProfileTable,
          userProfileConstructor,
        ),
        dwAuthRequestConfig
      ].map(
        (config) => MapEntry(config.className, config),
      ),
    );
    _crudConfiguration[DwCoreConst.defaultApi] = Map.fromEntries(
      [
        ...crudConfigurations,
      ].map(
        (config) => MapEntry(config.className, config),
      ),
    );
    _authConfig = authConfig;
  }

  DwAuthConfig? get authConfig {
    if (_authConfig == null) {
      throw Exception(
        'DwAuthConfig not initialized. Configure it in DwCore.init params',
      );
    }
    return _authConfig;
  }

  DwCrudConfig<TableRow>? getCrudConfig(
    String className, {
    String? api,
  }) =>
      _crudConfiguration[api ?? DwCoreConst.defaultApi]?[className];

  Future<UserProfileClass?> currentUserProfile(Session session) async {
    final userInfoId = (await session.authenticated)?.userId;

    if (userInfoId == null) {
      return null;
    }

    final profile = await session.db.findFirstRow<UserProfileClass>(
      where: _userInfoIdColumn.equals(userInfoId),
    );

    if (profile == null) {
      session.log('Warning: User profile not found for userId $userInfoId');
    }

    return profile;
  }
}
