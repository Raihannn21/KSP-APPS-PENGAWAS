import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/badge/item_badge.dart';

class ItemBon extends StatelessWidget {
  final Function()? onTap;
  const ItemBon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rp 20.000",
                  style: blackTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: bold),
                ),
                ItemBadge(
                  title: "Ditolak",
                  color: lightGreen1Color,
                  titleStyle: blackTextStyle.copyWith(
                      fontSize: 10.sp, fontWeight: regular),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Lorem ipsum dolor sit amet, set et du consectetur adipiscing elit",
              style:
                  blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: regular),
            ),
            const SizedBox(height: 8),
            Text(
              "12/04/2022 - 10:34",
              style:
                  blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
            ),
          ],
        ),
      ),
    );
  }
}
