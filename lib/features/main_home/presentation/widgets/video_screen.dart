import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/presentation/color_manger/colors.dart';
import '../manager/play_video/play_video_cubit.dart';

class VideoScreen extends StatefulWidget {
  final String videoId;
  const VideoScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    context.read<PlayVideoCubit>().playVideoIcon();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: true,
          loop: false,
          enableCaption: false),
    );

    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      height: 470.h,
      decoration: BoxDecoration(
        color: ColorManger.black,
        borderRadius: BorderRadius.circular(18.w),
      ),
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (BuildContext, player) {
          return Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.w),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                bottomActions: [
                  BlocBuilder<PlayVideoCubit, PlayVideoState>(
                      builder: (context, state) {
                    if (state is PlayVideoLoaded) {
                      return IconButton(
                          onPressed: () {
                            state.playVideo == false
                                ? _controller.play()
                                : _controller.pause();
                            context.read<PlayVideoCubit>().playVideoIcon();
                          },
                          icon: Icon(
                            (state.playVideo == false)
                                ? Icons.play_circle_outline
                                : Icons.pause_circle_outline,
                            color: ColorManger.white,
                          ));
                    } else {
                      return const SizedBox();
                    }
                  }),
                  CurrentPosition(),
                  const SizedBox(width: 5.0),
                  ProgressBar(
                    isExpanded: true,
                  ),
                  FullScreenButton(),
                ],
                aspectRatio: 4 / 3,
                progressIndicatorColor: ColorManger.white,
                onReady: () {
                  print('Player is ready.');
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
