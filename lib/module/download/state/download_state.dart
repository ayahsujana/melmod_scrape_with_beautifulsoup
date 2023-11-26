
import 'package:freezed_annotation/freezed_annotation.dart';
part 'download_state.freezed.dart';

@unfreezed
class DownloadState with _$DownloadState {
  factory DownloadState({
    @Default(0) int counter,
  }) = _DownloadState;
}
    
    