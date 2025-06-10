import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dw_session_state.dart';

extension SignedInExtension on Ref {
  Future<bool> signOut() => read(dwSessionStateProvider.notifier).signOut();

  bool get signedIn => watch(
    dwSessionStateProvider.select((value) => value.signedInUserId != null),
  );

  int? get signedInUserId =>
      watch(dwSessionStateProvider.select((value) => value.signedInUserId));
}

extension SignedInWidgetExtension on WidgetRef {
  Future<bool> signOut() => read(dwSessionStateProvider.notifier).signOut();

  bool get signedIn => watch(
    dwSessionStateProvider.select((value) => value.signedInUserId != null),
  );

  int? get signedInUserId =>
      watch(dwSessionStateProvider.select((value) => value.signedInUserId));
}
