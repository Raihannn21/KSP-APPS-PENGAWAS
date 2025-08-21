// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/loan/detail_admission_loan_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_initial.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/expansion/custom_expansion_tile.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/storting/item_review_instalment.dart';

class DetailInstallmentAndSpkPage extends StatefulWidget {
  const DetailInstallmentAndSpkPage({Key? key}) : super(key: key);

  @override
  State<DetailInstallmentAndSpkPage> createState() =>
      _DetailInstallmentAndSpkPageState();
}

class _DetailInstallmentAndSpkPageState
    extends State<DetailInstallmentAndSpkPage> {
  bool isOpenAngsuran = false;
  bool isOpenLetter = false;

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

  Widget _contentInformationDebitur() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CardInitial(title: "3C"),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Doe",
                    style: blackTextStyle.copyWith(
                        fontSize: 18.sp, fontWeight: bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "+62 852 123 456 78",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: regular),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      text: 'Kode Anggota ',
                      style: greyTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: regular),
                      children: <TextSpan>[
                        TextSpan(
                            text: '25',
                            style: blackTextStyle.copyWith(
                              fontSize: 12.sp,
                              fontWeight: bold,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 12),
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: greyColor.withOpacity(0.2),
              ),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/icons/ic_location.png",
                width: 20.w,
              ),
              const SizedBox(width: 7),
              Text(
                "Jl. Soekarno Hatta, No. 05",
                style: greyTextStyle.copyWith(
                    fontSize: 12.sp, fontWeight: regular),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _textColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: regular),
        ),
      ],
    );
  }

  Widget _customerData() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomExpansionTile(
            title: "Riwayat Angsuran",
            isExpanded: isOpenAngsuran,
            onExpansionChanged: (bool expanding) =>
                setState(() => isOpenAngsuran = expanding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Tanggal Pelunasan",
                      style: greyTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: regular),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Rabu, 12 April 2022",
                      style: blackTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: greyColor.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: lightGreen1Color,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tenor",
                                style: blackTextStyle.copyWith(
                                    fontSize: 12.sp, fontWeight: regular),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "10 Minggu",
                                style: blackTextStyle.copyWith(
                                    fontSize: 12.sp, fontWeight: bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Jumlah Tagihan",
                        style: blackTextStyle.copyWith(
                            fontSize: 12.sp, fontWeight: regular),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Rp 1.000.000",
                        style: blackTextStyle.copyWith(
                            fontSize: 24.sp, fontWeight: bold),
                      ),
                      Container(
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
                                  padding: const EdgeInsets.only(
                                      top: 14, bottom: 16),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Angsuran Jasa',
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
                                  padding: const EdgeInsets.only(
                                      top: 14, bottom: 16),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Angsuran Pokok',
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
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Riwayat Pembayaran",
                  style:
                      blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemInfo(greenBrightColor, "Lunas"),
                      itemInfo(accentColor, "Bayar Sebagian"),
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
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        "Tgl Angsuran",
                        style: blackTextStyle.copyWith(
                          fontSize: 12.sp,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Tagihan",
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(
                            fontSize: 12.sp, fontWeight: regular),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Pembayaran",
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(
                            fontSize: 12.sp, fontWeight: regular),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ItemReviewInstalment(
                        index: "17/06/2022",
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
                ),
              ],
            ),
          ),
          CustomExpansionTile(
            title: "Lampiran",
            isExpanded: isOpenLetter,
            onExpansionChanged: (bool expanding) =>
                setState(() => isOpenLetter = expanding),
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    "Surat Perjanjian Kredit",
                    style: blackTextStyle.copyWith(fontSize: 11),
                  ),
                  decoration: BoxDecoration(
                    color: lightGreen1Color,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Angsuran & Lampiran",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _customerData(),
          ],
        ),
      ),
    );
  }
}
