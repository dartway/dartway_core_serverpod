import 'package:dartway_flutter/dartway_flutter.dart';
import 'package:dartway_core_serverpod_shared/dartway_core_serverpod_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dartway_core_serverpod_flutter.dart';
import 'dw_session_state.dart';

class SignedInUserScope<UserProfileClass extends SerializableModel>
    extends ConsumerWidget {
  final Widget child;
  final Widget profileLoadingWidget;

  /// The provider that will be overridden with the current user profile.
  /// This provider is guaranteed to contain a non-null value inside this scope.
  final Provider<UserProfileClass?> userProfileProvider;

  const SignedInUserScope({
    super.key,
    required this.child,
    required this.userProfileProvider,
    this.profileLoadingWidget = const Center(
      child: CircularProgressIndicator(),
    ),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signedInUserInfoId = ref.watch(
      dwSessionStateProvider.select((value) => value.signedInUserInfoId),
    );

    // if (signedInUserInfoId == null) {
    //   return notSignedInChild;
    // }

    final userProfileAsync =
        signedInUserInfoId == null
            ? AsyncValue.data(null)
            : ref.watchModel<UserProfileClass>(
              apiGroupOverride: DwCoreConst.dartwayInternalApi,
              filter: DwBackendFilter<int>.value(
                type: DwBackendFilterType.equals,
                fieldName: DwCoreConst.userInfoIdColumnName,
                fieldValue: signedInUserInfoId,
              ),
            );

    return userProfileAsync.when(
      data:
          (userProfile) => ProviderScope(
            overrides: [userProfileProvider.overrideWithValue(userProfile)],
            child: child,
          ),
      error: (error, stackTrace) => profileLoadingWidget,
      loading: () => profileLoadingWidget,
    );
  }
}
