// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailState {
  List<DetailMelmodModel> get detail => throw _privateConstructorUsedError;
  set detail(List<DetailMelmodModel> value) =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;
  bool get isLoad => throw _privateConstructorUsedError;
  set isLoad(bool value) => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  set path(String value) => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  set message(String value) => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  set progress(double value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailStateCopyWith<DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStateCopyWith<$Res> {
  factory $DetailStateCopyWith(
          DetailState value, $Res Function(DetailState) then) =
      _$DetailStateCopyWithImpl<$Res, DetailState>;
  @useResult
  $Res call(
      {List<DetailMelmodModel> detail,
      bool isLoading,
      bool isLoad,
      String path,
      String message,
      double progress});
}

/// @nodoc
class _$DetailStateCopyWithImpl<$Res, $Val extends DetailState>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
    Object? isLoading = null,
    Object? isLoad = null,
    Object? path = null,
    Object? message = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<DetailMelmodModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailStateImplCopyWith<$Res>
    implements $DetailStateCopyWith<$Res> {
  factory _$$DetailStateImplCopyWith(
          _$DetailStateImpl value, $Res Function(_$DetailStateImpl) then) =
      __$$DetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DetailMelmodModel> detail,
      bool isLoading,
      bool isLoad,
      String path,
      String message,
      double progress});
}

/// @nodoc
class __$$DetailStateImplCopyWithImpl<$Res>
    extends _$DetailStateCopyWithImpl<$Res, _$DetailStateImpl>
    implements _$$DetailStateImplCopyWith<$Res> {
  __$$DetailStateImplCopyWithImpl(
      _$DetailStateImpl _value, $Res Function(_$DetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
    Object? isLoading = null,
    Object? isLoad = null,
    Object? path = null,
    Object? message = null,
    Object? progress = null,
  }) {
    return _then(_$DetailStateImpl(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<DetailMelmodModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DetailStateImpl implements _DetailState {
  _$DetailStateImpl(
      {this.detail = const [],
      this.isLoading = true,
      this.isLoad = true,
      this.path = '',
      this.message = '',
      this.progress = 0.0});

  @override
  @JsonKey()
  List<DetailMelmodModel> detail;
  @override
  @JsonKey()
  bool isLoading;
  @override
  @JsonKey()
  bool isLoad;
  @override
  @JsonKey()
  String path;
  @override
  @JsonKey()
  String message;
  @override
  @JsonKey()
  double progress;

  @override
  String toString() {
    return 'DetailState(detail: $detail, isLoading: $isLoading, isLoad: $isLoad, path: $path, message: $message, progress: $progress)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStateImplCopyWith<_$DetailStateImpl> get copyWith =>
      __$$DetailStateImplCopyWithImpl<_$DetailStateImpl>(this, _$identity);
}

abstract class _DetailState implements DetailState {
  factory _DetailState(
      {List<DetailMelmodModel> detail,
      bool isLoading,
      bool isLoad,
      String path,
      String message,
      double progress}) = _$DetailStateImpl;

  @override
  List<DetailMelmodModel> get detail;
  set detail(List<DetailMelmodModel> value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  bool get isLoad;
  set isLoad(bool value);
  @override
  String get path;
  set path(String value);
  @override
  String get message;
  set message(String value);
  @override
  double get progress;
  set progress(double value);
  @override
  @JsonKey(ignore: true)
  _$$DetailStateImplCopyWith<_$DetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
