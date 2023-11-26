// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_mod_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchModState {
  List<MelModModel> get melmod => throw _privateConstructorUsedError;
  set melmod(List<MelModModel> value) => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  set message(String value) => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  set page(int value) => throw _privateConstructorUsedError;
  bool get isNext => throw _privateConstructorUsedError;
  set isNext(bool value) => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchModStateCopyWith<SearchModState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchModStateCopyWith<$Res> {
  factory $SearchModStateCopyWith(
          SearchModState value, $Res Function(SearchModState) then) =
      _$SearchModStateCopyWithImpl<$Res, SearchModState>;
  @useResult
  $Res call(
      {List<MelModModel> melmod,
      String message,
      int page,
      bool isNext,
      bool isLoading});
}

/// @nodoc
class _$SearchModStateCopyWithImpl<$Res, $Val extends SearchModState>
    implements $SearchModStateCopyWith<$Res> {
  _$SearchModStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? melmod = null,
    Object? message = null,
    Object? page = null,
    Object? isNext = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      melmod: null == melmod
          ? _value.melmod
          : melmod // ignore: cast_nullable_to_non_nullable
              as List<MelModModel>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isNext: null == isNext
          ? _value.isNext
          : isNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchModStateImplCopyWith<$Res>
    implements $SearchModStateCopyWith<$Res> {
  factory _$$SearchModStateImplCopyWith(_$SearchModStateImpl value,
          $Res Function(_$SearchModStateImpl) then) =
      __$$SearchModStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MelModModel> melmod,
      String message,
      int page,
      bool isNext,
      bool isLoading});
}

/// @nodoc
class __$$SearchModStateImplCopyWithImpl<$Res>
    extends _$SearchModStateCopyWithImpl<$Res, _$SearchModStateImpl>
    implements _$$SearchModStateImplCopyWith<$Res> {
  __$$SearchModStateImplCopyWithImpl(
      _$SearchModStateImpl _value, $Res Function(_$SearchModStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? melmod = null,
    Object? message = null,
    Object? page = null,
    Object? isNext = null,
    Object? isLoading = null,
  }) {
    return _then(_$SearchModStateImpl(
      melmod: null == melmod
          ? _value.melmod
          : melmod // ignore: cast_nullable_to_non_nullable
              as List<MelModModel>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isNext: null == isNext
          ? _value.isNext
          : isNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchModStateImpl implements _SearchModState {
  _$SearchModStateImpl(
      {this.melmod = const [],
      this.message = "",
      this.page = 1,
      this.isNext = true,
      this.isLoading = true});

  @override
  @JsonKey()
  List<MelModModel> melmod;
  @override
  @JsonKey()
  String message;
  @override
  @JsonKey()
  int page;
  @override
  @JsonKey()
  bool isNext;
  @override
  @JsonKey()
  bool isLoading;

  @override
  String toString() {
    return 'SearchModState(melmod: $melmod, message: $message, page: $page, isNext: $isNext, isLoading: $isLoading)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchModStateImplCopyWith<_$SearchModStateImpl> get copyWith =>
      __$$SearchModStateImplCopyWithImpl<_$SearchModStateImpl>(
          this, _$identity);
}

abstract class _SearchModState implements SearchModState {
  factory _SearchModState(
      {List<MelModModel> melmod,
      String message,
      int page,
      bool isNext,
      bool isLoading}) = _$SearchModStateImpl;

  @override
  List<MelModModel> get melmod;
  set melmod(List<MelModModel> value);
  @override
  String get message;
  set message(String value);
  @override
  int get page;
  set page(int value);
  @override
  bool get isNext;
  set isNext(bool value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  @JsonKey(ignore: true)
  _$$SearchModStateImplCopyWith<_$SearchModStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
