import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_outline.dart';

class DroppingLoanPage extends StatelessWidget {
  const DroppingLoanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nominalLoanController = TextEditingController(text: "Rp 950.000");
    final noteController =
        TextEditingController(text: "Lorem ipsum dolor sit amet consectectur");

    Widget itemLoan(String title, String subtitle, bool subtitleIsBold) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1, color: greyColor.withOpacity(0.3))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  title,
                  style: greyTextStyle.copyWith(
                      fontSize: 12.sp, fontWeight: regular),
                ),
              ),
              Text(
                subtitle,
                style: blackTextStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: subtitleIsBold == true ? bold : regular,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget dataLoan() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Pinjaman',
              style: blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              children: [
                itemLoan("Tanggal Dropping", "24/05/2022", false),
                const SizedBox(width: 12),
                itemLoan("Pinjaman", "Rp 1.000.000", true),
              ],
            ),
          ),
          CustomInputOutline(
            title: "Sisa yang di dropping",
            controller: nominalLoanController,
            isReadOnly: true,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(thickness: 1),
          )
        ],
      );
    }

    Widget itemPhoto(String title) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              style: greyTextStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: regular,
              ),
            ),
          ),
          Container(
            width: 76.w,
            height: 76.w,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: primaryColor),
          ),
        ],
      );
    }

    Widget dataSpk() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Surat Penjanjian Kredit",
              style: blackTextStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: regular,
              ),
            ),
          ),
          itemPhoto("Foto nasabah sedang menanda tangani SPK"),
          itemPhoto("Foto nasabah dan SPK yang sudah ditanda tangan"),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: Divider(thickness: 1),
          )
        ],
      );
    }

    Widget proof() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Bukti dropping",
              style:
                  blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: CustomInputOutline(
              title: "Note",
              titleStyle:
                  greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
              controller: noteController,
              maxLines: 3,
              isReadOnly: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Foto",
                    style: greyTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: regular),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 76.w,
                      height: 76.w,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: primaryColor),
                    ),
                    const SizedBox(width: 13),
                    Container(
                      width: 76.w,
                      height: 76.w,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBarPrimary(
        title: "Rincian Dropping",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dataLoan(),
            dataSpk(),
            proof(),
          ],
        ),
      ),
    );
  }
}
