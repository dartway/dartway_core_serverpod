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
mixin _$DwSingleEntityStateConfig<Entity extends SerializableModel> {
  DwBackendFilter<dynamic> get backendFilter =>
      throw _privateConstructorUsedError;
  Entity? get initialModel => throw _privateConstructorUsedError;

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DwSingleEntityStateConfigCopyWith<Entity, DwSingleEntityStateConfig<Entity>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DwSingleEntityStateConfigCopyWith<
  Entity extends SerializableModel,
  $Res
> {
  factory $DwSingleEntityStateConfigCopyWith(
    DwSingleEntityStateConfig<Entity> value,
    $Res Function(DwSingleEntityStateConfig<Entity>) then,
  ) =
      _$DwSingleEntityStateConfigCopyWithImpl<
        Entity,
        $Res,
        DwSingleEntityStateConfig<Entity>
      >;
  @useResult
  $Res call({DwBackendFilter<dynamic> backendFilter, Entity? initialModel});
}

/// @nodoc
class _$DwSingleEntityStateConfigCopyWithImpl<
  Entity extends SerializableModel,
  $Res,
  $Val extends DwSingleEntityStateConfig<Entity>
>
    implements $DwSingleEntityStateConfigCopyWith<Entity, $Res> {
  _$DwSingleEntityStateConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? backendFilter = null, Object? initialModel = freezed}) {
    return _then(
      _value.copyWith(
            backendFilter:
                null == backendFilter
                    ? _value.backendFilter
                    : backendFilter // ignore: cast_nullable_to_non_nullable
                        as DwBackendFilter<dynamic>,
            initialModel:
                freezed == initialModel
                    ? _value.initialModel
                    : initialModel // ignore: cast_nullable_to_non_nullable
                        as Entity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DwSingleEntityStateConfigImplCopyWith<
  Entity extends SerializableModel,
  $Res
>
    implements $DwSingleEntityStateConfigCopyWith<Entity, $Res> {
  factory _$$DwSingleEntityStateConfigImplCopyWith(
    _$DwSingleEntityStateConfigImpl<Entity> value,
    $Res Function(_$DwSingleEntityStateConfigImpl<Entity>) then,
  ) = __$$DwSingleEntityStateConfigImplCopyWithImpl<Entity, $Res>;
  @override
  @useResult
  $Res call({DwBackendFilter<dynamic> backendFilter, Entity? initialModel});
}

/// @nodoc
class __$$DwSingleEntityStateConfigImplCopyWithImpl<
  Entity extends SerializableModel,
  $Res
>
    extends
        _$DwSingleEntityStateConfigCopyWithImpl<
          Entity,
          $Res,
          _$DwSingleEntityStateConfigImpl<Entity>
        >
    implements _$$DwSingleEntityStateConfigImplCopyWith<Entity, $Res> {
  __$$DwSingleEntityStateConfigImplCopyWithImpl(
    _$DwSingleEntityStateConfigImpl<Entity> _value,
    $Res Function(_$DwSingleEntityStateConfigImpl<Entity>) _then,
  ) : super(_value, _then);

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? backendFilter = null, Object? initialModel = freezed}) {
    return _then(
      _$DwSingleEntityStateConfigImpl<Entity>(
        backendFilter:
            null == backendFilter
                ? _value.backendFilter
                : backendFilter // ignore: cast_nullable_to_non_nullable
                    as DwBackendFilter<dynamic>,
        initialModel:
            freezed == initialModel
                ? _value.initialModel
                : initialModel // ignore: cast_nullable_to_non_nullable
                    as Entity?,
      ),
    );
  }
}

/// @nodoc

class _$DwSingleEntityStateConfigImpl<Entity extends SerializableModel>
    implements _DwSingleEntityStateConfig<Entity> {
  const _$DwSingleEntityStateConfigImpl({
    required this.backendFilter,
    this.initialModel,
  });

  @override
  final DwBackendFilter<dynamic> backendFilter;
  @override
  final Entity? initialModel;

  @override
  String toString() {
    return 'DwSingleEntityStateConfig<$Entity>(backendFilter: $backendFilter, initialModel: $initialModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DwSingleEntityStateConfigImpl<Entity> &&
            (identical(other.backendFilter, backendFilter) ||
                other.backendFilter == backendFilter) &&
            const DeepCollectionEquality().equals(
              other.initialModel,
              initialModel,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backendFilter,
    const DeepCollectionEquality().hash(initialModel),
  );

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DwSingleEntityStateConfigImplCopyWith<
    Entity,
    _$DwSingleEntityStateConfigImpl<Entity>
  >
  get copyWith => __$$DwSingleEntityStateConfigImplCopyWithImpl<
    Entity,
    _$DwSingleEntityStateConfigImpl<Entity>
  >(this, _$identity);
}

abstract class _DwSingleEntityStateConfig<Entity extends SerializableModel>
    implements DwSingleEntityStateConfig<Entity> {
  const factory _DwSingleEntityStateConfig({
    required final DwBackendFilter<dynamic> backendFilter,
    final Entity? initialModel,
  }) = _$DwSingleEntityStateConfigImpl<Entity>;

  @override
  DwBackendFilter<dynamic> get backendFilter;
  @override
  Entity? get initialModel;

  /// Create a copy of DwSingleEntityStateConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DwSingleEntityStateConfigImplCopyWith<
    Entity,
    _$DwSingleEntityStateConfigImpl<Entity>
  >
  get copyWith => throw _privateConstructorUsedError;
}
