import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class CardStatus extends StatelessWidget {
  final String? title;
  final Color? bgColor;
  const CardStatus({Key? key, this.title, this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor ?? lightGreen3Color),
      child: Center(
        child: Text(
          title ?? "Ini Status",
          style: blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
        ),
      ),
    );
  }
}
