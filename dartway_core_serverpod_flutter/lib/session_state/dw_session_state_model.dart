// import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';

// /// Модель состояния сессии
// class DwSessionStateModel<UserProfileClass extends SerializableModel> {
//   // final int? signedInUserInfoId;
//   final UserProfileClass? signedInUserProfile;
//   final int? signedInUserId;

//   const DwSessionStateModel({
//     // required this.signedInUserInfoId,
//     required this.signedInUserProfile,
//     required this.signedInUserId,
//   });

//   DwSessionStateModel<UserProfileClass> copyWith({
//     Object? signedInUserProfile = _noChange,
//     Object? signedInUserId = _noChange,
//   }) {
//     return DwSessionStateModel<UserProfileClass>(
//       signedInUserProfile:
//           identical(signedInUserProfile, _noChange)
//               ? this.signedInUserProfile
//               : signedInUserProfile as UserProfileClass?,
//       signedInUserId:
//           identical(signedInUserId, _noChange)
//               ? this.signedInUserId
//               : signedInUserId as int?,
//     );
//   }

//   static const _noChange = Object();

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other is DwSessionStateModel<UserProfileClass> &&
//             other.signedInUserProfile == signedInUserProfile &&
//             other.signedInUserId == signedInUserId);
//   }

//   @override
//   int get hashCode =>
//       Object.hash(runtimeType, signedInUserProfile, signedInUserId);

//   @override
//   String toString() =>
//       'DwSessionStateModel( userId: $signedInUserId, userProfile: $signedInUserProfile)';
// }

import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dw_session_state_model.freezed.dart';

/// 🧠 Модель состояния сессии пользователя.
///
/// Хранит информацию о текущем пользователе и его ID.
/// Используется в DwSessionStateNotifier.
@freezed
class DwSessionStateModel<UserProfileClass extends SerializableModel>
    with _$DwSessionStateModel<UserProfileClass> {
  const factory DwSessionStateModel({
    UserProfileClass? signedInUserProfile,
    int? signedInUserId,
  }) = _DwSessionStateModel<UserProfileClass>;
}
