import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultBottomBarIcon extends StatelessWidget {
  final String iconPath;
  const DefaultBottomBarIcon(
    this.iconPath, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
      child: SvgPicture.asset(iconPath),
    );
  }
}
