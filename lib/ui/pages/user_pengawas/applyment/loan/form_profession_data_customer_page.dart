import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/loan/form_binding_letter_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_status.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/modal/modal_image_picker.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class FormProfessionDataCustomerPage extends StatefulWidget {
  const FormProfessionDataCustomerPage({Key? key}) : super(key: key);

  @override
  State<FormProfessionDataCustomerPage> createState() =>
      _FormProfessionDataCustomerPageState();
}

class _FormProfessionDataCustomerPageState
    extends State<FormProfessionDataCustomerPage> {
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Widget dataPhoto() {
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
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: CustomInputText(
              title: "Pekerjaan/Usaha",
              hintText: "Pekerjaan/Usaha",
              controller: _professionController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "Foto pekerjaan/usaha",
              style:
                  greyTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      ModalImagePicker.show(context);
                    },
                    child: dataPhoto(),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      ModalImagePicker.show(context);
                    },
                    child: dataPhoto(),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      ModalImagePicker.show(context);
                    },
                    child: dataPhoto(),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      ModalImagePicker.show(context);
                    },
                    child: dataPhoto(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: CustomInputText(
              title: "Alamat pekerjaan/Usaha",
              hintText: "Alamat pekerjaan/Usaha",
              controller: _addressController,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _professionController.text = "Lorem Ipsum Dolor";
    _addressController.text = "Jl. Lorem ipsum dolor";
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
            nextScreen(context, const FormBindingLetterCustomerPage());
          },
        ),
      ),
    );
  }
}
