import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:video_preview/features/main_home/presentation/pages/video_details_screen.dart';
import 'package:video_preview/features/main_home/presentation/widgets/search_widget.dart';
import '../../../../core/presentation/fonts_manger/fonts_manger.dart';
import '../../../../core/presentation/style_manger/style_manger.dart';
import '../../../../shared/navigations/AppRoutes.dart';
import '../../data/models/video_list_response.dart';
import '../manager/get_most_popular_videos/get_most_popular_videos_cubit.dart';
import '../manager/search/search_cubit.dart';
import '../widgets/header_widget.dart';
import '../widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PagingController<String, VideoListItem> _pagingController =
      PagingController(firstPageKey: "");
  TextEditingController controller = TextEditingController();
  bool showNewResult = false;
  @override
  void initState() {
    context.read<SearchCubit>().changeIcon(false);
    _pagingController.addPageRequestListener((pageKey) {
      showNewResult == false
          ? context
              .read<GetMostPopularVideosCubit>()
              .getMostPopularVideos(pageKey, "videos", "")
          : context
              .read<GetMostPopularVideosCubit>()
              .getMostPopularVideos(pageKey, "search", controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding:
          EdgeInsets.only(left: 21.w, right: 19.w, bottom: 10.h, top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWidget(),
          BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
            if (state is SearchLoaded) {
              if (state.useSearch == true) {
                return SearchWidget(
                    pagingController: _pagingController,
                    controller: controller,
                    iconPath: "assets/svg/exit_icon.svg",
                    onIconTapped: () {
                      controller.clear();
                      context.read<SearchCubit>().changeIcon(false);
                    });
              } else {
                return SearchWidget(
                    pagingController: _pagingController,
                    controller: controller,
                    iconPath: "assets/svg/search_icon.svg",
                    onIconTapped: () {
                      _pagingController.itemList?.clear();
                      context
                          .read<GetMostPopularVideosCubit>()
                          .getMostPopularVideos('', "videos", "");
                    });
              }
            } else {
              return const SizedBox();
            }
          }),
          BlocBuilder<GetMostPopularVideosCubit, GetMostPopularVideosState>(
              builder: (context, state) {
            if (state is GetMostPopularVideosLoaded) {
              showNewResult = state.showResult;
              return Text(
                (state.showResult == true) ? "Results" : "Videos for you",
                style: getPoppinsStyle(
                    fontSize: FontSize.s18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeightManager.simBold),
              );
            } else {
              return const SizedBox();
            }
          }),
          Expanded(
            child: BlocConsumer<GetMostPopularVideosCubit,
                GetMostPopularVideosState>(listener: (context, state) {
              if (state is GetMostPopularVideosLoaded) {
                final item = state.videoListResponse.items;
                final bool isLastPage =
                    (state.videoListResponse.nextPageToken == null);
                if (isLastPage) {
                  _pagingController.appendLastPage(item!);
                } else {
                  _pagingController.appendPage(
                      item!, "${state.videoListResponse.nextPageToken}");
                }
              }
            }, builder: (context, state) {
              return PagedListView(
                builderDelegate: PagedChildBuilderDelegate<VideoListItem>(
                    noItemsFoundIndicatorBuilder: (context) {
                  return const Center(child: CircularProgressIndicator());
                }, itemBuilder: (context, videoListItem, index) {
                  return InkWell(
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.videoDetailsScreen,
                          arguments: videoListItem);
                    },
                    child: VideoCard(
                        imageUrl:
                            "${videoListItem.snippet?.thumbnails?.medium?.url}"),
                  );
                }),
                pagingController: _pagingController,
              );
            }),
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
