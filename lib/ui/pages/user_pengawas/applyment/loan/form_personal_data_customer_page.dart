// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/loan/form_profession_data_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_status.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/modal/modal_image_picker.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class FormPersonalDataCustomerPage extends StatefulWidget {
  const FormPersonalDataCustomerPage({Key? key}) : super(key: key);

  @override
  State<FormPersonalDataCustomerPage> createState() =>
      _FormPersonalDataCustomerPageState();
}

class _FormPersonalDataCustomerPageState
    extends State<FormPersonalDataCustomerPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ktpController = TextEditingController();
  final TextEditingController _noKkController = TextEditingController();

  Widget _photoCustomer() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Foto Anggota',
            style: greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              ModalImagePicker.show(context);
            },
            child: Stack(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _photoKtp() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Foto KTP/SIM calon nasabah",
            style: greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              ModalImagePicker.show(context);
            },
            child: Stack(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _photoCustWithKtp() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Foto KTP/SIM calon nasabah",
            style: greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              ModalImagePicker.show(context);
            },
            child: Stack(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _formData() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: marginPage),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Anggota",
            style: blackTextStyle.copyWith(
                fontSize: 16.sp, fontWeight: bold, height: 2),
          ),
          Text(
            "Silahkan periksa kembali data anggota dibawah ini",
            style: blackTextStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: regular,
            ),
          ),
          const SizedBox(height: 30),
          CustomInputText(
            title: "Nama lengkap",
            hintText: "Nama",
            controller: _nameController,
          ),
          const SizedBox(height: 18),
          CustomInputText(
            title: "Tanggal Lahir",
            hintText: "01/01/1995",
            controller: _dobController,
            isReadOnly: true,
          ),
          const SizedBox(height: 18),
          CustomInputText(
            title: "Alamat rumah",
            hintText: "Alamat rumah",
            controller: _addressController,
          ),
          const SizedBox(height: 18),
          CustomInputText(
            title: "No HP",
            hintText: "No Hp",
            controller: _phoneController,
            inputType: TextInputType.number,
          ),
          Row(
            children: [
              Checkbox(
                value: false,
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onChanged: (val) {},
              ),
              Text(
                "Nomor terhubung dengan whatsapp",
                style: blackTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          const SizedBox(height: 18),
          CustomInputText(
            title: "No Kartu Keluarga",
            hintText: "No Kartu Keluarga",
            controller: _noKkController,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 18),
          CustomInputText(
            title: "No KTP",
            hintText: "No KTP",
            controller: _ktpController,
            inputType: TextInputType.number,
          ),
          _photoCustomer(),
          _photoKtp(),
          _photoCustWithKtp(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = "John Doe";
    _dobController.text = "01/01/1995";
    _addressController.text = "Jl. Lorem ipsum dolor sit amet";
    _phoneController.text = "0812345566789";
    _noKkController.text = "12345678901234567";
    _ktpController.text = "12345678901234567";
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
          title: "Selanjutnya",
          color: primaryColor.withOpacity(0.5),
          textStyle: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
          onTap: () {
            nextScreen(context, const FormProfessionDataCustomerPage());
          },
        ),
      ),
    );
  }
}
