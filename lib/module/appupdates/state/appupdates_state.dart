
import 'package:freezed_annotation/freezed_annotation.dart';
part 'appupdates_state.freezed.dart';

@unfreezed
class AppupdatesState with _$AppupdatesState {
  factory AppupdatesState({
    @Default(0) int counter,
  }) = _AppupdatesState;
}
    
    