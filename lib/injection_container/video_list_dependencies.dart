import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import '../core/data/network/network_helper.dart';
import '../features/main_home/data/data_sources/video_list_data_sources.dart';
import '../features/main_home/data/repositories/video_list_repositories.dart';
import '../features/main_home/domain/repositories/video_list_repository.dart';
import '../features/main_home/domain/use_cases/get_most_popular_use_case.dart';
import '../features/main_home/presentation/manager/get_most_popular_videos/get_most_popular_videos_cubit.dart';

Future<void> videoListInit(GetIt sl) async {
  // Cubit
  sl.registerLazySingleton(() => GetMostPopularVideosCubit(
        getMostPopularVideoUseCase: sl<GetMostPopularVideoUseCase>(),
      ));

  // Use cases
  sl.registerFactory(() => GetMostPopularVideoUseCase(
        videoListRepository: sl<VideoListRepository>(),
      ));

  // Repository
  sl.registerFactory<VideoListRepository>(() => VideoListRepositoryImp(
        videoListDataSources: sl<VideoListDataSources>(),
        flutterToast: Fluttertoast(),
      ));

  // Data sources
  sl.registerFactory<VideoListDataSources>(
      () => VideoListDataSourcesImp(networkHelper: sl<NetworkHelper>()));
}
