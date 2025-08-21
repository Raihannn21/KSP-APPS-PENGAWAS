import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  Widget logoApp() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 30),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: lightBlue1Color,
      ),
      child: const Icon(
        Icons.photo,
        color: blue2Color,
      ),
    );
  }

  Widget version() {
    return Column(
      children: [
        Text(
          "Versi Aplikasi",
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
        const SizedBox(height: 2),
        Text(
          "1.0.0",
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: regular),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Tentang Aplikasi",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
        child: Center(
          child: Column(
            children: [
              logoApp(),
              version(),
              const SizedBox(height: 30),
              Text(
                "Lorem ipsum dolor sit amet, set et du consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
