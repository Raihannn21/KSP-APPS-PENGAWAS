// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/base_state_widget.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/applyment_view_model.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/detail_applyment_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/search_credit_application_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/detail_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_background_gradient.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/credit_application/item_credit_application.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/credit_application/item_credit_application_type.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/modal/modal_filter_installment.dart';
import 'package:provider/provider.dart';

class ApplymentPage extends StatefulWidget {
  const ApplymentPage({Key? key}) : super(key: key);

  @override
  State<ApplymentPage> createState() => _ApplymentPageState();
}

class _ApplymentPageState extends BaseStateWidget<ApplymentPage>
    implements ApplymentNavigator {
  late ApplymentViewModel _viewModel;
  String? resortSelected;

  @override
  void initState() {
    super.initState();
    _viewModel = ApplymentViewModel().setView(this) as ApplymentViewModel;
  }

  void navigateToDetail() {
    nextScreen(context, const DetailCustomerPage());
  }

  Widget _creditApplicationType(int stateIndex) {
    return Container(
      margin: const EdgeInsets.only(left: marginPage),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ItemCreditApplicationType(
              isActive: stateIndex == 0,
              title: "Semua (196)",
              onTap: () {
                _viewModel.setPage(0);
              },
            ),
            ItemCreditApplicationType(
              isActive: stateIndex == 1,
              title: "Pengajuan Baru (196)",
              onTap: () {
                _viewModel.setPage(1);
              },
            ),
            ItemCreditApplicationType(
              isActive: stateIndex == 2,
              title: "Diproses (4)",
              onTap: () {
                _viewModel.setPage(2);
              },
            ),
            ItemCreditApplicationType(
              isActive: stateIndex == 3,
              title: "Disetujui (102)",
              onTap: () {
                _viewModel.setPage(3);
              },
            ),
            ItemCreditApplicationType(
              isActive: stateIndex == 4,
              title: "Ditolak (20)",
              onTap: () {
                _viewModel.setPage(4);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _header(int state) {
    return CardBackgroundGradient(
      padding: const EdgeInsets.only(top: 63, bottom: 28),
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
                  "Pengajuan",
                  style: whiteTextStyle.copyWith(
                      fontSize: 20.sp, fontWeight: bold),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      nextScreen(context, const SearchCreditApplicationPage()),
                  child: Image.asset("assets/icons/ic_search.png", width: 24.w),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () async {
                    final res = await ModalFilterInstallment.show(
                      context,
                      visibleStatusInstallment: false,
                    );
                    if (res != null && (res['resort'] as String).isNotEmpty) {
                      resortSelected = res['resort'];
                      setState(() {});
                    }
                  },
                  child: Image.asset("assets/icons/ic_filter.png", width: 24.w),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _creditApplicationType(state),
        ],
      ),
    );
  }

  Widget _listCreditApplication() {
    List<String> statuses = [
      "Pengajuan Baru",
      "Disetujui",
      "Diproses",
      "Ditolak"
    ];
    return Column(
      children: [
        Center(child: SizedBox(height: resortSelected != null ? 20 : 0)),
        Visibility(
          visible: resortSelected != null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: marginPage),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Resort $resortSelected",
                  style: blackTextStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: bold,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "a-z",
                    style: blackTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: regular,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          itemCount: statuses.length,
          shrinkWrap: true,
          padding:
              const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemCreditApplication(
              status: statuses[index],
              resortCode: resortSelected,
              onTap: () {
                nextScreen(
                  context,
                  DetailApplymentPage(
                    status: "${statuses[index]} • Umum",
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplymentViewModel?>(
      create: (context) => _viewModel,
      child: Consumer<ApplymentViewModel>(
        builder: (context, viewModel, _) => Scaffold(
          // appBar: const AppBarEmpty(
          //   isGradient: true,
          // ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(_viewModel.currentPage),
              Expanded(
                child: SingleChildScrollView(
                  child: _listCreditApplication(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
