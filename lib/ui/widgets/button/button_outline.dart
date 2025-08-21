import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class ButtonOutline extends StatelessWidget {
  final String title;
  final Function() onTap;
  final EdgeInsets? margin;
  final Color? color;
  final bool isLoading;
  final TextStyle? textStyle;
  final bool paddingNonActive;
  final Widget? icon;
  final Color? borderColor;

  const ButtonOutline({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
    this.margin,
    this.isLoading = false,
    this.paddingNonActive = false,
    this.icon,
    this.textStyle,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin ?? EdgeInsets.zero,
      child: OutlinedButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 44)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
                color: borderColor ?? primaryColor,
                width: 1.0,
                style: BorderStyle.solid),
          ),
        ),
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Row(
                    children: [
                      icon!,
                      const SizedBox(
                        width: 13,
                      ),
                    ],
                  )
                else
                  const SizedBox(),
                if (isLoading) ...[
                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
                Expanded(
                  child: Text(
                    title,
                    // ignore: prefer_if_null_operators
                    style: textStyle != null
                        ? textStyle
                        : color == null
                            ? whiteTextStyle.copyWith(
                                fontSize: 14.sp, fontWeight: medium)
                            : primaryTextStyle.copyWith(
                                fontSize: 14.sp, fontWeight: medium),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
