import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class CardInitial extends StatelessWidget {
  final String title;
  final Color? bgColor;

  const CardInitial({Key? key, required this.title, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
      decoration: BoxDecoration(
          color: bgColor ?? greyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(14)),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(fontSize: 24.sp, fontWeight: bold),
      ),
    );
  }
}
