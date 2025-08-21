import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/auth/sign_in_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/about_app_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/edit_profile_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/forgot_password_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/privacy_policy_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/support_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/tac_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/dialog/custom_dialog.dart';

class ItemProfileModel {
  String title;
  String icon;
  Function()? onTap;

  ItemProfileModel(
      {required this.title, required this.icon, required this.onTap});

  static List<ItemProfileModel> dataItemProfileModel(BuildContext context) => [
        ItemProfileModel(
          title: "Edit Profile",
          icon: "assets/icons/ic_profile_full.png",
          onTap: () {
            nextScreen(context, const EditProfilePage());
          },
        ),
        ItemProfileModel(
          title: "Ganti Kata Sandi",
          icon: "assets/icons/ic_password.png",
          onTap: () {
            nextScreen(context, const ForgotPasswordPage());
          },
        ),
        ItemProfileModel(
          title: "Bantuan Support",
          icon: "assets/icons/ic_customer_service.png",
          onTap: () {
            nextScreen(context, const SupportPage());
          },
        ),
        ItemProfileModel(
          title: "Syarat & Ketentuan",
          icon: "assets/icons/ic_document.png",
          onTap: () {
            nextScreen(context, const TacPage());
          },
        ),
        ItemProfileModel(
          title: "Kebijakan Privasi",
          icon: "assets/icons/ic_security.png",
          onTap: () {
            nextScreen(context, const PrivacyPolicyPage());
          },
        ),
        ItemProfileModel(
          title: "Tentang Aplikasi",
          icon: "assets/icons/ic_info.png",
          onTap: () {
            nextScreen(context, const AboutAppPage());
          },
        ),
        ItemProfileModel(
          title: "Logout",
          icon: "assets/icons/ic_logout.png",
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => CustomDialog(
                title: "Logout",
                description: "Apakah anda ingin keluar dari aplikasi ini?",
                negativeText: "Tidak",
                positiveText: "Ya",
                onTapPositive: () {
                  nextScreenRemoveUntil(context, SignInPage());
                },
                onTapNegative: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      ];
}
