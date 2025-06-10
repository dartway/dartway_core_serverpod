import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dw_session_state.dart';

extension SignedInExtension on Ref {
  bool get signedIn => watch(
    dwSessionStateProvider.select((value) => value.signedInUserId != null),
  );

  int? get signedInUserId =>
      watch(dwSessionStateProvider.select((value) => value.signedInUserId));
}

extension SignedInWidgetExtension on WidgetRef {
  bool get signedIn => watch(
    dwSessionStateProvider.select((value) => value.signedInUserId != null),
  );

  int? get signedInUserId =>
      watch(dwSessionStateProvider.select((value) => value.signedInUserId));
}
