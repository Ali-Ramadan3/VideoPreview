import 'package:either_dart/either.dart';
import 'package:video_preview/features/main_home/data/models/query_params.dart';
import '../../../../core/domin/usecase/base_usecase.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/video_list_response.dart';
import '../repositories/video_list_repository.dart';

class GetMostPopularVideoUseCase implements UseCase<VideoListResponse, QueryParams> {
  final VideoListRepository videoListRepository;

  GetMostPopularVideoUseCase({required this.videoListRepository});

  @override
  Future<Either<Failure, VideoListResponse>> call(QueryParams params) async {
    return await videoListRepository.getMostPopularVideo(params);
  }
}