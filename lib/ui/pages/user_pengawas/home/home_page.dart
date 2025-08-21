// ignore_for_file: avoid_redundant_argument_values, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/calculator/calculator_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/notification/notification_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/userl_pdl/detail_user_pdl_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_empty.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_background_gradient.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_date.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          // dataBalance(),
        ],
      ),
    );
  }

  Widget itemUserPdl({Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: marginPage,
          vertical: 8,
        ),
        padding: EdgeInsets.all(16),
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
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
                image: DecorationImage(
                    image: AssetImage("assets/images/im_sample.png"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe",
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: greyTextStyle.copyWith(fontSize: 14),
                    text: "No resort ",
                    children: [
                      TextSpan(
                        text: "3",
                        style: blackTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 15,
              backgroundColor: greyColor.withOpacity(0.25),
              child: Icon(
                Icons.chevron_right_outlined,
                color: primaryColor,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarEmpty(
        isGradient: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            information(),
            const SizedBox(height: 30),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return itemUserPdl(onTap: () {
                  nextScreen(context, DetailUserPdlPage());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
