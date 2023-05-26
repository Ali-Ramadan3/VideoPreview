import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_video_state.dart';

class PlayVideoCubit extends Cubit<PlayVideoState> {
  PlayVideoCubit() : super(PlayVideoInitial());
  bool playVideo = false;

  playVideoIcon() {
    emit(PlayVideoInitial());
    playVideo = !playVideo;
    emit(PlayVideoLoaded(playVideo: playVideo));
  }
}
