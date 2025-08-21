// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/installment/installment_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/badge/item_badge.dart';

class ItemInstallment extends StatelessWidget {
  final Function()? onTap;
  final TypeInstallment typeInstallment;
  final String? resortCode;
  final String? status;
  const ItemInstallment(
      {Key? key,
      required this.onTap,
      required this.typeInstallment,
      this.resortCode,
      this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget infoNasabah() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: lightGreyColor,
              ),
              child: Text(
                resortCode ?? "3C",
                style: primaryTextStyle.copyWith(
                    fontSize: 20.sp, fontWeight: bold),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      SizedBox(width: 8),
                      Text(
                        "John Doe",
                        style: blackTextStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: bold,
                        ),
                      ),
                    ],
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
                ],
              ),
            ),
            const SizedBox(width: 14),
            ItemBadge(
              title: () {
                if (status != null) {
                  return status;
                } else {
                  if (typeInstallment == TypeInstallment.Lancar) {
                    return "Lancar";
                  }
                  if (typeInstallment == TypeInstallment.GejalaMacet) {
                    return "Gejala Macet";
                  }

                  return " Macet";
                }
              }(),
              titleStyle: blackTextStyle.copyWith(fontSize: 10.sp),
              color: () {
                if (status != null) {
                  if (status == "Lancar") {
                    return lightGreen1Color;
                  }
                  if (status == "Gejala Macet") {
                    return accentColor;
                  }
                  return Colors.red[200];
                } else {
                  if (typeInstallment == TypeInstallment.Lancar) {
                    return lightGreen1Color;
                  }
                  if (typeInstallment == TypeInstallment.GejalaMacet) {
                    return accentColor;
                  }

                  return Colors.red[200];
                }
              }(),
            )
          ],
        ),
      );
    }

    Widget infoAngsuran() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Angsuran Minggu ke ",
              style:
                  greyTextStyle.copyWith(fontSize: 14.sp, fontWeight: regular),
            ),
            const SizedBox(width: 4),
            Text(
              "6",
              style: blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
            ),
            const Spacer(),
            Text(
              "Rp 110.000",
              style: blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
            )
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.08),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Column(
          children: [
            infoNasabah(),
            Divider(thickness: 0.2, color: greyColor),
            infoAngsuran(),
          ],
        ),
      ),
    );
  }
}
