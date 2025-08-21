// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/loan/form_personal_data_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_status.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_initial.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/expansion/custom_expansion_tile.dart';

class DetailApplymentPage extends StatefulWidget {
  final bool visibleDoublePayment;
  final String? status;
  const DetailApplymentPage({
    Key? key,
    this.visibleDoublePayment = true,
    this.status,
  }) : super(key: key);

  @override
  State<DetailApplymentPage> createState() => _DetailApplymentPageState();
}

class _DetailApplymentPageState extends State<DetailApplymentPage> {
  bool isOpenDebitur = false;
  bool isOpenAngsuran = false;
  bool isOpenPinjaman = false;
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
            title: "Informasi Debitur",
            isExpanded: isOpenDebitur,
            onExpansionChanged: (bool expanding) =>
                setState(() => isOpenDebitur = expanding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _contentInformationDebitur(),
                const SizedBox(height: 20),
                _textColumn("Tanggal Lahir", "19/06/1998"),
                SizedBox(height: 10),
                _textColumn("No Kartu Keluarga", "090128017301300005"),
                SizedBox(height: 10),
                _textColumn("No KTP", "090128017301301803"),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 18),
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 68.w,
                        width: 68.w,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      );
                    },
                  ),
                ),
                _textColumn("Pekerjaan/Usaha", "Lorem ipsum"),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 18),
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 68.w,
                        width: 68.w,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      );
                    },
                  ),
                ),
                _textColumn("Alamat Pekerjaan/Usaha", "Jl. prem ipsum"),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    color: greyColor.withOpacity(0.8),
                  ),
                ),
                Text(
                  "Jaminan",
                  style: blackTextStyle.copyWith(
                      fontSize: 16.sp, fontWeight: bold),
                ),
                const SizedBox(height: 10),
                ...["BPKB", "Sertifikat"].map((e) {
                  int index =
                      ["BPKB", "Sertifikat"].indexWhere((data) => data == e);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jaminan ${index + 1}",
                        style: greyTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: regular),
                      ),
                      Text(
                        "$e",
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: regular),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Deskripsi",
                        style: greyTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: regular),
                      ),
                      Text(
                        "No $e 12345678",
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: regular),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 18),
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 68.w,
                              width: 68.w,
                              margin: const EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
          CustomExpansionTile(
            title: "Informasi Pinjaman",
            isExpanded: isOpenPinjaman,
            onExpansionChanged: (bool expanding) =>
                setState(() => isOpenPinjaman = expanding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: false,
                  child: Row(
                    children: [
                      Text(
                        "Tanggal Dropping",
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
                            children: [
                              const SizedBox(width: 18),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pinjaman Ke",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 12.sp, fontWeight: regular),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "5",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 12.sp, fontWeight: bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Pinjaman",
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
                        margin: const EdgeInsets.only(top: 12, bottom: 14),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                color: Colors.grey.withOpacity(0.2), width: 1),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            () {
                              if (widget.status?.contains("Pengajuan Baru") ??
                                  false) {
                                return "Menunggu Konfirmasi";
                              }
                              if (widget.status?.contains("Disetujui") ??
                                  false) {
                                return "Tanggal Dropping";
                              }
                              if (widget.status?.contains("Diproses") ??
                                  false) {
                                return "Pengajuan Sedang Diproses";
                              }
                              if (widget.status?.contains("Ditolak") ??
                                  false) {}
                              return "-";
                            }(),
                            style: blackTextStyle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: regular,
                            ),
                          ),
                          Text(
                            () {
                              if (widget.status == "Disetujui") {
                                return " - Rabu, 30 Mei 2022";
                              }
                              return "";
                            }(),
                            style: blackTextStyle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: widget.status == "Disetujui",
            child: CustomExpansionTile(
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
          ),
          SizedBox(height: 16),
          Visibility(
            visible: widget.status?.contains("Pengajuan Baru") ?? false,
            child: ButtonPrimary(
              title: "Konfirmasi",
              onTap: () {
                nextScreen(context, FormPersonalDataCustomerPage());
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatus(
        title: "Detail Calon Anggota",
        color: Theme.of(context).scaffoldBackgroundColor,
        status: widget.status ?? "Diproses",
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
