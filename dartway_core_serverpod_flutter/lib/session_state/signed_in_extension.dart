import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dw_session_state.dart';

extension SignedInExtension on Ref {
  Future<bool> signOut({bool allDevices = false}) =>
      read(dwSessionStateProvider.notifier).signOut(allDevices: allDevices);

  bool get signedIn => watch(
    dwSessionStateProvider.select((value) => value.signedInUserInfoId != null),
  );
}

extension SignedInWidgetExtension on WidgetRef {
  Future<bool> signOut({bool allDevices = false}) =>
      read(dwSessionStateProvider.notifier).signOut(allDevices: allDevices);

  bool get signedIn => watch(
    dwSessionStateProvider.select((value) => value.signedInUserInfoId != null),
  );
}
