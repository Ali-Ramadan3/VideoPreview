import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../data/models/video_list_response.dart';

class VideoDetailsController extends GetxController {
  late YoutubePlayerController _controller;
  VideoListItem? videoListItem;

  VideoDetailsController(this.videoListItem);

  @override
  void onInit() {
    super.onInit();
    _controller = YoutubePlayerController(
      initialVideoId: "${videoListItem?.id}",
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: true,
        loop: false,
        enableCaption: false,
      ),
    );
  }

  YoutubePlayerController get controller => _controller;

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
