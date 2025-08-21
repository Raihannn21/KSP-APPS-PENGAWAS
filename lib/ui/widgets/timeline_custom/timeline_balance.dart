import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
// ignore: depend_on_referenced_packages
import 'package:timeline_tile/timeline_tile.dart';

class TimelineBalance extends StatelessWidget {
  final Widget? icon;
  final bool? isFirst;
  final bool? isLast;
  final Color? color;
  final String? date;
  final String? description;
  final String? balance;
  final String? title;

  const TimelineBalance({
    Key? key,
    this.icon,
    this.isFirst,
    this.isLast,
    this.color,
    this.title,
    this.date,
    this.description,
    this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst ?? false,
      isLast: isLast ?? false,
      // beforeLineStyle: LineStyle(color: ColorResources.red),
      // beforeLineStyle: LineStyle(color: color2),
      afterLineStyle: LineStyle(color: Colors.grey.shade400, thickness: 1),

      endChild: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              transform: Matrix4.translationValues(0.0, -2.0, 0.0),
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date ?? "",
                      style: blackTextStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description ?? "",
                      style: blackTextStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: regular,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: greyColor.withOpacity(0.5), width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Saldo Hari Ini",
                            style: blackTextStyle.copyWith(
                              fontSize: 14.sp,
                              fontWeight: regular,
                            ),
                          ),
                          Text(
                            balance ?? "",
                            style: blackTextStyle.copyWith(
                              fontSize: 14.sp,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      indicatorStyle: IndicatorStyle(
        width: 10,
        height: 10,
        indicatorXY: 0.0,
        indicator: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: green1Color),
        ),
      ),
    );
  }
}
