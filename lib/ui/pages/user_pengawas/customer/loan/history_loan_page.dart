// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/loan/dropping_loan_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/installment/detail_installment_and_spk_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_background.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/expansion/custom_expansion_tile.dart';

class HistoryLoanPage extends StatefulWidget {
  const HistoryLoanPage({Key? key}) : super(key: key);

  @override
  State<HistoryLoanPage> createState() => _HistoryLoanPageState();
}

class _HistoryLoanPageState extends State<HistoryLoanPage> {
  bool isOpenLetter = false;

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
            padding: const EdgeInsets.symmetric(vertical: 20),
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
                    "Total Pinjaman",
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                  ),
                ),
                Text(
                  "Rp 2.150.000",
                  style:
                      blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 14, bottom: 16, left: marginPage, right: marginPage),
                  child: Divider(thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Total Simpanan",
                    style: blackTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: regular),
                  ),
                ),
                Text(
                  "Rp 50.000",
                  style: blackTextStyle.copyWith(
                      fontSize: 16.sp, fontWeight: bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Riwayat Pinjaman",
        color: lightGreen1Color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _information(),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomExpansionTile(
                    title: "Pinjaman ke ${5 - index}",
                    isExpanded: isOpenLetter,
                    onExpansionChanged: (bool expanding) =>
                        setState(() => isOpenLetter = expanding),
                    child: itemHistoryLoan(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemHistoryLoan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
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
                          padding: const EdgeInsets.only(top: 14, bottom: 16),
                          child: Column(
                            children: [
                              Text(
                                'Tanggal Pengajuan',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: regular,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '24/05/2022',
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
                          padding: const EdgeInsets.only(top: 14, bottom: 16),
                          child: Column(
                            children: [
                              Text(
                                'Tanggal Disetujui',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: regular,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '26/05/2022',
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
              Divider(
                indent: 10,
                endIndent: 10,
                height: 0,
                thickness: 1,
                color: greyColor.withOpacity(0.2),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tanggal Dropping ",
                      style: greyTextStyle.copyWith(fontSize: 13),
                    ),
                    Text(
                      "Rabu, 12 April 2022",
                      style: blackTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: semibold,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                height: 0,
                thickness: 1,
                color: greyColor.withOpacity(0.2),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tanggal Pelunasan ",
                      style: greyTextStyle.copyWith(fontSize: 13),
                    ),
                    Text(
                      "Rabu, 21 Juni 2022",
                      style: blackTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: semibold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pinjaman",
                      style: blackTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: regular),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rp 1.000.000",
                          style: blackTextStyle.copyWith(
                              fontSize: 24.sp, fontWeight: bold),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            nextScreen(context, DroppingLoanPage());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: greyColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.chevron_right,
                              color: primaryColor,
                              size: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: greyColor.withOpacity(0.2),
                    ),
                    Text(
                      "Simpanan",
                      style: blackTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: regular),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Rp 10.000",
                      style: blackTextStyle.copyWith(
                          fontSize: 18.sp, fontWeight: bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ButtonPrimary(
          title: "Lihat Angsuran & Lampiran",
          onTap: () {
            nextScreen(context, DetailInstallmentAndSpkPage());
          },
        ),
      ],
    );
  }

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
}
