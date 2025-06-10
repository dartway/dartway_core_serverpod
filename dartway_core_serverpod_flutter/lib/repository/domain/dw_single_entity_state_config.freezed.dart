// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dw_single_entity_state_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DwSingleEntityStateConfig {
  DwBackendFilter<dynamic> get backendFilter =>
      throw _privateConstructorUsedError;

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DwSingleEntityStateConfigCopyWith<DwSingleEntityStateConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DwSingleEntityStateConfigCopyWith<$Res> {
  factory $DwSingleEntityStateConfigCopyWith(
    DwSingleEntityStateConfig value,
    $Res Function(DwSingleEntityStateConfig) then,
  ) = _$DwSingleEntityStateConfigCopyWithImpl<$Res, DwSingleEntityStateConfig>;
  @useResult
  $Res call({DwBackendFilter<dynamic> backendFilter});
}

/// @nodoc
class _$DwSingleEntityStateConfigCopyWithImpl<
  $Res,
  $Val extends DwSingleEntityStateConfig
>
    implements $DwSingleEntityStateConfigCopyWith<$Res> {
  _$DwSingleEntityStateConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? backendFilter = null}) {
    return _then(
      _value.copyWith(
            backendFilter:
                null == backendFilter
                    ? _value.backendFilter
                    : backendFilter // ignore: cast_nullable_to_non_nullable
                        as DwBackendFilter<dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DwSingleEntityStateConfigImplCopyWith<$Res>
    implements $DwSingleEntityStateConfigCopyWith<$Res> {
  factory _$$DwSingleEntityStateConfigImplCopyWith(
    _$DwSingleEntityStateConfigImpl value,
    $Res Function(_$DwSingleEntityStateConfigImpl) then,
  ) = __$$DwSingleEntityStateConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DwBackendFilter<dynamic> backendFilter});
}

/// @nodoc
class __$$DwSingleEntityStateConfigImplCopyWithImpl<$Res>
    extends
        _$DwSingleEntityStateConfigCopyWithImpl<
          $Res,
          _$DwSingleEntityStateConfigImpl
        >
    implements _$$DwSingleEntityStateConfigImplCopyWith<$Res> {
  __$$DwSingleEntityStateConfigImplCopyWithImpl(
    _$DwSingleEntityStateConfigImpl _value,
    $Res Function(_$DwSingleEntityStateConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? backendFilter = null}) {
    return _then(
      _$DwSingleEntityStateConfigImpl(
        backendFilter:
            null == backendFilter
                ? _value.backendFilter
                : backendFilter // ignore: cast_nullable_to_non_nullable
                    as DwBackendFilter<dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$DwSingleEntityStateConfigImpl implements _DwSingleEntityStateConfig {
  const _$DwSingleEntityStateConfigImpl({required this.backendFilter});

  @override
  final DwBackendFilter<dynamic> backendFilter;

  @override
  String toString() {
    return 'DwSingleEntityStateConfig(backendFilter: $backendFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DwSingleEntityStateConfigImpl &&
            (identical(other.backendFilter, backendFilter) ||
                other.backendFilter == backendFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, backendFilter);

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DwSingleEntityStateConfigImplCopyWith<_$DwSingleEntityStateConfigImpl>
  get copyWith => __$$DwSingleEntityStateConfigImplCopyWithImpl<
    _$DwSingleEntityStateConfigImpl
  >(this, _$identity);
}

abstract class _DwSingleEntityStateConfig implements DwSingleEntityStateConfig {
  const factory _DwSingleEntityStateConfig({
    required final DwBackendFilter<dynamic> backendFilter,
  }) = _$DwSingleEntityStateConfigImpl;

  @override
  DwBackendFilter<dynamic> get backendFilter;

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DwSingleEntityStateConfigImplCopyWith<_$DwSingleEntityStateConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}
