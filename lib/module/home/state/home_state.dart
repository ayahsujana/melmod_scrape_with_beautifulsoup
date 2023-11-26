
import 'package:blocwithgetit/model/melmod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@unfreezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<MelModModel> melmod,
    @Default("") String message,
    @Default(1) int page,
    @Default(true) bool isNext,
    @Default(true) bool isLoading,
  }) = _HomeState;
}
    
    