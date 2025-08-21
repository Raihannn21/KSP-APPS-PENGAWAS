// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, omit_local_variable_types, avoid_redundant_argument_values, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/detail_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/search_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_empty.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_background_gradient.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/customer/item_customer.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/modal/modal_date_installment.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/modal/modal_filter_installment.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/storting/item_installment.dart';
import 'package:table_calendar/table_calendar.dart';

enum TypeInstallment { Lancar, GejalaMacet, Macet }

class InstallmentPage extends StatefulWidget {
  const InstallmentPage({Key? key}) : super(key: key);

  @override
  State<InstallmentPage> createState() => _InstallmentPageState();
}

class _InstallmentPageState extends State<InstallmentPage> {
  String? statusSelected, resortSelected, categorySelected;

  DateTime initialDate = DateTime.now();
  Widget _header() {
    return CardBackgroundGradient(
      padding: const EdgeInsets.only(top: 32, bottom: 28),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      widget: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: marginPage),
            child: Row(
              children: [
                Text(
                  "Angsuran",
                  style: whiteTextStyle.copyWith(
                      fontSize: 20.sp, fontWeight: bold),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => nextScreen(context, SearchCustomerPage()),
                  child: Image.asset("assets/icons/ic_search.png", width: 24.w),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () async {
                    final res = await ModalFilterInstallment.show(context);
                    if (res != null) {
                      final data = (res as Map<String, dynamic>);
                      if ("${data["resort"]}".isNotEmpty) {
                        resortSelected = data["resort"];
                      }
                      if ("${data["status"]}".isNotEmpty) {
                        statusSelected = data["status"];
                      }
                      if ("${data["category"]}".isNotEmpty) {
                        categorySelected = data["category"];
                      }
                      setState(() {});
                    }
                  },
                  child: Image.asset("assets/icons/ic_filter.png", width: 24.w),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: marginPage),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.08),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Angsuran Macet",
                  style: blackTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Rp 18.450.000",
                  style: blackTextStyle.copyWith(
                    fontSize: 24.sp,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "57 Anggota",
                  style: blackTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _dataDate({
    required DateTime initDate,
    required Function(DateTime time) onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Text(
                "${DateFormat("MMMM yyyy", "id_ID").format(initDate)}",
                style:
                    blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: bold),
              ),
              SizedBox(width: 10),
              InkWell(
                child: Icon(Icons.keyboard_arrow_down_rounded),
                onTap: () async {
                  final result = await ModalDateInstallment.show(
                    context,
                    initDate,
                  );
                  if (result is DateTime) {
                    initialDate =
                        DateTime(result.year, result.month, initDate.day);
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
        TableCalendar(
          firstDay: DateTime(1945, 1, 1),
          lastDay: DateTime(2099, 12, 31),
          focusedDay: initialDate,
          selectedDayPredicate: (day) => isSameDay(day, initialDate),
          calendarFormat: CalendarFormat.week,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          headerVisible: false,
          daysOfWeekVisible: false,
          currentDay: initialDate,
          calendarStyle: CalendarStyle(),
          rowHeight: 70,
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, day, focusedDay) {
              DateTime modifiedDate = day;
              if (day.weekday == DateTime.saturday ||
                  day.weekday == DateTime.sunday) {
                modifiedDate = DateTime(day.year, day.month, day.day + 2);
              }
              return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: green2Color.withOpacity(0.5),
                  border: Border.all(
                    color: green2Color.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${DateFormat("E", "id_ID").format(modifiedDate)}",
                      style: blackTextStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${modifiedDate.day}",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            outsideBuilder: (context, day, focusedDay) {
              DateTime modifiedDate = day;
              if (day.weekday == DateTime.saturday ||
                  day.weekday == DateTime.sunday) {
                modifiedDate = DateTime(day.year, day.month, day.day + 2);
              }
              return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.25),
                  border: Border.all(
                    color: greyColor.withOpacity(0.25),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${DateFormat("E", "id_ID").format(modifiedDate)}",
                      style: blackTextStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${modifiedDate.day}",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            defaultBuilder: (context, day, focusedDay) {
              DateTime modifiedDate = day;
              if (day.weekday == DateTime.saturday ||
                  day.weekday == DateTime.sunday) {
                modifiedDate = DateTime(day.year, day.month, day.day + 2);
              }

              return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: greyColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${DateFormat("E", "id_ID").format(modifiedDate)}",
                      style: blackTextStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${modifiedDate.day}",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          weekendDays: [DateTime.saturday, DateTime.sunday],
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: (selectedDay, day) {
            DateTime modifiedDate = day;
            if (day.weekday == DateTime.saturday ||
                day.weekday == DateTime.sunday) {
              modifiedDate = DateTime(day.year, day.month, day.day + 2);
            }
            onTap(modifiedDate);
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<TypeInstallment> nasabah = [
      TypeInstallment.Lancar,
      TypeInstallment.GejalaMacet,
      TypeInstallment.Macet,
    ];
    return Scaffold(
      appBar: const AppBarEmpty(
        isGradient: true,
      ),
      body: Column(
        children: [
          _header(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                  horizontal: marginPage, vertical: 20),
              child: Column(
                children: [
                  _dataDate(
                    initDate: initialDate,
                    onTap: (time) {
                      initialDate = time;
                      setState(() {});
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: nasabah.length,
                    itemBuilder: (context, index) {
                      return ItemInstallment(
                        typeInstallment: nasabah[index],
                        status: statusSelected,
                        resortCode: resortSelected,
                        onTap: () {
                          nextScreen(
                            context,
                            DetailCustomerPage(
                              typeCustomer: TypeCustomer.Debitur,
                              visibleDoublePayment: false,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
