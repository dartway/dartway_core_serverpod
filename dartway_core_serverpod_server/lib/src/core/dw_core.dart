// lib/dartway_core_serverpod_server.dart

// dw.dart
import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:dartway_core_serverpod_server/src/business/crud_config/dartway_default_configs/user_info_default_crud_config.dart';
import 'package:dartway_core_serverpod_shared/dartway_core_serverpod_shared.dart';
import 'package:serverpod/serverpod.dart';

import '../business/crud_config/dartway_default_configs/user_profile_default_crud_config_builder.dart';

class DwCore<UserProfileClass extends TableRow> {
  final Table userProfileTable;
  final Map<String, Map<String, DwCrudConfig>> _crudConfiguration = {};
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
      required DwAuthDataStash dwDataStash,
    }) userProfileConstructor,
  }) {
    if (_instance != null) {
      throw Exception('DwCore already initialized');
    }
    _instance = DwCore<UserProfileClass>._(
      userProfileTable: userProfileTable,
      crudConfigurations: crudConfigurations,
      userProfileConstructor: userProfileConstructor,
    );

    return _instance! as DwCore<UserProfileClass>;
  }

  DwCore._({
    required this.userProfileTable,
    required List<DwCrudConfig> crudConfigurations,
    required Future<UserProfileClass> Function({
      required int userInfoId,
      required DwAuthDataStash dwDataStash,
    }) userProfileConstructor,
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
