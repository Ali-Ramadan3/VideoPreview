import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/widgets/cachedNetworkImageX.dart';

class VideoCard extends StatefulWidget {
  final String imageUrl;
  const VideoCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      margin: EdgeInsets.only(bottom: 20.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.w),
        child: cachedNetworkImageX(
            imageUrl: widget.imageUrl,
            boxFit: BoxFit.fill,
            imageHeight: 175.h,
            imageWidth: 335.w,
            borderRadius: 18.w),
      ),
    );
  }
}
