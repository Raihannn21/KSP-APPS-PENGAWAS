// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/domain/commons/sliver_grid_rasio_custom.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/detail_member_candidate.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/models/nominal_model.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_status.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/dialog/success_dialog.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_outline.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class FormLoanCustomerPage extends StatefulWidget {
  const FormLoanCustomerPage({Key? key}) : super(key: key);

  @override
  State<FormLoanCustomerPage> createState() => _FormLoanCustomerPageState();
}

class _FormLoanCustomerPageState extends State<FormLoanCustomerPage> {
  final TextEditingController _loanNumberController =
      TextEditingController(text: "1");
  final TextEditingController _nominalOtherController = TextEditingController();

  ValueLoanNominal? _loanNominal;

  Widget _itemLoanNominal(String nominal, ValueLoanNominal? valueNominal) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: _loanNominal == valueNominal
              ? primaryColor
              : greyColor.withOpacity(0.3),
        ),
        color: _loanNominal == valueNominal
            ? lightGreen1Color
            : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: RadioListTile<ValueLoanNominal>(
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          title: Text(
            nominal,
            style:
                blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
          ),
          value: valueNominal!,
          groupValue: _loanNominal,
          onChanged: (ValueLoanNominal? value) {
            setState(() {
              _loanNominal = value;
            });
          },
        ),
      ),
    );
  }

  Widget _formData() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: marginPage),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
              "Informasi Pinjaman Calon Anggota",
              style: blackTextStyle.copyWith(
                  fontSize: 16.sp, fontWeight: bold, height: 2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: CustomInputOutline(
              title: "Pinjaman Ke",
              isReadOnly: true,
              controller: _loanNumberController,
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Nominal Pinjaman",
                    style: greyTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: regular),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: NominalModel.dataNominal().length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.w,
                    height: 60,
                  ),
                  itemBuilder: (_, index) {
                    return _itemLoanNominal(
                      NominalModel.dataNominal()[index].nominal!,
                      NominalModel.dataNominal()[index].value!,
                    );
                  },
                ),
              ],
            ),
          ),
          if (_loanNominal == ValueLoanNominal.value4)
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: CustomInputText(
                title: "Minimal Rp 500.000",
                controller: _nominalOtherController,
                isCurrency: true,
                inputType: TextInputType.number,
              ),
            )
          else
            const SizedBox()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatus(
        title: "Anggota Lama",
        color: Theme.of(context).scaffoldBackgroundColor,
        status: "Pengajuan Baru • Umum",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _formData(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: marginPage,
          right: marginPage,
          top: 10,
          bottom: 30,
        ),
        child: ButtonPrimary(
          title: "Kirim Pengajuan",
          color: primaryColor.withOpacity(0.5),
          textStyle: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
          onTap: () {
            SuccessDialog.show(
              context,
              title: "Pengajuan Pinjaman Baru\nBerhasil",
              titlePositiveBtn: "Lihat pengajuan",
              onTapPrimaryBtn: () {
                backScreenUntil(context);
                nextScreen(context, DetailMemberCandidate());
              },
            );
          },
        ),
      ),
    );
  }
}
