import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class ItemCustomerType extends StatelessWidget {
  final bool isActive;
  final String title;
  final Function() onTap;
  const ItemCustomerType({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget itemActive() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
        ),
        child: Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
        ),
      );
    }

    Widget itemNonActive() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lightGreen4Color,
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: isActive ? itemActive() : itemNonActive(),
    );
  }
}
