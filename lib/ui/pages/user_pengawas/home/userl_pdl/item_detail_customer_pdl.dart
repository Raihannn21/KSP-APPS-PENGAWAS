// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/badge/item_badge.dart';

class ItemDetailCustomerPdl extends StatefulWidget {
  final Function()? onTap;
  final String? status;
  const ItemDetailCustomerPdl({Key? key, required this.onTap, this.status})
      : super(key: key);

  @override
  State<ItemDetailCustomerPdl> createState() => _ItemDetailCustomerPdlState();
}

class _ItemDetailCustomerPdlState extends State<ItemDetailCustomerPdl> {
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
                "3C",
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
                          style: whiteTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "John Doe",
                        style: blackTextStyle.copyWith(
                            fontSize: 16.sp, fontWeight: bold),
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
              title: widget.status,
              color: () {
                if (widget.status == "Lancar") {
                  return green1Color.withOpacity(0.25);
                } else if (widget.status == "Gejala Macet") {
                  return accentColor.withOpacity(0.25);
                } else {
                  return Colors.redAccent.withOpacity(0.25);
                }
              }(),
              titleStyle: greyTextStyle.copyWith(
                fontSize: 10,
                fontWeight: semibold,
              ),
            )
          ],
        ),
      );
    }

    Widget infoLocation() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Image.asset(
              "assets/icons/ic_location.png",
              width: 18.w,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                "Jl. Soekarno Hatta, No. 05",
                style: greyTextStyle.copyWith(
                    fontSize: 12.sp, fontWeight: regular),
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 18),
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
          ],
        ),
        child: Column(
          children: [
            infoNasabah(),
            Container(
              margin: const EdgeInsets.only(top: 17, bottom: 10),
              child: const Divider(thickness: 1),
            ),
            infoLocation(),
          ],
        ),
      ),
    );
  }
}
