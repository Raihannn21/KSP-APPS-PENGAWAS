// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/badge/item_badge.dart';

class ItemCustomerHorizontal extends StatelessWidget {
  final Function()? onTap;
  const ItemCustomerHorizontal({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.w,
        height: 165.h,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.08),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(2, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: lightGreyColor,
              ),
              child: Text(
                "3C",
                style: primaryTextStyle.copyWith(
                    fontSize: 20.sp, fontWeight: bold),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "John Doe",
              style: blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: bold),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                Text(
                  "Kode Anggota",
                  style: greyTextStyle.copyWith(
                      fontSize: 12.sp, fontWeight: regular),
                ),
                const SizedBox(width: 4),
                Text(
                  "25",
                  style: blackTextStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.orange.shade200,
                  child: Text(
                    "U",
                    style: whiteTextStyle.copyWith(fontSize: 13.sp),
                  ),
                ),
                SizedBox(width: 4),
                ItemBadge(
                  title: "Debitur",
                  color: lightGreen1Color,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
