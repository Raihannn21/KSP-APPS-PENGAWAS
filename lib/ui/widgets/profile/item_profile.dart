import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/models/entity/auth/item_profile_model.dart';

class ItemProfile extends StatelessWidget {
  final ItemProfileModel data;
  const ItemProfile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: data.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        child: Row(
          children: [
            Image.asset(
              data.icon,
              width: 16.w,
              height: 16.w,
              color: greyColor.withOpacity(0.3),
            ),
            const SizedBox(width: 16),
            Text(
              data.title,
              style:
                  blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: regular),
            )
          ],
        ),
      ),
    );
  }
}
