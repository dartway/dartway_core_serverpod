import 'package:dartway_core_serverpod_server/src/business/crud_config/dw_get_one_config.dart';
import 'package:serverpod/serverpod.dart';

import 'dw_get_all_config.dart';
import 'dw_post_config.dart';

abstract class DwCrudConfig<T extends TableRow> {
  static final Map<String, DwCrudConfig> _serverConfiguration = {};

  static initConfiguration(List<DwCrudConfig> configuration) {
    _serverConfiguration.addEntries(
      [
        // fcmTokenConfig,
        // userInfoConfig,
        // ...defaultChatCrudConfigs,
        ...configuration,
      ].map(
        (config) => MapEntry(config.className, config),
      ),
    );
  }

  static DwCrudConfig<TableRow>? getCaller(String className) =>
      _serverConfiguration[className];

  const DwCrudConfig({
    required this.table,
    this.getOneCustomConfigs,
    this.getAll,
    this.post,
  });

  final Table table;
  final List<DwGetOneConfig<T>>? getOneCustomConfigs;

  final DwGetAllConfig<T>? getAll;
  final DwPostConfig<T>? post;

  String get className => T.toString();
}
