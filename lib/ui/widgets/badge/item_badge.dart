import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class ItemBadge extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final String? title;
  final TextStyle? titleStyle;
  final BorderRadiusGeometry? borderRadius;
  const ItemBadge(
      {Key? key,
      this.padding,
      this.color,
      this.title,
      this.titleStyle,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color != null ? color! : primaryColor.withOpacity(0.2),
        borderRadius: borderRadius ?? BorderRadius.circular(50),
      ),
      child: Text(
        title ?? '',
        style: titleStyle ??
            primaryTextStyle.copyWith(fontSize: 10, fontWeight: semibold),
      ),
    );
  }
}
