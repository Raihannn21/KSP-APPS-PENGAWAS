import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reset Password",
            style: primaryTextStyle.copyWith(fontSize: 24.sp, fontWeight: bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Masukkan email yang anda agar kami kirimkan \ninstruksi untuk mengubah password",
            style: blackTextStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: regular,
            ),
          )
        ],
      ),
    );
  }

  Widget formEmail() {
    final TextEditingController emailController = TextEditingController();

    return Container(
      margin: EdgeInsets.only(top: 200.h),
      child: Column(
        children: [
          CustomInputText(title: "Email", controller: emailController),
          const SizedBox(height: 80),
          Container(
            margin: const EdgeInsets.all(0),
            width: 160.w,
            child: ButtonPrimary(
              title: "Kirim",
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            formEmail(),
          ],
        ),
      ),
    );
  }
}
