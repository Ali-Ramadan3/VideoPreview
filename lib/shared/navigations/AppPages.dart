import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/main_home/presentation/pages/home_screen.dart';
import '../../features/main_home/presentation/pages/video_details_screen.dart';
import 'AppRoutes.dart';

class AppPages {
  static const initial = Routes.homeScreen;

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.videoDetailsScreen,
      page: () => const VideoDetailsScreen(),
    )
  ];
}
