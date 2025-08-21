// ignore: avoid_classes_with_only_static_members
// ignore_for_file: avoid_classes_with_only_static_members, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_outline.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';

class SuccessDialog {
  static Future show(
    BuildContext context, {
    String? title,
    Function()? onTapNegativeBtn,
    Function()? onTapPrimaryBtn,
    String? titleNegativeBtn,
    String? titlePositiveBtn,
    bool? visiblePositiveBtn,
    bool? visibleNegativeBtn,
  }) async {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: SuccessDialogView(
              title: title,
              onTapNegativeBtn: onTapNegativeBtn,
              onTapPrimaryBtn: onTapPrimaryBtn,
              titleNegativeBtn: titleNegativeBtn,
              titlePositiveBtn: titlePositiveBtn,
              visiblePositiveBtn: visiblePositiveBtn,
              visibleNegativeBtn: visibleNegativeBtn,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0.0,
          );
        });
  }
}

class SuccessDialogView extends StatelessWidget {
  final String? title;
  final bool? visiblePositiveBtn, visibleNegativeBtn;
  final String? titlePositiveBtn;
  final String? titleNegativeBtn;
  final Function()? onTapNegativeBtn, onTapPrimaryBtn;

  const SuccessDialogView(
      {Key? key,
      required this.title,
      this.visiblePositiveBtn = true,
      this.visibleNegativeBtn = true,
      this.titlePositiveBtn,
      this.titleNegativeBtn,
      this.onTapNegativeBtn,
      this.onTapPrimaryBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.0725),
          Image.asset(
            'assets/icons/ic_success_dialog.png',
            width: 92,
            height: 92,
          ),
          SizedBox(height: 16),
          Text(title ?? "Title", textAlign: TextAlign.center),
          SizedBox(height: 24),
          Row(
            children: [
              Visibility(
                visible: visibleNegativeBtn ?? true,
                child: Expanded(
                  child: ButtonOutline(
                    title: titleNegativeBtn ?? "Kembali",
                    textStyle: blackTextStyle,
                    onTap: () {
                      backScreen(context);
                      if (onTapNegativeBtn != null) {
                        onTapNegativeBtn!();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(width: visibleNegativeBtn == false ? 0 : 16),
              Visibility(
                visible: visiblePositiveBtn ?? true,
                child: Expanded(
                  child: Container(
                    child: ButtonPrimary(
                      title: titlePositiveBtn ?? "primary",
                      onTap: () {
                        backScreen(context);
                        if (onTapPrimaryBtn != null) {
                          onTapPrimaryBtn!();
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
