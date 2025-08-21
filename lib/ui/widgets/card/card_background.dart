import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';

class CardBackground extends StatelessWidget {
  final Widget? widget;
  final EdgeInsetsGeometry? padding;
  const CardBackground({Key? key, required this.widget, required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: const BoxDecoration(
        color: lightGreen1Color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: widget,
    );
  }
}
