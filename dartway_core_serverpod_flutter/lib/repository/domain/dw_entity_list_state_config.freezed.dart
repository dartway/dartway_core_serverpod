// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dw_entity_list_state_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DwEntityListStateConfig {
  DwBackendFilter<dynamic>? get backendFilter =>
      throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  dynamic Function(List<DwModelWrapper>)? get customUpdatesListener =>
      throw _privateConstructorUsedError;

  /// Create a copy of DwEntityListStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DwEntityListStateConfigCopyWith<DwEntityListStateConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DwEntityListStateConfigCopyWith<$Res> {
  factory $DwEntityListStateConfigCopyWith(
    DwEntityListStateConfig value,
    $Res Function(DwEntityListStateConfig) then,
  ) = _$DwEntityListStateConfigCopyWithImpl<$Res, DwEntityListStateConfig>;
  @useResult
  $Res call({
    DwBackendFilter<dynamic>? backendFilter,
    int? pageSize,
    dynamic Function(List<DwModelWrapper>)? customUpdatesListener,
  });
}

/// @nodoc
class _$DwEntityListStateConfigCopyWithImpl<
  $Res,
  $Val extends DwEntityListStateConfig
>
    implements $DwEntityListStateConfigCopyWith<$Res> {
  _$DwEntityListStateConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DwEntityListStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backendFilter = freezed,
    Object? pageSize = freezed,
    Object? customUpdatesListener = freezed,
  }) {
    return _then(
      _value.copyWith(
            backendFilter:
                freezed == backendFilter
                    ? _value.backendFilter
                    : backendFilter // ignore: cast_nullable_to_non_nullable
                        as DwBackendFilter<dynamic>?,
            pageSize:
                freezed == pageSize
                    ? _value.pageSize
                    : pageSize // ignore: cast_nullable_to_non_nullable
                        as int?,
            customUpdatesListener:
                freezed == customUpdatesListener
                    ? _value.customUpdatesListener
                    : customUpdatesListener // ignore: cast_nullable_to_non_nullable
                        as dynamic Function(List<DwModelWrapper>)?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DwEntityListStateConfigImplCopyWith<$Res>
    implements $DwEntityListStateConfigCopyWith<$Res> {
  factory _$$DwEntityListStateConfigImplCopyWith(
    _$DwEntityListStateConfigImpl value,
    $Res Function(_$DwEntityListStateConfigImpl) then,
  ) = __$$DwEntityListStateConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DwBackendFilter<dynamic>? backendFilter,
    int? pageSize,
    dynamic Function(List<DwModelWrapper>)? customUpdatesListener,
  });
}

/// @nodoc
class __$$DwEntityListStateConfigImplCopyWithImpl<$Res>
    extends
        _$DwEntityListStateConfigCopyWithImpl<
          $Res,
          _$DwEntityListStateConfigImpl
        >
    implements _$$DwEntityListStateConfigImplCopyWith<$Res> {
  __$$DwEntityListStateConfigImplCopyWithImpl(
    _$DwEntityListStateConfigImpl _value,
    $Res Function(_$DwEntityListStateConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DwEntityListStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backendFilter = freezed,
    Object? pageSize = freezed,
    Object? customUpdatesListener = freezed,
  }) {
    return _then(
      _$DwEntityListStateConfigImpl(
        backendFilter:
            freezed == backendFilter
                ? _value.backendFilter
                : backendFilter // ignore: cast_nullable_to_non_nullable
                    as DwBackendFilter<dynamic>?,
        pageSize:
            freezed == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                    as int?,
        customUpdatesListener:
            freezed == customUpdatesListener
                ? _value.customUpdatesListener
                : customUpdatesListener // ignore: cast_nullable_to_non_nullable
                    as dynamic Function(List<DwModelWrapper>)?,
      ),
    );
  }
}

/// @nodoc

class _$DwEntityListStateConfigImpl implements _DwEntityListStateConfig {
  const _$DwEntityListStateConfigImpl({
    this.backendFilter,
    this.pageSize,
    this.customUpdatesListener,
  });

  @override
  final DwBackendFilter<dynamic>? backendFilter;
  @override
  final int? pageSize;
  @override
  final dynamic Function(List<DwModelWrapper>)? customUpdatesListener;

  @override
  String toString() {
    return 'DwEntityListStateConfig(backendFilter: $backendFilter, pageSize: $pageSize, customUpdatesListener: $customUpdatesListener)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DwEntityListStateConfigImpl &&
            (identical(other.backendFilter, backendFilter) ||
                other.backendFilter == backendFilter) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.customUpdatesListener, customUpdatesListener) ||
                other.customUpdatesListener == customUpdatesListener));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, backendFilter, pageSize, customUpdatesListener);

  /// Create a copy of DwEntityListStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DwEntityListStateConfigImplCopyWith<_$DwEntityListStateConfigImpl>
  get copyWith => __$$DwEntityListStateConfigImplCopyWithImpl<
    _$DwEntityListStateConfigImpl
  >(this, _$identity);
}

abstract class _DwEntityListStateConfig implements DwEntityListStateConfig {
  const factory _DwEntityListStateConfig({
    final DwBackendFilter<dynamic>? backendFilter,
    final int? pageSize,
    final dynamic Function(List<DwModelWrapper>)? customUpdatesListener,
  }) = _$DwEntityListStateConfigImpl;

  @override
  DwBackendFilter<dynamic>? get backendFilter;
  @override
  int? get pageSize;
  @override
  dynamic Function(List<DwModelWrapper>)? get customUpdatesListener;

  /// Create a copy of DwEntityListStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DwEntityListStateConfigImplCopyWith<_$DwEntityListStateConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}
