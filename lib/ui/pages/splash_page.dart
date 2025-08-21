import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/data/sharedpreference/user_preferences.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/auth/sign_in_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/main_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  UserPreferences pref = UserPreferences();

  @override
  void initState() {
    _afterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Image(
          width: 240,
          image: AssetImage('assets/images/im_logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Future _afterSplash() async {
    final userId = await pref.getUserId();
    await Future.delayed(const Duration(milliseconds: 500)).then((value) async {
      _goingToHome();
      // if (userId != 0) {
      //   _goingToHome();
      // } else {
      //   _goingToLogin();
      // }
    });
  }

  void _goingToHome() {
    nextScreenRemoveUntil(context, const MainPage());
  }

  void _goingToLogin() {
    nextScreenRemoveUntil(context, const SignInPage());
  }
}
