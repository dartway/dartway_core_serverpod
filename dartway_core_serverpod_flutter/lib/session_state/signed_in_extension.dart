import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dw_session_state.dart';

extension SignedInExtension on Ref {
  Future<bool> signOut() => read(dwSessionStateProvider.notifier).signOut();

  bool get signedIn => watch(
    dwSessionStateProvider.select((value) => value.signedInUserId != null),
  );

  DwBackendFilter? get userProfileBackendFilter => watch(
    dwSessionStateProvider.select((value) => value.userProfileBackendFilter),
  );

  int? get signedInUserId =>
      watch(dwSessionStateProvider.select((value) => value.signedInUserId));
}

extension SignedInWidgetExtension on WidgetRef {
  Future<bool> signOut() => read(dwSessionStateProvider.notifier).signOut();

  bool get signedIn => watch(
    dwSessionStateProvider.select((value) => value.signedInUserId != null),
  );

  DwBackendFilter? get userProfileBackendFilter => watch(
    dwSessionStateProvider.select((value) => value.userProfileBackendFilter),
  );

  int? get signedInUserId =>
      watch(dwSessionStateProvider.select((value) => value.signedInUserId));
}
