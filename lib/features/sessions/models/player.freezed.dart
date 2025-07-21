// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get subscribedOn => throw _privateConstructorUsedError;
  List<ExperimentLog> get experimentLogs => throw _privateConstructorUsedError;

  /// Serializes this Player to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call(
      {String id,
      String name,
      int? age,
      double? height,
      double? weight,
      Gender? gender,
      @TimestampConverter() DateTime? subscribedOn,
      List<ExperimentLog> experimentLogs});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? gender = freezed,
    Object? subscribedOn = freezed,
    Object? experimentLogs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      subscribedOn: freezed == subscribedOn
          ? _value.subscribedOn
          : subscribedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      experimentLogs: null == experimentLogs
          ? _value.experimentLogs
          : experimentLogs // ignore: cast_nullable_to_non_nullable
              as List<ExperimentLog>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int? age,
      double? height,
      double? weight,
      Gender? gender,
      @TimestampConverter() DateTime? subscribedOn,
      List<ExperimentLog> experimentLogs});
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? gender = freezed,
    Object? subscribedOn = freezed,
    Object? experimentLogs = null,
  }) {
    return _then(_$PlayerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      subscribedOn: freezed == subscribedOn
          ? _value.subscribedOn
          : subscribedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      experimentLogs: null == experimentLogs
          ? _value._experimentLogs
          : experimentLogs // ignore: cast_nullable_to_non_nullable
              as List<ExperimentLog>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl implements _Player {
  const _$PlayerImpl(
      {required this.id,
      this.name = 'Sconosciuto',
      this.age,
      this.height,
      this.weight,
      this.gender,
      @TimestampConverter() this.subscribedOn,
      final List<ExperimentLog> experimentLogs = const []})
      : _experimentLogs = experimentLogs;

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  final int? age;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  final Gender? gender;
  @override
  @TimestampConverter()
  final DateTime? subscribedOn;
  final List<ExperimentLog> _experimentLogs;
  @override
  @JsonKey()
  List<ExperimentLog> get experimentLogs {
    if (_experimentLogs is EqualUnmodifiableListView) return _experimentLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experimentLogs);
  }

  @override
  String toString() {
    return 'Player(id: $id, name: $name, age: $age, height: $height, weight: $weight, gender: $gender, subscribedOn: $subscribedOn, experimentLogs: $experimentLogs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.subscribedOn, subscribedOn) ||
                other.subscribedOn == subscribedOn) &&
            const DeepCollectionEquality()
                .equals(other._experimentLogs, _experimentLogs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      age,
      height,
      weight,
      gender,
      subscribedOn,
      const DeepCollectionEquality().hash(_experimentLogs));

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  const factory _Player(
      {required final String id,
      final String name,
      final int? age,
      final double? height,
      final double? weight,
      final Gender? gender,
      @TimestampConverter() final DateTime? subscribedOn,
      final List<ExperimentLog> experimentLogs}) = _$PlayerImpl;

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int? get age;
  @override
  double? get height;
  @override
  double? get weight;
  @override
  Gender? get gender;
  @override
  @TimestampConverter()
  DateTime? get subscribedOn;
  @override
  List<ExperimentLog> get experimentLogs;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
