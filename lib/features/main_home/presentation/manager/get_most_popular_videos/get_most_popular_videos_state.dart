part of 'get_most_popular_videos_cubit.dart';

@immutable
abstract class GetMostPopularVideosState {}

class GetMostPopularVideosInitial extends GetMostPopularVideosState {}

class GetMostPopularVideosLoading extends GetMostPopularVideosState {
  @override
  List<Object?> get props => [];
}

class GetMostPopularVideosLoaded extends GetMostPopularVideosState {
  final VideoListResponse videoListResponse;
  final bool showResult;
  GetMostPopularVideosLoaded({required this.videoListResponse,required this.showResult});
  @override
  List<Object> get props => [];
}

class GetMostPopularVideosError extends GetMostPopularVideosState {
  final String? message;
  GetMostPopularVideosError({this.message});
  @override
  List<Object?> get props => [message];
}
