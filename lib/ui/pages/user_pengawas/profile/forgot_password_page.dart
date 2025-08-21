import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_password.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordConstroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Ganti Kata Sandi",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
        child: Column(
          children: [
            CustomInputPassword(
              title: "Ketik password lama",
              controller: _currentPasswordController,
              hintText: "Ketik disini..",
              passwordMode: true,
            ),
            const SizedBox(height: 18),
            CustomInputPassword(
              title: "Ketik password baru",
              controller: _newPasswordController,
              hintText: "Ketik disini..",
              passwordMode: true,
            ),
            const SizedBox(height: 18),
            CustomInputPassword(
              title: "Ketik Ulang Password baru",
              controller: _confirmPasswordConstroller,
              hintText: "Ketik disini..",
              passwordMode: true,
            ),
            const Spacer(),
            ButtonPrimary(
              title: "Simpan",
              onTap: () {
                backScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
