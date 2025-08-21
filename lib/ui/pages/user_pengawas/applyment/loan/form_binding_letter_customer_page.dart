// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/loan/form_loan_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_status.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_outline.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/modal/modal_image_picker.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class FormBindingLetterCustomerPage extends StatefulWidget {
  const FormBindingLetterCustomerPage({Key? key}) : super(key: key);

  @override
  State<FormBindingLetterCustomerPage> createState() =>
      _FormBindingLetterCustomerPageState();
}

class _FormBindingLetterCustomerPageState
    extends State<FormBindingLetterCustomerPage> {
  final TextEditingController _bindingLetterController =
      TextEditingController();
  final TextEditingController _bindingValueLetterController =
      TextEditingController();
  List<Widget> listForm = [];

  Widget dataPhoto([bool isEmpty = true]) {
    if (!isEmpty) {
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
          ),
          Positioned(
            bottom: 4,
            child: Container(
              width: 35,
              height: 35,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: green1Color,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.edit),
              ),
            ),
          )
        ],
      );
    }
    return DottedBorder(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Icon(
          Icons.add,
          size: 24.w,
          color: primaryColor,
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
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "Jaminan",
              style: blackTextStyle.copyWith(
                  fontSize: 16.sp, fontWeight: bold, height: 2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: CustomInputText(
              title: "Jaminan 1",
              hintText: "cth: Buku Nikah",
              controller: _bindingLetterController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: CustomInputText(
              title: "Deskripsi",
              hintText: "cth: Buku Nikah",
              maxLines: 3,
              controller: _bindingValueLetterController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "Foto jaminan",
              style:
                  greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    ModalImagePicker.show(context);
                  },
                  child: dataPhoto(false),
                ),
                const SizedBox(width: 13),
                InkWell(
                  onTap: () {
                    ModalImagePicker.show(context);
                  },
                  child: dataPhoto(false),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12, bottom: 30),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bindingLetterController.text = "BPKB";
    _bindingValueLetterController.text = "No. BPKB 123124345";
    listForm = [_formData()];
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listForm.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    listForm[index],
                    Visibility(
                      visible: index > 0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            listForm.removeAt(index);
                            setState(() {});
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.0),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: green1Color,
                              child: Icon(Icons.clear,
                                  size: 15, color: whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ButtonOutline(
                title: "Tambah",
                onTap: () {
                  listForm.add(_formData());
                  setState(() {});
                },
                textStyle: greyTextStyle.copyWith(
                    fontSize: 14.sp, fontWeight: regular),
              ),
            )
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
          title: "Selanjutnya",
          color: primaryColor.withOpacity(0.5),
          textStyle: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
          onTap: () {
            nextScreen(context, const FormLoanCustomerPage());
          },
        ),
      ),
    );
  }
}
