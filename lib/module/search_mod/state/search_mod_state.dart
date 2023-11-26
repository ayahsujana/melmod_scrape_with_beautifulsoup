
import 'package:blocwithgetit/model/melmod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_mod_state.freezed.dart';

@unfreezed
class SearchModState with _$SearchModState {
  factory SearchModState({
    @Default([]) List<MelModModel> melmod,
    @Default("") String message,
    @Default(1) int page,
    @Default(true) bool isNext,
    @Default(true) bool isLoading,
  }) = _SearchModState;
}
    
    