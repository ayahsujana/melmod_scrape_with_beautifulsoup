
import 'package:blocwithgetit/model/detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_state.freezed.dart';

@unfreezed
class DetailState with _$DetailState {
  factory DetailState({
    @Default([]) List<DetailMelmodModel> detail,
    @Default(true) bool isLoading,
    @Default(true) bool isLoad,
    @Default('') String path,
    @Default('') String message,
    @Default(0.0) double progress,
  }) = _DetailState;
}
    
    