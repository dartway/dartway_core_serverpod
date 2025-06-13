// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dw_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DwSessionStateModel {
  int? get signedInUserId => throw _privateConstructorUsedError;
  DwBackendFilter<dynamic>? get userProfileBackendFilter =>
      throw _privateConstructorUsedError;

  /// Create a copy of DwSessionStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DwSessionStateModelCopyWith<DwSessionStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DwSessionStateModelCopyWith<$Res> {
  factory $DwSessionStateModelCopyWith(
    DwSessionStateModel value,
    $Res Function(DwSessionStateModel) then,
  ) = _$DwSessionStateModelCopyWithImpl<$Res, DwSessionStateModel>;
  @useResult
  $Res call({
    int? signedInUserId,
    DwBackendFilter<dynamic>? userProfileBackendFilter,
  });
}

/// @nodoc
class _$DwSessionStateModelCopyWithImpl<$Res, $Val extends DwSessionStateModel>
    implements $DwSessionStateModelCopyWith<$Res> {
  _$DwSessionStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DwSessionStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedInUserId = freezed,
    Object? userProfileBackendFilter = freezed,
  }) {
    return _then(
      _value.copyWith(
            signedInUserId:
                freezed == signedInUserId
                    ? _value.signedInUserId
                    : signedInUserId // ignore: cast_nullable_to_non_nullable
                        as int?,
            userProfileBackendFilter:
                freezed == userProfileBackendFilter
                    ? _value.userProfileBackendFilter
                    : userProfileBackendFilter // ignore: cast_nullable_to_non_nullable
                        as DwBackendFilter<dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DwSessionStateModelImplCopyWith<$Res>
    implements $DwSessionStateModelCopyWith<$Res> {
  factory _$$DwSessionStateModelImplCopyWith(
    _$DwSessionStateModelImpl value,
    $Res Function(_$DwSessionStateModelImpl) then,
  ) = __$$DwSessionStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? signedInUserId,
    DwBackendFilter<dynamic>? userProfileBackendFilter,
  });
}

/// @nodoc
class __$$DwSessionStateModelImplCopyWithImpl<$Res>
    extends _$DwSessionStateModelCopyWithImpl<$Res, _$DwSessionStateModelImpl>
    implements _$$DwSessionStateModelImplCopyWith<$Res> {
  __$$DwSessionStateModelImplCopyWithImpl(
    _$DwSessionStateModelImpl _value,
    $Res Function(_$DwSessionStateModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DwSessionStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedInUserId = freezed,
    Object? userProfileBackendFilter = freezed,
  }) {
    return _then(
      _$DwSessionStateModelImpl(
        signedInUserId:
            freezed == signedInUserId
                ? _value.signedInUserId
                : signedInUserId // ignore: cast_nullable_to_non_nullable
                    as int?,
        userProfileBackendFilter:
            freezed == userProfileBackendFilter
                ? _value.userProfileBackendFilter
                : userProfileBackendFilter // ignore: cast_nullable_to_non_nullable
                    as DwBackendFilter<dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$DwSessionStateModelImpl implements _DwSessionStateModel {
  const _$DwSessionStateModelImpl({
    required this.signedInUserId,
    required this.userProfileBackendFilter,
  });

  @override
  final int? signedInUserId;
  @override
  final DwBackendFilter<dynamic>? userProfileBackendFilter;

  @override
  String toString() {
    return 'DwSessionStateModel(signedInUserId: $signedInUserId, userProfileBackendFilter: $userProfileBackendFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DwSessionStateModelImpl &&
            (identical(other.signedInUserId, signedInUserId) ||
                other.signedInUserId == signedInUserId) &&
            (identical(
                  other.userProfileBackendFilter,
                  userProfileBackendFilter,
                ) ||
                other.userProfileBackendFilter == userProfileBackendFilter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, signedInUserId, userProfileBackendFilter);

  /// Create a copy of DwSessionStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DwSessionStateModelImplCopyWith<_$DwSessionStateModelImpl> get copyWith =>
      __$$DwSessionStateModelImplCopyWithImpl<_$DwSessionStateModelImpl>(
        this,
        _$identity,
      );
}

abstract class _DwSessionStateModel implements DwSessionStateModel {
  const factory _DwSessionStateModel({
    required final int? signedInUserId,
    required final DwBackendFilter<dynamic>? userProfileBackendFilter,
  }) = _$DwSessionStateModelImpl;

  @override
  int? get signedInUserId;
  @override
  DwBackendFilter<dynamic>? get userProfileBackendFilter;

  /// Create a copy of DwSessionStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DwSessionStateModelImplCopyWith<_$DwSessionStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
