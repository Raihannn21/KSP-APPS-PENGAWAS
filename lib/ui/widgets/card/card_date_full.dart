import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class CardDateFull extends StatelessWidget {
  const CardDateFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('in_ID');
    String? dateNow =
        DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()).toString();

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: marginPage,
        vertical: 10,
      ),
      decoration: BoxDecoration(color: greyColor.withOpacity(0.1)),
      child: Row(
        children: [
          Text(
            dateNow,
            style:
                blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
          ),
          const Spacer(),
          Text(
            "Resort",
            style:
                blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
          ),
          const SizedBox(width: 6),
          Text(
            "3C",
            style: blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: bold),
          ),
        ],
      ),
    );
  }
}
