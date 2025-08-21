// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/loan/detail_admission_loan_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_background.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/storting/item_review_instalment.dart';

class DetailBillPage extends StatefulWidget {
  const DetailBillPage({Key? key}) : super(key: key);

  @override
  State<DetailBillPage> createState() => _DetailBillPageState();
}

class _DetailBillPageState extends State<DetailBillPage> {
  Widget itemInfo(Color color, String title) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
        )
      ],
    );
  }

  Widget _information() {
    return CardBackground(
      padding: const EdgeInsets.only(
        top: 20,
        left: marginPage,
        right: marginPage,
        bottom: 28,
      ),
      widget: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20),
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Sisa Saldo Pinjaman",
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                  ),
                ),
                Text(
                  "Rp 1.100.000",
                  style:
                      blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: false,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 14, bottom: 16),
                              child: Column(
                                children: [
                                  Text(
                                    'Sudah Bayar',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Rp 390.000',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: greyColor.withOpacity(0.2),
                          ),
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 14, bottom: 16),
                              child: Column(
                                children: [
                                  Text(
                                    'Sisa Pembayaran',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Rp 710.000',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _historyPayment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Riwayat Pembayaran",
              style: blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                itemInfo(greenBrightColor, "Lunas"),
                const SizedBox(width: 10),
                itemInfo(accentColor, "Bayar Sebagian"),
                const SizedBox(width: 10),
                itemInfo(pinkColor, "Tertunda")
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.only(
              bottom: 17,
              top: 17,
              left: 25,
              right: 14,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: lightGreen3Color,
            ),
            child: Row(
              children: [
                Text(
                  "Tgl Angsuran",
                  style: blackTextStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Text(
                    "Tagihan",
                    style: blackTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: regular),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "Pembayaran",
                    style: blackTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: regular),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ItemReviewInstalment(
                index: "17/05/2022",
                onTap: () {
                  nextScreen(context, DetailAdmissionLoanPage());
                },
                color: primaryColor,
                tagihan: "Rp 110.0000",
                pembayaran: "Rp 110.000",
                isActive: true,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Tagihan",
        color: lightGreen1Color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _information(),
            _historyPayment(),
          ],
        ),
      ),
    );
  }
}
