// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavouriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<RestaurantFoodEntity> favourites) foods,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<RestaurantFoodEntity> favourites)? foods,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<RestaurantFoodEntity> favourites)? foods,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$Initial value) initial,
    required TResult Function(_$Loading value) loading,
    required TResult Function(_$Error value) error,
    required TResult Function(_$Foods value) foods,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$Initial value)? initial,
    TResult? Function(_$Loading value)? loading,
    TResult? Function(_$Error value)? error,
    TResult? Function(_$Foods value)? foods,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$Initial value)? initial,
    TResult Function(_$Loading value)? loading,
    TResult Function(_$Error value)? error,
    TResult Function(_$Foods value)? foods,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteStateCopyWith<$Res> {
  factory $FavouriteStateCopyWith(
          FavouriteState value, $Res Function(FavouriteState) then) =
      _$FavouriteStateCopyWithImpl<$Res, FavouriteState>;
}

/// @nodoc
class _$FavouriteStateCopyWithImpl<$Res, $Val extends FavouriteState>
    implements $FavouriteStateCopyWith<$Res> {
  _$FavouriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_$InitialCopyWith<$Res> {
  factory _$$_$InitialCopyWith(
          _$_$Initial value, $Res Function(_$_$Initial) then) =
      __$$_$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_$InitialCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res, _$_$Initial>
    implements _$$_$InitialCopyWith<$Res> {
  __$$_$InitialCopyWithImpl(
      _$_$Initial _value, $Res Function(_$_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_$Initial implements _$Initial {
  const _$_$Initial();

  @override
  String toString() {
    return 'FavouriteState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<RestaurantFoodEntity> favourites) foods,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<RestaurantFoodEntity> favourites)? foods,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<RestaurantFoodEntity> favourites)? foods,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$Initial value) initial,
    required TResult Function(_$Loading value) loading,
    required TResult Function(_$Error value) error,
    required TResult Function(_$Foods value) foods,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$Initial value)? initial,
    TResult? Function(_$Loading value)? loading,
    TResult? Function(_$Error value)? error,
    TResult? Function(_$Foods value)? foods,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$Initial value)? initial,
    TResult Function(_$Loading value)? loading,
    TResult Function(_$Error value)? error,
    TResult Function(_$Foods value)? foods,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _$Initial implements FavouriteState {
  const factory _$Initial() = _$_$Initial;
}

/// @nodoc
abstract class _$$_$LoadingCopyWith<$Res> {
  factory _$$_$LoadingCopyWith(
          _$_$Loading value, $Res Function(_$_$Loading) then) =
      __$$_$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_$LoadingCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res, _$_$Loading>
    implements _$$_$LoadingCopyWith<$Res> {
  __$$_$LoadingCopyWithImpl(
      _$_$Loading _value, $Res Function(_$_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_$Loading implements _$Loading {
  const _$_$Loading();

  @override
  String toString() {
    return 'FavouriteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<RestaurantFoodEntity> favourites) foods,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<RestaurantFoodEntity> favourites)? foods,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<RestaurantFoodEntity> favourites)? foods,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$Initial value) initial,
    required TResult Function(_$Loading value) loading,
    required TResult Function(_$Error value) error,
    required TResult Function(_$Foods value) foods,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$Initial value)? initial,
    TResult? Function(_$Loading value)? loading,
    TResult? Function(_$Error value)? error,
    TResult? Function(_$Foods value)? foods,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$Initial value)? initial,
    TResult Function(_$Loading value)? loading,
    TResult Function(_$Error value)? error,
    TResult Function(_$Foods value)? foods,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _$Loading implements FavouriteState {
  const factory _$Loading() = _$_$Loading;
}

/// @nodoc
abstract class _$$_$ErrorCopyWith<$Res> {
  factory _$$_$ErrorCopyWith(_$_$Error value, $Res Function(_$_$Error) then) =
      __$$_$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_$ErrorCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res, _$_$Error>
    implements _$$_$ErrorCopyWith<$Res> {
  __$$_$ErrorCopyWithImpl(_$_$Error _value, $Res Function(_$_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_$Error(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_$Error implements _$Error {
  const _$_$Error({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'FavouriteState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_$Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_$ErrorCopyWith<_$_$Error> get copyWith =>
      __$$_$ErrorCopyWithImpl<_$_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<RestaurantFoodEntity> favourites) foods,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<RestaurantFoodEntity> favourites)? foods,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<RestaurantFoodEntity> favourites)? foods,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$Initial value) initial,
    required TResult Function(_$Loading value) loading,
    required TResult Function(_$Error value) error,
    required TResult Function(_$Foods value) foods,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$Initial value)? initial,
    TResult? Function(_$Loading value)? loading,
    TResult? Function(_$Error value)? error,
    TResult? Function(_$Foods value)? foods,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$Initial value)? initial,
    TResult Function(_$Loading value)? loading,
    TResult Function(_$Error value)? error,
    TResult Function(_$Foods value)? foods,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _$Error implements FavouriteState {
  const factory _$Error({required final String message}) = _$_$Error;

  String get message;
  @JsonKey(ignore: true)
  _$$_$ErrorCopyWith<_$_$Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_$FoodsCopyWith<$Res> {
  factory _$$_$FoodsCopyWith(_$_$Foods value, $Res Function(_$_$Foods) then) =
      __$$_$FoodsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RestaurantFoodEntity> favourites});
}

/// @nodoc
class __$$_$FoodsCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res, _$_$Foods>
    implements _$$_$FoodsCopyWith<$Res> {
  __$$_$FoodsCopyWithImpl(_$_$Foods _value, $Res Function(_$_$Foods) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favourites = null,
  }) {
    return _then(_$_$Foods(
      favourites: null == favourites
          ? _value._favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<RestaurantFoodEntity>,
    ));
  }
}

/// @nodoc

class _$_$Foods implements _$Foods {
  const _$_$Foods({required final List<RestaurantFoodEntity> favourites})
      : _favourites = favourites;

  final List<RestaurantFoodEntity> _favourites;
  @override
  List<RestaurantFoodEntity> get favourites {
    if (_favourites is EqualUnmodifiableListView) return _favourites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favourites);
  }

  @override
  String toString() {
    return 'FavouriteState.foods(favourites: $favourites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_$Foods &&
            const DeepCollectionEquality()
                .equals(other._favourites, _favourites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favourites));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_$FoodsCopyWith<_$_$Foods> get copyWith =>
      __$$_$FoodsCopyWithImpl<_$_$Foods>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<RestaurantFoodEntity> favourites) foods,
  }) {
    return foods(favourites);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<RestaurantFoodEntity> favourites)? foods,
  }) {
    return foods?.call(favourites);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<RestaurantFoodEntity> favourites)? foods,
    required TResult orElse(),
  }) {
    if (foods != null) {
      return foods(favourites);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$Initial value) initial,
    required TResult Function(_$Loading value) loading,
    required TResult Function(_$Error value) error,
    required TResult Function(_$Foods value) foods,
  }) {
    return foods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$Initial value)? initial,
    TResult? Function(_$Loading value)? loading,
    TResult? Function(_$Error value)? error,
    TResult? Function(_$Foods value)? foods,
  }) {
    return foods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$Initial value)? initial,
    TResult Function(_$Loading value)? loading,
    TResult Function(_$Error value)? error,
    TResult Function(_$Foods value)? foods,
    required TResult orElse(),
  }) {
    if (foods != null) {
      return foods(this);
    }
    return orElse();
  }
}

abstract class _$Foods implements FavouriteState {
  const factory _$Foods(
      {required final List<RestaurantFoodEntity> favourites}) = _$_$Foods;

  List<RestaurantFoodEntity> get favourites;
  @JsonKey(ignore: true)
  _$$_$FoodsCopyWith<_$_$Foods> get copyWith =>
      throw _privateConstructorUsedError;
}
