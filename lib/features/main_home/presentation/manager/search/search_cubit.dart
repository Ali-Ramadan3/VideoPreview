import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  bool playVideo = false;
  changeIcon(bool useSearch) {
    emit(SearchInitial());
    emit(SearchLoaded(useSearch: useSearch));
  }

  playVideoIcon() {
    emit(SearchInitial());
    playVideo = !playVideo;
    emit(PlayVideoLoaded(playVideo: playVideo));
  }
}
