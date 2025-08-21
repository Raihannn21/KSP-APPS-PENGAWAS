import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final Function(bool)? onExpansionChanged;
  final Widget child;
  final String? subtitle;

  const CustomExpansionTile(
      {Key? key,
      required this.title,
      required this.isExpanded,
      required this.onExpansionChanged,
      required this.child,
      this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(isExpanded ? 0.2 : 0.08),
            spreadRadius: 0,
            blurRadius: isExpanded ? 16 : 8,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: marginPage, vertical: 19),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
                boxShadow: [
                  isExpanded
                      ? BoxShadow(
                          color: greyColor.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        )
                      : const BoxShadow(),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: blackTextStyle.copyWith(
                          fontSize: 16.sp, fontWeight: bold),
                    ),
                  ),
                  Visibility(
                    visible: subtitle != null && !isExpanded,
                    child: Padding(
                      padding: EdgeInsets.only(right: 32),
                      child: Text("$subtitle"),
                    ),
                  )
                ],
              ),
            ),
            ExpansionTile(
              title: const SizedBox(),
              onExpansionChanged: onExpansionChanged,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.topLeft,
              children: [
                Container(
                    padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 12,
                        left: marginPage,
                        right: marginPage),
                    child: child),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
