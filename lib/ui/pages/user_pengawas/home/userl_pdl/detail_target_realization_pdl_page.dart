// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/detail_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/userl_pdl/item_detail_customer_pdl.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';

class DetailTargetRealizationPdlPage extends StatefulWidget {
  const DetailTargetRealizationPdlPage({Key? key}) : super(key: key);

  @override
  State<DetailTargetRealizationPdlPage> createState() =>
      _DetailTargetRealizationPdlPageState();
}

class _DetailTargetRealizationPdlPageState
    extends State<DetailTargetRealizationPdlPage> {
  @override
  Widget build(BuildContext context) {
    List<String> statuses = ["Lancar", "Gejala Macet", "Macet"];

    return Scaffold(
      appBar: AppBarPrimary(
        title: "Target Realisasi Hari Ini",
        color: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search, color: green1Color),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: greyColor.withOpacity(0.15),
            child: Row(
              children: [
                Text(
                  "Rabu, 24 Juni 2022",
                  style: blackTextStyle.copyWith(fontSize: 13),
                ),
                Spacer(),
                Text(
                  "Resort C",
                  style: blackTextStyle.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: statuses.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ItemDetailCustomerPdl(
                    status: statuses[index],
                    onTap: () {
                      nextScreen(
                        context,
                        DetailCustomerPage(
                          status: "${statuses[index]} • Umum",
                          visibleDoublePayment: false,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
