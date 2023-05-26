import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/presentation/fonts_manger/fonts_manger.dart';
import '../../../../core/presentation/style_manger/style_manger.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 26.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello John Lee!",
            style: getPoppinsStyle(
                fontSize: FontSize.s20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeightManager.bold),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/svg/notifaction_icon.svg",
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
