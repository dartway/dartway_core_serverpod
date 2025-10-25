import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:dartway_core_serverpod_server/src/crud/dw_auth_verification_config.dart';
import 'package:dartway_core_serverpod_shared/dartway_core_serverpod_shared.dart';
import 'package:serverpod/serverpod.dart';

import '../crud/dw_auth_key_config.dart';
import '../crud/dw_auth_request_config.dart';

class DwCore<UserProfileClass extends TableRow> {
  final Table userProfileTable;
  final Map<String, Map<String, DwCrudConfig>> _crudConfiguration = {};
  late final ColumnInt _userInfoIdColumn;
  late final ColumnString _userIdentifierColumn;
  late final Include? _userProfileInclude;

  /// Auth module (optional)
  late final DwAuth<UserProfileClass>? auth;

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
    Include? userProfileInclude,
    // required Future<UserProfileClass> Function({
    //   required int userInfoId,
    //   required String userIdentifier,
    //   required Map<String, String> registrationExtraData,
    // }) userProfileConstructor,
    DwAuthConfig? authConfig,
  }) {
    if (_instance != null) {
      throw Exception('DwCore already initialized');
    }

    final instance = DwCore<UserProfileClass>._(
      userProfileTable: userProfileTable,
      crudConfigurations: crudConfigurations,
      userProfileInclude: userProfileInclude,
      // userProfileConstructor: userProfileConstructor,
      auth: authConfig != null
          ? DwAuth.init<UserProfileClass>(config: authConfig)
          : null,
    );

    _instance = instance;
    return instance;
  }

  DwCore._({
    required this.userProfileTable,
    required List<DwCrudConfig> crudConfigurations,
    required Include? userProfileInclude,
    // required Future<UserProfileClass> Function({
    //   required int userInfoId,
    //   required String userIdentifier,
    //   required Map<String, String> registrationExtraData,
    // }) userProfileConstructor,
    required this.auth,
  }) : _userProfileInclude = userProfileInclude {
    _userInfoIdColumn = userProfileTable.columns.firstWhereOrThrow(
      (column) =>
          column is ColumnInt &&
          column.columnName == DwCoreConst.userProfileIdColumnName,
      'User profile table must have an int ${DwCoreConst.userProfileIdColumnName} column',
    ) as ColumnInt;

    _userIdentifierColumn = userProfileTable.columns.firstWhereOrThrow(
      (column) =>
          column is ColumnString &&
          column.columnName == DwCoreConst.userIdentifierColumnName,
      'User profile table must have a String ${DwCoreConst.userIdentifierColumnName} column',
    ) as ColumnString;

    _crudConfiguration[DwCoreConst.dartwayInternalApi] = Map.fromEntries(
      [
        dwAuthRequestConfig,
        dwAuthVerificationConfig,
        dwAuthKeyConfig,
      ].map(
        (config) => MapEntry(config.className, config),
      ),
    );

    _crudConfiguration[DwCoreConst.defaultApi] = Map.fromEntries(
      crudConfigurations.map(
        (config) => MapEntry(config.className, config),
      ),
    );
  }

  DwCrudConfig<TableRow>? getCrudConfig(
    String className, {
    String? api,
  }) =>
      _crudConfiguration[api ?? DwCoreConst.defaultApi]?[className];

  Future<UserProfileClass?> getUserProfile(Session session, int userId) async {
    final profile = await session.db.findFirstRow<UserProfileClass>(
      where: _userInfoIdColumn.equals(userId),
      include: _userProfileInclude,
    );

    if (profile == null) {
      session.log('Warning: User profile not found for userId $userId');
    }

    return profile;
  }

  Future<UserProfileClass?> getUserProfileByIdentifier(
    Session session,
    String identifier,
  ) async {
    final profile = await session.db.findFirstRow<UserProfileClass>(
      where: _userIdentifierColumn.equals(identifier),
      include: _userProfileInclude,
    );

    if (profile == null) {
      session.log('Warning: User profile not found for identifier $identifier');
    }

    return profile;
  }

  Future<UserProfileClass?> currentUserProfile(Session session) async {
    final userId = (await session.authenticated)?.userId;
    if (userId == null) return null;
    return getUserProfile(session, userId);
  }
}
