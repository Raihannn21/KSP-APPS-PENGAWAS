// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/balance/balance_today_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/calculator/calculator_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/notification/notification_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/userl_pdl/detail_target_realization_pdl_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/userl_pdl/pdl_location_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_background_gradient.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_date.dart';

class DetailUserPdlPage extends StatefulWidget {
  const DetailUserPdlPage({Key? key}) : super(key: key);

  @override
  State<DetailUserPdlPage> createState() => _DetailUserPdlPageState();
}

class _DetailUserPdlPageState extends State<DetailUserPdlPage> {
  Widget dataBalance() {
    Widget rowText(String leftText, String rightText) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: greyTextStyle.copyWith(fontSize: 14.sp, fontWeight: regular),
          ),
          Text(
            rightText,
            style: blackTextStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: bold,
              color: leftText == "Dropping" ? Colors.red : green1Color,
            ),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () => nextScreen(context, BalanceTodayPage()),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: marginPage),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(30),
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
            const SizedBox(height: 10),
            Center(
              child: Row(
                children: [
                  Text(
                    "Rp 2.210.0000",
                    style: blackTextStyle.copyWith(
                      fontSize: 24.sp,
                      fontWeight: bold,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      color: primaryColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            const SizedBox(height: 12),
            rowText("Penerimaan", "Rp 2.000.000"),
            const SizedBox(height: 6),
            rowText("Tunai Kedua", "Rp 220.000"),
            const SizedBox(height: 6),
            rowText("Pelunasan Kedua", "Rp 110.000"),
          ],
        ),
      ),
    );
  }

  Widget information() {
    return CardBackgroundGradient(
      padding: const EdgeInsets.only(
          top: 32, bottom: 28, left: marginPage, right: marginPage),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: whiteColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Nama Unit",
                style:
                    whiteTextStyle.copyWith(fontSize: 20.sp, fontWeight: bold),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  nextScreen(context, const CalculatorPage());
                },
                child: Image.asset(
                  "assets/icons/ic_calculator.png",
                  width: 24.w,
                  color: whiteColor,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  nextScreen(context, const NotificationPage());
                },
                child: Image.asset(
                  "assets/icons/ic_notification.png",
                  width: 24.w,
                  color: whiteColor,
                ),
              ),
            ],
          ),
          const CardDate(),
          dataBalance(),
        ],
      ),
    );
  }

  Widget entryTarget(
    String title,
    String nominal,
    String target, {
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: marginPage),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
                    children: [
                      Text(
                        nominal,
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: bold),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey.withOpacity(0.25),
                        child: Icon(
                          Icons.chevron_right_outlined,
                          color: green1Color,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    target,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: lightGreen1Color,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Detail PDL",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: green1Color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      "Rabu, 24 Mei 2022",
                      style: whiteTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: semibold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        "Resort 1C",
                        style: blackTextStyle.copyWith(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/im_sample.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                      ),
                      SizedBox(height: 2),
                      RichText(
                        text: TextSpan(
                          text: "No resort ",
                          style: greyTextStyle.copyWith(
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: "1",
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 16),
              Divider(thickness: 0.2, color: greyColor),
              SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: marginPage),
                child: Text(
                  "Saldo Hari Ini",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              dataBalance(),
              SizedBox(height: 10),
              Divider(thickness: 0.2, color: greyColor),
              SizedBox(height: 16),
              entryTarget(
                "Target Realisasi Hari Ini",
                "Rp 5.000.000",
                "2 / 3 Anggota",
                onTap: () =>
                    nextScreen(context, DetailTargetRealizationPdlPage()),
              ),
              SizedBox(height: 24),
              InkWell(
                onTap: () {
                  nextScreen(context, PdlLocationPage());
                },
                child: Container(
                  height: 284,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/im_maps.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
