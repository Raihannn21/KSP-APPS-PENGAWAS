// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';

class DetailProofOfSpkPage extends StatelessWidget {
  const DetailProofOfSpkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Bukti",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Penyerahan Simpanan & Jaminan",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Note",
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              child: Text("Lorem ipsum dolor sit amet \n\n"),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Foto penyerahan simpanan",
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: lightGreen2Color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text(
              "Foto penyerahan jaminan",
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: lightGreen2Color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text(
              "Foto bersama nasabah sambil memegang simpanan & jaminan",
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: lightGreen2Color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
