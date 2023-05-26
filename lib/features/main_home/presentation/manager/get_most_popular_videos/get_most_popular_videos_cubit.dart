import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:video_preview/features/main_home/data/models/query_params.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/models/video_list_response.dart';
import '../../../domain/use_cases/get_most_popular_use_case.dart';

part 'get_most_popular_videos_state.dart';

class GetMostPopularVideosCubit extends Cubit<GetMostPopularVideosState> {
  final GetMostPopularVideoUseCase getMostPopularVideoUseCase;
  GetMostPopularVideosCubit({required this.getMostPopularVideoUseCase})
      : super(GetMostPopularVideosInitial());

  getMostPopularVideos(
      String? pageToken, String? endPoint, String searchedText) async {
    FailureToMassage massage = FailureToMassage();
    QueryParams params = QueryParams(
        endPoint: endPoint,
        q: searchedText,
        part: "snippet",
        chart: "mostPopular",
        maxResults: "10",
        pageToken: pageToken ?? "");
    bool showResult = (endPoint == "search");
    emit(GetMostPopularVideosLoading());
    final eitherPackagesOrFailure = await getMostPopularVideoUseCase(params);
    eitherPackagesOrFailure.fold(
        (failure) => emit(GetMostPopularVideosError(
            message: massage.mapFailureToMessage(failure))), (response) {
      emit(GetMostPopularVideosLoaded(
          videoListResponse: response, showResult: showResult));
    });
  }
}
