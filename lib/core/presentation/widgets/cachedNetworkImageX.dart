import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget cachedNetworkImageX({
  @required imageUrl,
  BoxFit? boxFit,
  double? imageHeight,
  double? imageWidth,
  double? borderRadius,
}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: boxFit ?? BoxFit.contain,
    imageBuilder: (context, imageProvider) => Container(
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 20.w),
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: imageHeight,
          width: imageWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.w),
            color: Colors.white,
          ),
        )),
    errorWidget: (context, url, error) => cachedNetworkImageX(
        imageUrl: 'https://i.imgur.com/rNdMwuZ.jpg',
        boxFit: BoxFit.cover,
        imageHeight: imageHeight,
        imageWidth: imageWidth),
  );
}
