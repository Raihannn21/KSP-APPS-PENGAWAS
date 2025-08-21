// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';

class HistoryMealPage extends StatelessWidget {
  const HistoryMealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Uang Makan",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Riwayat Uang Makan",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: green1Color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    "Tanggal",
                    style: blackTextStyle.copyWith(fontWeight: semibold),
                  ),
                  Spacer(),
                  Text(
                    "Nominal",
                    style: blackTextStyle.copyWith(fontWeight: semibold),
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    rowText("17/05/2022", "Rp. 10.000"),
                    rowText("17/05/2022", "Rp. 10.000"),
                    rowText("17/05/2022", "Rp. 10.000"),
                    rowText("17/05/2022", "Rp. 10.000"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowText(String text1, String text2) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: greyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            "$text1",
            style: blackTextStyle.copyWith(fontWeight: semibold),
          ),
          Spacer(),
          Text(
            "$text2",
            style: blackTextStyle.copyWith(fontWeight: semibold),
          )
        ],
      ),
    );
  }
}
