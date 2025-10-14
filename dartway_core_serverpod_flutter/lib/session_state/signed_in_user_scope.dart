import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dartway_core_serverpod_flutter.dart';
import 'dw_session_state.dart';

class SignedInUserScope<UserProfileClass extends SerializableModel>
    extends ConsumerStatefulWidget {
  final Widget child;
  final Widget profileLoadingWidget;
  final StateProvider<UserProfileClass?> userProfileProvider;

  const SignedInUserScope({
    super.key,
    required this.child,
    required this.userProfileProvider,
    this.profileLoadingWidget = const Center(
      child: CircularProgressIndicator(),
    ),
  });

  @override
  ConsumerState<SignedInUserScope<UserProfileClass>> createState() =>
      _SignedInUserScopeState<UserProfileClass>();
}

class _SignedInUserScopeState<UserProfileClass extends SerializableModel>
    extends ConsumerState<SignedInUserScope<UserProfileClass>> {
  int? _currentUserInfoId;
  bool _isLoading = false;
  bool _delayed = false;

  @override
  void initState() {
    super.initState();
    _currentUserInfoId = ref.read(dwSessionStateProvider).signedInUserInfoId;
  }

  @override
  Widget build(BuildContext context) {
    // Создаём listener один раз
    ref.listen(dwSessionStateProvider, (prev, next) {
      final prevId = prev?.signedInUserInfoId;
      final nextId = next.signedInUserInfoId;

      if (prevId != nextId) {
        setState(() {
          _isLoading = true;
          _delayed = true;
          _currentUserInfoId = nextId;
        });

        // плавная пауза для "мягкости" при смене
        Future.delayed(const Duration(milliseconds: 150)).then((_) {
          if (mounted) {
            setState(() {
              _delayed = false;
            });
          }
        });
      }
    });

    // Загружаем профиль реактивно через AsyncValue
    final asyncProfile =
        _currentUserInfoId == null
            ? AsyncValue.data(null)
            : ref.watchModel<UserProfileClass>(
              apiGroupOverride: DwCoreConst.dartwayInternalApi,
              filter: DwBackendFilter<int>.value(
                type: DwBackendFilterType.equals,
                fieldName: DwCoreConst.userInfoIdColumnName,
                fieldValue: _currentUserInfoId,
              ),
            );

    final content = asyncProfile.when(
      loading: () => widget.profileLoadingWidget,
      error: (e, _) => Center(child: Text('Ошибка загрузки профиля: $e')),
      data: (profile) {
        // После успешной загрузки
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          ref.read(widget.userProfileProvider.notifier).state = profile;

          // Если только что сменился userId — ждём 200 мс
          if (_isLoading) {
            await Future.delayed(const Duration(milliseconds: 200));
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          }
        });

        // Если загрузка ещё не снята — показываем лоадер
        if (_isLoading || _delayed) {
          return widget.profileLoadingWidget;
        }

        // Основной контент
        return widget.child;
      },
    );

    // ⚡️ AnimatedSwitcher делает плавное появление/исчезновение контента
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: content,
    );
  }
}

// class SignedInUserScope<UserProfileClass extends SerializableModel>
//     extends ConsumerStatefulWidget {
//   final Widget child;
//   final Widget profileLoadingWidget;
//   final StateProvider<UserProfileClass?> userProfileProvider;

//   const SignedInUserScope({
//     super.key,
//     required this.child,
//     required this.userProfileProvider,
//     this.profileLoadingWidget = const Center(
//       child: CircularProgressIndicator(),
//     ),
//   });

//   @override
//   ConsumerState<SignedInUserScope<UserProfileClass>> createState() =>
//       _SignedInUserScopeState<UserProfileClass>();
// }

// class _SignedInUserScopeState<UserProfileClass extends SerializableModel>
//     extends ConsumerState<SignedInUserScope<UserProfileClass>> {
//   bool _isDelayedLoading = false;
//   int? _lastUserInfoId;

//   @override
//   Widget build(BuildContext context) {
//     final signedInUserInfoId = ref.watch(
//       dwSessionStateProvider.select((v) => v.signedInUserInfoId),
//     );

//     // // 1️⃣ Если пользователь не вошёл
//     // if (signedInUserInfoId == null) {
//     //   WidgetsBinding.instance.addPostFrameCallback((_) {
//     //     ref.read(widget.userProfileProvider.notifier).state = null;
//     //   });
//     //   return widget.profileLoadingWidget;
//     // }

//     // 2️⃣ Если ID изменился → сбрасываем состояние и включаем loading
//     if (_lastUserInfoId != signedInUserInfoId && !_isDelayedLoading) {
//       _lastUserInfoId = signedInUserInfoId;
//       _isDelayedLoading = true;
//     }

//     // 3️⃣ Загружаем профиль реактивно через AsyncValue
//     final asyncProfile =
//         signedInUserInfoId == null
//             ? AsyncValue.data(null)
//             : ref.watchModel<UserProfileClass>(
//               apiGroupOverride: DwCoreConst.dartwayInternalApi,
//               filter: DwBackendFilter<int>.value(
//                 type: DwBackendFilterType.equals,
//                 fieldName: DwCoreConst.userInfoIdColumnName,
//                 fieldValue: signedInUserInfoId,
//               ),
//             );

//     return asyncProfile.when(
//       loading: () => widget.profileLoadingWidget,
//       error: (e, _) => Center(child: Text('Ошибка загрузки профиля: $e')),
//       data: (profile) {
//         // 4️⃣ После загрузки — обновляем профиль и ждём 200 мс
//         WidgetsBinding.instance.addPostFrameCallback((_) async {
//           ref.read(widget.userProfileProvider.notifier).state = profile;

//           // если мы впервые загружаем после смены userId — подержим загрузку
//           if (_isDelayedLoading) {
//             await Future.delayed(const Duration(milliseconds: 200));
//             if (mounted) {
//               setState(() {
//                 _isDelayedLoading = false;
//               });
//             }
//           }
//         });

//         // 5️⃣ Пока ждём — всё ещё показываем загрузку
//         if (_isDelayedLoading) {
//           return widget.profileLoadingWidget;
//         }

//         // 6️⃣ После задержки — рендерим контент
//         return widget.child;
//       },
//     );
//   }
// }
