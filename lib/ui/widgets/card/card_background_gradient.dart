import 'package:flutter/material.dart';

class CardBackgroundGradient extends StatelessWidget {
  final Widget? widget;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  const CardBackgroundGradient(
      {Key? key,
      required this.widget,
      required this.padding,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF58E4BA), // #58E4BA
            Color(0xFF38B58F), // #38B58F
          ],
          stops: [0.0366, 0.9334],
        ),
        borderRadius: borderRadius ??
            const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
      ),
      child: widget,
    );
  }
}
