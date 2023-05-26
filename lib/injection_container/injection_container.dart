import 'package:get_it/get_it.dart';
import 'package:video_preview/injection_container/video_list_dependencies.dart';

import '../core/data/network/network_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  videoListInit(sl);

  sl.registerFactory<NetworkHelper>(() => NetworkHelper());
}
