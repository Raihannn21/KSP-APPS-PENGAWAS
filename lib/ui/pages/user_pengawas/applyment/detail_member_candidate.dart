// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_status.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_initial.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/expansion/custom_expansion_tile.dart';

class DetailMemberCandidate extends StatefulWidget {
  const DetailMemberCandidate({Key? key}) : super(key: key);

  @override
  State<DetailMemberCandidate> createState() => _DetailMemberCandidateState();
}

class _DetailMemberCandidateState extends State<DetailMemberCandidate> {
  bool isOpenDebitur = false;
  bool isOpenPinjaman = false;

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
                Text(
                  "Jaminan 1",
                  style: greyTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: regular),
                ),
                Text(
                  "BPKB",
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
                  "No BPKB 12345678",
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
                Text(
                  "Jaminan 2",
                  style: greyTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: regular),
                ),
                Text(
                  "Sertifikat",
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
                  "No Sertifikat 12345678",
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
                        "Total Tagihan",
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
                      Text(
                        "Pengajuan Sedang Diproses",
                        style: blackTextStyle.copyWith(fontSize: 16.sp),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                )
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
      appBar: AppBarStatus(
        title: "Detail Calon Anggota",
        color: Theme.of(context).scaffoldBackgroundColor,
        status: "Diproses • Umum",
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
