// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_interpolations, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/notification/item_notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String filterBy = "Semua";

  @override
  Widget build(BuildContext context) {
    Widget listNotification(String title) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: bold),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const ItemNotification();
            },
          ),
          const SizedBox(height: 30),
        ],
      );
    }

    return Scaffold(
      appBar: AppBarPrimary(
        title: "Notifikasi",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                "Semua",
                "Pengajuan Baru",
                "Pengajuan Disetujui",
                "Pengajuan Ditolak",
                "Pembatalan",
              ].map((e) {
                return itemTabbar(
                  title: e,
                  filterBy: filterBy,
                  onTap: (value) {
                    filterBy = value;

                    setState(() {});
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                  horizontal: marginPage, vertical: 20),
              child: Column(
                children: [
                  listNotification("Hari Ini"),
                  listNotification("Kemarin"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemTabbar({
    required String title,
    required Function(String value) onTap,
    required String filterBy,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        onTap(title);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text("$title"),
        decoration: BoxDecoration(
          color:
              filterBy == title ? green1Color.withOpacity(0.25) : Colors.white,
          border: Border.all(
            color: filterBy == title ? green2Color : greyColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
