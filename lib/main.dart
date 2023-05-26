import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_preview/shared/navigations/AppPages.dart';
import 'core/presentation/themes/theme.dart';
import 'features/main_home/presentation/manager/get_most_popular_videos/get_most_popular_videos_cubit.dart';
import 'features/main_home/presentation/manager/play_video/play_video_cubit.dart';
import 'features/main_home/presentation/manager/search/search_cubit.dart';
import 'injection_container/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) => MultiBlocProvider(
              providers: [
                BlocProvider<SearchCubit>(
                  create: (_) => SearchCubit(),
                ),
                BlocProvider<PlayVideoCubit>(
                  create: (_) => PlayVideoCubit(),
                ),
                BlocProvider<GetMostPopularVideosCubit>(
                  create: (_) => di.sl<GetMostPopularVideosCubit>(),
                ),
              ],
              child: GetMaterialApp.router(
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                // translations: Languages(),
                locale: Get.deviceLocale,
                fallbackLocale: const Locale('en', 'US'),
                getPages: AppPages.routes,
                debugShowCheckedModeBanner: false,
                routeInformationParser:
                    Get.createInformationParser(initialRoute: AppPages.initial),
              ),
            ));
  }
}
