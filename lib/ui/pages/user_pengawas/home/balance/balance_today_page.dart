import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_background.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_date.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/timeline_custom/timeline_balance.dart';

class BalanceTodayPage extends StatefulWidget {
  const BalanceTodayPage({Key? key}) : super(key: key);

  @override
  State<BalanceTodayPage> createState() => _BalanceTodayPageState();
}

class _BalanceTodayPageState extends State<BalanceTodayPage> {
  Widget information() {
    return CardBackground(
      padding: const EdgeInsets.only(
          left: marginPage, right: marginPage, bottom: 28),
      widget: Column(
        children: [
          const CardDate(),
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
                Text(
                  "Total Saldo Hari Ini",
                  style: blackTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular),
                ),
                const SizedBox(height: 10),
                Text(
                  "Rp 2.150.000",
                  style:
                      blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget timelineTile() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: marginPage, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Riwayat Saldo Hari Ini",
              style: blackTextStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: bold,
              )),
          const SizedBox(height: 20),
          const TimelineBalance(
            date: "24/05/2022 - 09:15",
            description: "Pengeluaran bon sementara Rp 30.000",
            balance: "Rp 2.150.000",
            isFirst: true,
          ),
          const TimelineBalance(
            date: "24/05/2022 - 09:15",
            description: "Pengeluaran bon sementara Rp 30.000",
            balance: "Rp 2.150.000",
            isFirst: true,
          ),
          const TimelineBalance(
            date: "24/05/2022 - 09:15",
            description: "Pengeluaran bon sementara Rp 30.000",
            balance: "Rp 2.150.000",
            isFirst: true,
          ),
          const TimelineBalance(
            date: "24/05/2022 - 09:15",
            description:
                "Storting no pinjaman 5 nasabah John Doe angsuran ke 6 Rp 110.000. Jumlah yang distorting Rp 60.000",
            balance: "Rp 2.180.000",
            isLast: true,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPrimary(
        title: "Saldo Hari Ini",
        color: lightGreen1Color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            information(),
            timelineTile(),
          ],
        ),
      ),
    );
  }
}
