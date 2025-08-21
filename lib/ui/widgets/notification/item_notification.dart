// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/detail_applyment_page.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        nextScreen(
          context,
          DetailApplymentPage(
            status: "Pengajuan Baru",
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Pengajuan disetujui",
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Lihat disini",
                              style: blackTextStyle.copyWith(),
                            ),
                            SizedBox(width: 2),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.grey.withOpacity(0.25),
                              child: Icon(
                                Icons.chevron_right_outlined,
                                color: green1Color,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Pengajuan pinjaman ke 1 anggota John Doe dengan nominal pinjaman Rp 1.000.000 telah disetujui",
                    style: blackTextStyle.copyWith(
                      fontSize: 13.sp,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "1 menit yang lalu",
                    style: greyTextStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
