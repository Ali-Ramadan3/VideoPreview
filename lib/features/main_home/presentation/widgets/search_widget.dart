import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/presentation/color_manger/colors.dart';
import '../../../../core/presentation/fonts_manger/fonts_manger.dart';
import '../../../../core/presentation/style_manger/style_manger.dart';
import '../../data/models/video_list_response.dart';
import '../manager/get_most_popular_videos/get_most_popular_videos_cubit.dart';
import '../manager/search/search_cubit.dart';

class SearchWidget extends StatelessWidget {
  final PagingController<String, VideoListItem> pagingController;
  final TextEditingController controller;
  final String iconPath;
  final GestureTapCallback? onIconTapped;
  const SearchWidget({
    Key? key,
    required this.controller,
    required this.iconPath,
    this.onIconTapped,
    required this.pagingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.w),
          color: Theme.of(context).cardColor,
        ),
        margin: EdgeInsets.only(bottom: 26.h),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                iconPath,
              ),
              onPressed: onIconTapped,
            ),
            contentPadding: EdgeInsets.only(
                top: 12.5.h, bottom: 12.5.h, left: 35.w, right: 10.w),
            hintText: 'search for video',
            hintStyle: getPoppinsStyle(
                fontSize: FontSize.s14,
                color: Theme.of(context).hintColor,
                fontWeight: FontWeightManager.medium),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.w,
                  color: ColorManger.lightSearchBackground), //<-- SEE HERE
              borderRadius: BorderRadius.circular(18.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.w,
                  color: ColorManger.lightSearchBackground), //<-- SEE HERE
              borderRadius: BorderRadius.circular(18.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.w,
                  color: ColorManger.lightSearchBackground), //<-- SEE HERE
              borderRadius: BorderRadius.circular(18.w),
            ),
          ),
          onSubmitted: (txt) {
            pagingController.itemList?.clear();
            context
                .read<GetMostPopularVideosCubit>()
                .getMostPopularVideos("", "search", controller.text);
          },
          onChanged: (txt) {
            context.read<SearchCubit>().changeIcon(true);
          },
        ));
  }
}
