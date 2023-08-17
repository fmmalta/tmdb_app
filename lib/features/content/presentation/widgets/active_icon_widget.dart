import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ActiveIconWidget extends StatelessWidget {
  final String iconPath;
  const ActiveIconWidget(this.iconPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF36B0E5),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
      margin: EdgeInsets.only(bottom: 5.h),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
    );
  }
}
