// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/domain/models/entity/auth/item_profile_model.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/bon/bon_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/history_meal_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/history_transport_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/profile/item_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget infoProfile() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: lightGreen1Color,
            ),
            child: Image.asset(
              "assets/images/im_sample.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  "Johndoe@gmail.com",
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
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

  Widget infoUnit() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.only(top: 18, bottom: 15),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: blackColor.withOpacity(0.15)),
        ),
      ),
      child: Text(
        "Unit Majalengka",
        style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
      ),
    );
  }

  Widget cardBalance(String title, String amount, {required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
            color: green2Color, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: whiteTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                Spacer(),
                Icon(Icons.chevron_right, color: Colors.white, size: 16),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              amount,
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoBalance() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: cardBalance(
                  "Uang Makan",
                  "Rp 10.000",
                  onTap: () {
                    nextScreen(context, HistoryMealPage());
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: cardBalance(
                  "Uang Transfortasi",
                  "Rp 10.000",
                  onTap: () {
                    nextScreen(context, HistoryTransportPage());
                  },
                ),
              ),
            ],
          ),
          Visibility(
            visible: false,
            child: GestureDetector(
              onTap: () => nextScreen(context, const BonPage()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bon Sementara',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: blackColor.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 14,
                      color: green2Color,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dataItemProfile() {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 25),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ItemProfileModel.dataItemProfileModel(context).length,
      itemBuilder: (context, index) {
        return ItemProfile(
          data: ItemProfileModel.dataItemProfileModel(context)[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
        child: Column(
          children: [
            infoProfile(),
            infoUnit(),
            infoBalance(),
            const Divider(thickness: 1),
            dataItemProfile(),
          ],
        ),
      ),
    );
  }
}
