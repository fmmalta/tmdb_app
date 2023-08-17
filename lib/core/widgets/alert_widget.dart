import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlertWidget extends StatelessWidget {
  final String iconPath;
  final String description;
  final Color? iconColor;
  const AlertWidget({
    required this.iconPath,
    required this.description,
    this.iconColor,
    super.key,
  });

  factory AlertWidget.noConnection() => const AlertWidget(
        iconColor: Colors.white,
        iconPath: 'assets/noInternetIcon.svg',
        description: "Verifique sua conexão com a internet",
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            iconColor ?? Colors.white.withOpacity(0.6),
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
