import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class AppBarPrimary extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? color;
  final bool backIsDisable;
  final Function()? onBack;
  final double? size;

  const AppBarPrimary(
      {super.key,
      required this.title,
      this.actions,
      this.color,
      this.onBack,
      this.backIsDisable = false,
      this.size});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color ?? primaryColor,
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 0.0,
      // shape: Border(bottom: BorderSide(color: kScaffoldColor, width: 2)),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          margin: const EdgeInsets.only(
              bottom: 15, left: marginPage, right: marginPage),
          child: !backIsDisable
              ? Row(
                  children: [
                    GestureDetector(
                        onTap: onBack ?? () => Navigator.of(context).pop(),
                        child: Icon(Icons.arrow_back,
                            color: color != null ? green2Color : whiteColor,
                            size: 22)),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        title,
                        style: color != null
                            ? blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold)
                            : whiteTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold),
                      ),
                    ),
                    ...(actions ?? []).toList(),
                  ],
                )
              : Center(
                  child: Text(
                    title,
                    style: color != null
                        ? blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: bold)
                        : whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: bold),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? 65);
}
