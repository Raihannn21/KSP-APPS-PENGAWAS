import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/base_state_widget.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/bon/bon_application_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/bon/bon_view_model.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/badge/item_badge.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/bon/item_bon.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/bon/item_bon_type.dart';
import 'package:provider/provider.dart';

class BonPage extends StatefulWidget {
  const BonPage({Key? key}) : super(key: key);

  @override
  State<BonPage> createState() => _BonPageState();
}

class _BonPageState extends BaseStateWidget<BonPage> implements BonNavigator {
  late BonViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BonViewModel().setView(this) as BonViewModel;
  }

  void detailBonBottomSheet() {
    Widget itemData(String title, String data, bool dataIsBold) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              data,
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: dataIsBold == true ? bold : regular),
            ),
          ),
        ],
      );
    }

    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      backgroundColor: whiteColor,
      builder: (context) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -60,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(11),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: whiteColor),
                  child: const Icon(
                    Icons.close,
                    color: darkBlue1Color,
                    size: 24,
                  ),
                ),
              ),
            ),
            IntrinsicHeight(
              child: Container(
                margin: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "12/04/2022 - 10:34",
                          style: blackTextStyle.copyWith(
                              fontSize: 12, fontWeight: regular),
                        ),
                        ItemBadge(
                          title: "Ditolak",
                          color: lightGreen1Color,
                          titleStyle: blackTextStyle.copyWith(
                              fontSize: 10, fontWeight: regular),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    itemData("Nominal", "Rp 1.000.000", true),
                    const SizedBox(height: 18),
                    itemData(
                      "Note",
                      "Lorem ipsum dolor sit amet, set et du consectetur adipiscing elit lorem ipsum dolor sit amet",
                      false,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _bonType(int currentPage) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: marginPage),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ItemBonType(
              isActive: currentPage == 0,
              title: "Semua",
              onTap: () {
                _viewModel.setPage(0);
              },
            ),
            ItemBonType(
              isActive: currentPage == 1,
              title: "Menunggu Konfirmasi",
              onTap: () {
                _viewModel.setPage(1);
              },
            ),
            ItemBonType(
              isActive: currentPage == 2,
              title: "Disetujui",
              onTap: () {
                _viewModel.setPage(2);
              },
            ),
            ItemBonType(
              isActive: currentPage == 3,
              title: "Ditolak",
              onTap: () {
                _viewModel.setPage(3);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _listBon() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ItemBon(
            onTap: detailBonBottomSheet,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BonViewModel?>(
      create: (context) => _viewModel,
      child: Consumer<BonViewModel>(
        builder: (context, viewModel, _) => Scaffold(
          appBar: AppBarPrimary(
            title: "Bon Sementara",
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _bonType(_viewModel.currentPage),
                _listBon(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              nextScreen(context, const BonApplicationPage());
            },
            backgroundColor: whiteColor,
            child: const Icon(
              Icons.add,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
