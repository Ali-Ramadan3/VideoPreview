import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:video_preview/core/presentation/color_manger/colors.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/video_list_repository.dart';
import '../data_sources/video_list_data_sources.dart';
import '../models/query_params.dart';
import '../models/video_list_response.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VideoListRepositoryImp implements VideoListRepository {
  final VideoListDataSources videoListDataSources;
  final DataConnectionChecker connectionChecker;
  final Fluttertoast flutterToast;

  VideoListRepositoryImp({
    required this.videoListDataSources,
    required this.connectionChecker,
    required this.flutterToast,
  });
  @override
  @override
  Future<Either<Failure, VideoListResponse>> getMostPopularVideo(
      QueryParams params) async {
    if (await connectionChecker.hasConnection) {
      try {
        final data = await videoListDataSources.getMostPopularVideo(params);
        return Right(data);
      } on ServerException catch (e) {
        return Left(ServerFailure());
      }
    } else {
      Fluttertoast.showToast(
        msg: "No internet connection available.",
        gravity: ToastGravity.CENTER,
        backgroundColor: ColorManger.black,
        textColor: ColorManger.white,
      );
      return Left(NetworkFailure());
    }
  }
}
