import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class ItemReviewInstalment extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final String? index;
  final String? tagihan;
  final String? pembayaran;
  final bool? isActive;
  const ItemReviewInstalment({
    Key? key,
    this.onTap,
    this.color,
    this.index,
    this.tagihan,
    this.pembayaran,
    this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.only(
          bottom: 17,
          top: 17,
          left: 25,
          right: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: color ??
                greyColor.withOpacity(
                  0.3,
                ),
          ),
        ),
        child: Row(
          children: [
            Text(
              "$index",
              style: blackTextStyle.copyWith(
                fontSize: 10.sp,
                fontWeight: regular,
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: Text(
                tagihan ?? "",
                style:
                    blackTextStyle.copyWith(fontSize: 11.sp, fontWeight: bold),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                pembayaran ?? "",
                style:
                    blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: bold),
              ),
            ),
            isActive == true
                ? Icon(
                    Icons.chevron_right,
                    color: greyColor,
                    size: 18,
                  )
                : const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
