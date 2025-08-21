// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _nominalController = TextEditingController();
  bool showResult = false;

  Widget titleRow(String title, String nominal,
      {bool boldTitle = false, bool boldNominal = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: boldTitle ? bold : regular,
          ),
        ),
        Text(
          nominal,
          style: blackTextStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: boldNominal ? bold : regular,
          ),
        )
      ],
    );
  }

  Widget pieceTile(String title, String nominal) {
    return Container(
      margin: const EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: greyTextStyle.copyWith(fontSize: 13.sp, fontWeight: regular),
          ),
          Text(
            nominal,
            style: greyTextStyle.copyWith(fontSize: 13.sp, fontWeight: regular),
          )
        ],
      ),
    );
  }

  Widget dataResultCalculator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleRow("Pinjaman", "Rp 1.000.000"),
        const SizedBox(height: 4),
        pieceTile("Potongan Adm 3%", "Rp 40.000"),
        pieceTile("Potongan Provisi 1%", "Rp 40.000"),
        pieceTile("Potongan Simpanan 5%", "Rp 10.000"),
        const Divider(thickness: 1),
        titleRow("Total yang diterima", "Rp 950.000"),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          margin: const EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
            color: green1Color.withOpacity(0.25),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tenor",
                style: blackTextStyle.copyWith(
                    fontSize: 12.sp, fontWeight: regular),
              ),
              const SizedBox(width: 4),
              Text(
                "10 Bulan",
                style:
                    blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: bold),
              )
            ],
          ),
        ),
        Text(
          "Angsuran normal per bulan",
          style: blackTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
        ),
        Text(
          "Bunga 6% menurun dengan rata-rata bunga 3.3% pertahun",
          style: greyTextStyle.copyWith(fontWeight: regular),
        ),
        const SizedBox(height: 16),
        titleRow("Tenor", "Tagihan", boldTitle: true),
        const SizedBox(height: 10),
        pieceTile("Bulan 1", "Rp 160.000"),
        pieceTile("Bulan 2", "Rp 154.000"),
        pieceTile("Bulan 3", "Rp 148.000"),
        pieceTile("Bulan 4", "Rp 142.000"),
        pieceTile("Bulan 5", "Rp 136.000"),
        pieceTile("Bulan 6", "Rp 130.000"),
        pieceTile("Bulan 7", "Rp 124.000"),
        pieceTile("Bulan 8", "Rp 118.000"),
        pieceTile("Bulan 9", "Rp 112.000"),
        pieceTile("Bulan 10", "Rp 106.000"),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: blackColor.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Jumlah Angsuran Normal",
                style: blackTextStyle.copyWith(
                    fontSize: 14.sp, fontWeight: regular),
              ),
              Text(
                "Rp 1.100.000",
                style:
                    blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Kalkulator",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
        child: Column(
          children: [
            CustomInputText(
              title: "Masukkan Nominal",
              controller: _nominalController,
              inputType: TextInputType.number,
              hintText: "0",
              isCurrency: true,
            ),
            const SizedBox(height: 30),
            Visibility(visible: showResult, child: dataResultCalculator()),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
        child: ButtonPrimary(
          title: showResult ? "Atur Ulang" : "Hitung",
          onTap: () {
            showResult = !showResult;
            setState(() {});
          },
        ),
      ),
    );
  }
}
