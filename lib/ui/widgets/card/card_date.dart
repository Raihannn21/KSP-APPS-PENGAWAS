import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/badge/item_badge.dart';

class CardDate extends StatelessWidget {
  const CardDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('in_ID');
    String? dateNow =
        DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()).toString();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.only(
        left: 20,
        right: 6,
        top: 6,
        bottom: 6,
      ),
      decoration: BoxDecoration(
          color: green1Color, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateNow,
            style: whiteTextStyle.copyWith(fontSize: 12.sp, fontWeight: bold),
          ),
          ItemBadge(
            title: "Resort 3C",
            color: whiteColor,
            titleStyle:
                blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
    );
  }
}
