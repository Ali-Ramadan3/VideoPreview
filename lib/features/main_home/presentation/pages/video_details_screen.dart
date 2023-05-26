import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_preview/features/main_home/presentation/widgets/video_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/presentation/color_manger/colors.dart';
import '../../../../core/presentation/fonts_manger/fonts_manger.dart';
import '../../../../core/presentation/style_manger/style_manger.dart';
import '../../data/models/video_list_response.dart';
import '../manager/video_controller.dart';
import '../widgets/header_widget.dart';

class VideoDetailsScreen extends StatefulWidget {
  const VideoDetailsScreen({Key? key}) : super(key: key);

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  VideoListItem? videoListItem;

  @override
  void initState() {
    super.initState();
    videoListItem = Get.rootDelegate.arguments();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: GetBuilder<VideoDetailsController>(
              init: VideoDetailsController(videoListItem),
              builder: (controller) {
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  padding: EdgeInsets.only(
                      left: 21.w, right: 19.w, bottom: 10.h, top: 40.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeaderWidget(),
                        VideoScreen(
                          videoId: "${videoListItem?.id}",
                        ),
                        Text(
                          "${videoListItem?.snippet?.title}",
                          style: getPoppinsStyle(
                            fontSize: FontSize.s18,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeightManager.simBold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h, top: 7.h),
                          child: Text(
                            "${videoListItem?.snippet?.description}",
                            style: getPoppinsStyle(
                              fontSize: FontSize.s14,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeightManager.regular,
                            ).copyWith(height: 1.2.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: TextButton(
                            style: primaryButtonStyle(
                              backGroundColor: Theme.of(context).buttonColor,
                              buttonWidth: double.maxFinite,
                              textColor: Theme.of(context).primaryColorDark,
                              border: 14.w,
                              fontSize: FontSize.s18,
                            ),
                            onPressed: () {},
                            child: const Text("Review"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
