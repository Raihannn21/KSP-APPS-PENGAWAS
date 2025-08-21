import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/main_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_password.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget logo() {
    return Container(
      width: 150.w,
      height: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: lightGreen1Color,
      ),
      child: Icon(
        Icons.photo,
        color: green1Color,
      ),
    );
  }

  Widget formLogin() {
    return Container(
      margin:
          const EdgeInsets.only(top: 100, left: marginPage, right: marginPage),
      child: Column(
        children: [
          CustomInputText(
            title: "Email",
            hintText: "Email",
            controller: _emailController,
          ),
          const SizedBox(height: 24),
          CustomInputPassword(
            title: "Password",
            hintText: "Password",
            controller: _passwordController,
            passwordMode: true,
          ),
          const SizedBox(height: 80),
          Container(
            margin: const EdgeInsets.all(0),
            width: 160.w,
            child: ButtonPrimary(
              title: "Login",
              onTap: () {
                nextScreenReplace(context, const MainPage());
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(),
                formLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
