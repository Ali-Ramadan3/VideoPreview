part of 'play_video_cubit.dart';

@immutable
abstract class PlayVideoState {}

class PlayVideoInitial extends PlayVideoState {}

class PlayVideoLoaded extends PlayVideoState {
  final bool playVideo;
  PlayVideoLoaded({required this.playVideo});
  @override
  List<Object> get props => [];
}
