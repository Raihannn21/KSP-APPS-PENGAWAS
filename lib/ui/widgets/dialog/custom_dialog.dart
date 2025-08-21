import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_outline.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final String negativeText;
  final String positiveText;
  final Function() onTapPositive;
  final Function() onTapNegative;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.negativeText,
    required this.positiveText,
    required this.onTapPositive,
    required this.onTapNegative,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget dialogContent() {
      return IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
            shape: BoxShape.rectangle,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ButtonOutline(
                      title: negativeText,
                      onTap: onTapNegative,
                      color: primaryColor,
                      textStyle: greyTextStyle.copyWith(
                          fontSize: 14.sp, fontWeight: semibold),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ButtonPrimary(
                      title: positiveText,
                      onTap: onTapPositive,
                      textStyle: whiteTextStyle.copyWith(
                          fontSize: 14.sp, fontWeight: semibold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(),
    );
  }
}
