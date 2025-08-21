// ignore_for_file: avoid_classes_with_only_static_members, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_await_in_return, unnecessary_string_interpolations, omit_local_variable_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';

class ModalDateInstallment {
  static Future show(BuildContext context, DateTime initDate) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (_) {
        return ModalDateInstallmentView(initDate: initDate);
      },
    );
  }
}

class ModalDateInstallmentView extends StatefulWidget {
  final DateTime initDate;
  const ModalDateInstallmentView({Key? key, required this.initDate})
      : super(key: key);

  @override
  State<ModalDateInstallmentView> createState() =>
      _ModalDateInstallmentViewState();
}

class _ModalDateInstallmentViewState extends State<ModalDateInstallmentView> {
  late DateTime now;
  late int year;
  late int month;
  List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    now = widget.initDate;
    year = now.year;
    month = now.month;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () => backScreen(context),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => setState(() => year--),
                    child:
                        Icon(Icons.chevron_left_outlined, color: green2Color),
                  ),
                  Text(
                    "$year",
                    style: blackTextStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => year++),
                    child:
                        Icon(Icons.chevron_right_outlined, color: green2Color),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                runSpacing: 1,
                children: months.map((e) {
                  final time = DateTime(year, e, now.day);
                  return InkWell(
                    onTap: () {
                      backScreen(context, time);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 6,
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color:
                            month == e ? green2Color.withOpacity(0.25) : null,
                        border: Border.all(
                          color: month == e
                              ? green2Color.withOpacity(0.5)
                              : greyColor.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "${DateFormat("MMM", "id_ID").format(time)}",
                        style: blackTextStyle,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              ButtonPrimary(
                title: "Terapkan",
                onTap: () {
                  backScreen(context);
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
