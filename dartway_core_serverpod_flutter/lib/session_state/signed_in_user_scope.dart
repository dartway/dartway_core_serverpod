import 'package:dartway_app/dartway_app.dart';
import 'package:dartway_core_serverpod_shared/dartway_core_serverpod_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dartway_core_serverpod_flutter.dart';
import 'dw_session_state.dart';

class SignedInUserScope<UserProfileClass extends SerializableModel>
    extends ConsumerWidget {
  final Widget child;
  final Widget notSignedInChild;

  /// The provider that will be overridden with the current user profile.
  /// This provider is guaranteed to contain a non-null value inside this scope.
  final Provider<UserProfileClass> userProfileProvider;

  const SignedInUserScope({
    super.key,
    required this.child,
    required this.userProfileProvider,
    this.notSignedInChild = const Center(child: CircularProgressIndicator()),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signedInUserInfoId = ref.watch(
      dwSessionStateProvider.select((value) => value.signedInUserInfoId),
    );

    if (signedInUserInfoId == null) {
      return notSignedInChild;
    }

    final userProfileAsync = ref.watchModel<UserProfileClass>(
      filter: DwBackendFilter<int>.value(
        type: DwBackendFilterType.equals,
        fieldName: DwCoreConst.userInfoIdColumnName,
        fieldValue: signedInUserInfoId,
      ),
    );

    return userProfileAsync.dwBuildAsync(
      childBuilder:
          (userProfile) => ProviderScope(
            overrides: [userProfileProvider.overrideWithValue(userProfile)],
            child: child,
          ),
    );
  }
}
