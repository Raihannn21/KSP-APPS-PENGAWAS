import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';

class ResultCalculatorPage extends StatefulWidget {
  const ResultCalculatorPage({Key? key}) : super(key: key);

  @override
  State<ResultCalculatorPage> createState() => _ResultCalculatorPageState();
}

class _ResultCalculatorPageState extends State<ResultCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Kalkulator",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleRow("Pinjaman", "Rp 1.000.000"),
              const SizedBox(height: 4),
              pieceTile("Potongan Adm dan Provinsi", "Rp 40.000"),
              pieceTile("Potongan Simpanan 1%", "Rp 10.000"),
              const Divider(thickness: 1),
              titleRow("Total yang Diterima", "Rp 950.000"),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: lightGreen2Color,
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
                      "10 Minggu",
                      style: blackTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    )
                  ],
                ),
              ),
              titleRow("Cicilan per Minggu", "Rp 110.000"),
              const SizedBox(height: 4),
              pieceTile("Angsuran 90%", "Rp 100.000"),
              pieceTile("Jasa 10%", "Rp 10.000"),
              const SizedBox(height: 30),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(width: 1, color: blackColor.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Angsuran",
                      style: blackTextStyle.copyWith(
                          fontSize: 14.sp, fontWeight: regular),
                    ),
                    Text(
                      "Rp 1.100.000",
                      style: blackTextStyle.copyWith(
                          fontSize: 14.sp, fontWeight: bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget titleRow(String title, String nominal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: regular,
          ),
        ),
        Text(
          nominal,
          style: blackTextStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: bold,
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
            style: greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
          ),
          Text(
            nominal,
            style: greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
          )
        ],
      ),
    );
  }
}
