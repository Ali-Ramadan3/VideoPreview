part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  final bool useSearch;
  SearchLoaded({required this.useSearch});
  @override
  List<Object> get props => [];
}

class PlayVideoLoaded extends SearchState {
  final bool playVideo;
  PlayVideoLoaded({required this.playVideo});
  @override
  List<Object> get props => [];
}
