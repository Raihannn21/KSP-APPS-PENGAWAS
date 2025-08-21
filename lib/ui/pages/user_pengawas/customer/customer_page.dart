// ignore_for_file: unused_local_variable, omit_local_variable_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/base_state_widget.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/customer_view_model.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/detail_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/search_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_background_gradient.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/customer/item_customer.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/customer/item_customer_horizontal.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/customer/item_customer_type.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/modal/modal_filter_installment.dart';
import 'package:provider/provider.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends BaseStateWidget<CustomerPage>
    implements CustomerNavigator {
  late CustomerViewModel _viewModel;
  String? resortSelected;
  @override
  void initState() {
    super.initState();
    _viewModel = CustomerViewModel().setView(this) as CustomerViewModel;
  }

  void _navigateToDetail(TypeCustomer typeCustomer) {
    nextScreen(
      context,
      DetailCustomerPage(
        typeCustomer: typeCustomer,
        visibleDoublePayment: false,
      ),
    );
  }

  Widget _creditApplicationType(int stateIndex) {
    return Container(
      margin: const EdgeInsets.only(left: marginPage),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ItemCustomerType(
              isActive: stateIndex == 0,
              title: "Semua (196)",
              onTap: () {
                _viewModel.setPage(0);
              },
            ),
            ItemCustomerType(
              isActive: stateIndex == 1,
              title: "Debitur (4)",
              onTap: () {
                _viewModel.setPage(1);
              },
            ),
            ItemCustomerType(
              isActive: stateIndex == 2,
              title: "Aktif (102)",
              onTap: () {
                _viewModel.setPage(2);
              },
            ),
            ItemCustomerType(
              isActive: stateIndex == 3,
              title: "Tidak Aktif (20)",
              onTap: () {
                _viewModel.setPage(3);
              },
            ),
            ItemCustomerType(
              isActive: stateIndex == 4,
              title: "Ditolak (20)",
              onTap: () {
                _viewModel.setPage(4);
              },
            ),
            ItemCustomerType(
              isActive: stateIndex == 5,
              title: "Diblokir (20)",
              onTap: () {
                _viewModel.setPage(5);
              },
            ),
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
                  "Anggota",
                  style: whiteTextStyle.copyWith(
                      fontSize: 20.sp, fontWeight: bold),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, const SearchCustomerPage());
                  },
                  child: Image.asset("assets/icons/ic_search.png", width: 24.w),
                ),
                const SizedBox(width: 12),
                GestureDetector(
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
                    child:
                        Image.asset("assets/icons/ic_filter.png", width: 24.w))
              ],
            ),
          ),
          const SizedBox(height: 30),
          _creditApplicationType(state),
        ],
      ),
    );
  }

  Widget _listCustomerHorizontal() {
    final List<TypeCustomer> nasabah = [
      TypeCustomer.Debitur,
      TypeCustomer.Aktif,
      TypeCustomer.TidakAktif,
      TypeCustomer.Ditolak,
      TypeCustomer.Diblokir
    ];
    return Container(
      margin: const EdgeInsets.only(left: marginPage, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Anggota Baru Bulan Ini",
            style: blackTextStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(0),
            height: 170,
            child: ListView.builder(
              itemCount: nasabah.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ItemCustomerHorizontal(onTap: () {
                  _navigateToDetail(nasabah[index]);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _listCustomerVertical() {
    final List<TypeCustomer> nasabah = [
      TypeCustomer.Debitur,
      TypeCustomer.Aktif,
      TypeCustomer.TidakAktif,
      TypeCustomer.Ditolak,
      TypeCustomer.Diblokir
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                resortSelected != null
                    ? "Resort $resortSelected"
                    : "Semua Anggota",
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
          const SizedBox(height: 10),
          ListView.builder(
            itemCount: nasabah.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ItemCustomer(
                type: nasabah[index],
                resortCode: resortSelected,
                onTap: () {
                  _navigateToDetail(nasabah[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomerViewModel?>(
      create: (context) => _viewModel,
      child: Consumer<CustomerViewModel>(
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
                  child: Column(
                    children: [
                      Visibility(
                        visible: resortSelected == null,
                        child: _listCustomerHorizontal(),
                      ),
                      _listCustomerVertical(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
