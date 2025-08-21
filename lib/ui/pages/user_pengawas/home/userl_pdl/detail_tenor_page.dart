// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, omit_local_variable_types

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_status.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/expansion/custom_expansion_tile.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class DetailTenorPage extends StatefulWidget {
  const DetailTenorPage({Key? key}) : super(key: key);

  @override
  State<DetailTenorPage> createState() => _DetailTenorPageState();
}

class _DetailTenorPageState extends State<DetailTenorPage> {
  List<String> listResult = ["Penerimaan Awal", "Tunai Kedua"];
  List<bool> listExpaned = [];

  TextEditingController noteController = TextEditingController();
  Widget rowText(
    String leftText,
    String rightText, {
    bool boldLeftText = false,
    bool boldRightText = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: blackTextStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: boldLeftText ? bold : regular,
          ),
        ),
        Text(
          rightText,
          style: blackTextStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: boldLeftText ? bold : regular,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listExpaned = listResult.map((e) => false).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatus(
        title: "Rincian Penerimaan",
        status: "Lunas",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Angsuran",
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Angsuran bulan ke 1",
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(children: [
                  Text(
                    "Total tagihan",
                    style: greyTextStyle.copyWith(fontWeight: semibold),
                  ),
                  Spacer(),
                  Text(
                    "Rp 110.000",
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 16),
              ...listResult.map((e) {
                final index = listResult.indexWhere((a) => e == a);
                return CustomExpansionTile(
                  title: "$e",
                  subtitle: "24/06/2022",
                  isExpanded: listExpaned[index],
                  onExpansionChanged: (bool expanding) =>
                      setState(() => listExpaned[index] = expanding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Tanggal Angsuran ",
                            style: greyTextStyle.copyWith(fontSize: 13),
                          ),
                          Text(
                            "24/06/2022",
                            style: blackTextStyle.copyWith(
                              fontWeight: semibold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 0.2, color: greyColor),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: greyColor.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            rowText("Angsuran Jasa", "Rp 1.000.000"),
                            SizedBox(height: 4),
                            rowText("Angsuran Pokok", "Rp -"),
                            SizedBox(height: 10),
                            Divider(thickness: 0.5, color: greyColor),
                            SizedBox(height: 4),
                            rowText("Angsuran tunggakan jasa", "Rp -"),
                            SizedBox(height: 4),
                            rowText("Angsuran tunggakan pokok", "Rp -"),
                            SizedBox(height: 10),
                            Divider(thickness: 0.5, color: greyColor),
                            SizedBox(height: 4),
                            rowText(
                              "Jumlah penerimaan",
                              "Rp 1.000.000",
                              boldLeftText: true,
                              boldRightText: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: greyColor.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            rowText("Jasa yang belum dibayar", "Rp 1.000.000"),
                            SizedBox(height: 4),
                            rowText("Tunggakan pokok", "Rp -"),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Bukti penerimaan",
                        style: blackTextStyle.copyWith(
                          fontWeight: semibold,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomInputText(
                        title: "Note",
                        controller: noteController,
                        maxLines: 3,
                        isReadOnly: true,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Foto",
                        style: greyTextStyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [1, 2, 3]
                            .map(
                              (e) => Container(
                                width: 76.w,
                                height: 76.w,
                                margin: const EdgeInsets.only(
                                  bottom: 12,
                                  right: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: primaryColor,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                );
              }).toList(),
              Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: green1Color.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: rowText(
                    "Sisa Pinjaman",
                    "Rp 900.000",
                    boldLeftText: true,
                    boldRightText: true,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
