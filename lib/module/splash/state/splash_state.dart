
import 'package:blocwithgetit/model/appupdates.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_state.freezed.dart';

@unfreezed
class SplashState with _$SplashState {
  factory SplashState({
    @Default([]) List<Ad> ad,
    @Default([]) List<App> app,
    @Default(true) bool isReady,
  }) = _SplashState;
}
    
    