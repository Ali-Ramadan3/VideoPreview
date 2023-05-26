import 'package:either_dart/either.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/query_params.dart';
import '../../data/models/video_list_response.dart';

abstract class VideoListRepository {
  Future<Either<Failure, VideoListResponse>> getMostPopularVideo(
      QueryParams params);
}
