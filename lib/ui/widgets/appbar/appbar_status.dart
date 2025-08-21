// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class AppBarStatus extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? color;
  final bool backIsDisable;
  final Function()? onBack;
  final String? status;

  const AppBarStatus(
      {super.key,
      required this.title,
      this.actions,
      this.color,
      this.onBack,
      this.backIsDisable = false,
      this.status});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color ?? primaryColor,
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 0.0,
      // shape: Border(bottom: BorderSide(color: kScaffoldColor, width: 2)),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  bottom: 15, left: marginPage, right: marginPage),
              child: !backIsDisable
                  ? Row(
                      children: [
                        GestureDetector(
                            onTap: onBack ?? () => Navigator.of(context).pop(),
                            child: Icon(Icons.arrow_back,
                                color: color != null ? green2Color : whiteColor,
                                size: 22)),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            title,
                            style: color != null
                                ? blackTextStyle.copyWith(
                                    fontSize: 20, fontWeight: bold)
                                : whiteTextStyle.copyWith(
                                    fontSize: 20, fontWeight: bold),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        title,
                        style: color != null
                            ? blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold)
                            : whiteTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold),
                      ),
                    ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: () {
                  if (status?.toLowerCase().contains("pengajuan baru") ??
                      false) {
                    return Color(0xFFB36BA3).withOpacity(0.25);
                  }
                  if (status?.toLowerCase().contains("diproses") ?? false) {
                    return lightBlue1Color;
                  }
                  if (status?.toLowerCase().contains("ditolak") ?? false) {
                    return accentColor;
                  }
                  if (status?.toLowerCase().contains("debitur") ?? false) {
                    return lightGreen1Color;
                  }
                  if (status?.toLowerCase().contains("aktif") ?? false) {
                    return lightBlue1Color;
                  }
                  if (status?.toLowerCase().contains("tidak aktif") ?? false) {
                    return lightBlue2Color;
                  }
                  if (status?.toLowerCase().contains("diblokir") ?? false) {
                    return Colors.red.withOpacity(0.25);
                  }
                  return green1Color.withOpacity(0.5);
                }(),
              ),
              child: Center(
                child: Text(
                  status ?? "Ini Status",
                  style: blackTextStyle.copyWith(
                      fontSize: 12.sp, fontWeight: regular),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
