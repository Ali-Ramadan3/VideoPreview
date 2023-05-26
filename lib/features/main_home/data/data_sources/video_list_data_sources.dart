import 'package:video_preview/features/main_home/data/models/query_params.dart';

import '../../../../core/data/network/APi_constants.dart';
import '../../../../core/data/network/network_helper.dart';
import '../../../../core/error/exceptions.dart';
import '../models/video_list_response.dart';

abstract class VideoListDataSources {
  Future<VideoListResponse> getMostPopularVideo(QueryParams params);
}

class VideoListDataSourcesImp implements VideoListDataSources {
  final NetworkHelper networkHelper;

  VideoListDataSourcesImp({required this.networkHelper});

  @override
  Future<VideoListResponse> getMostPopularVideo(QueryParams params) async {
    try {
      var response = await networkHelper.get(
          path: APiConstants.getMostPopularVideo(params));
      final VideoListResponse json = VideoListResponse.fromJson(response);
      return json;
    } on Exception catch (e) {
      throw ServerException(message: "Server Exception: ${e.toString()}");
    }
  }
}
