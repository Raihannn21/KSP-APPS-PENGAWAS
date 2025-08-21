import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/base_state_widget.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/applyment_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/customer/customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/home/home_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/installment/installment_page.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/main_view_model.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/profile/profile_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BaseStateWidget<MainPage>
    implements MainNavigator {
  late MainViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = MainViewModel().setView(this) as MainViewModel;
  }

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const CustomerPage();
        case 2:
          return const ApplymentPage();
        case 3:
          return const InstallmentPage();
        default:
          return const ProfilePage();
      }
    }

    Widget bottomNav(int currentPage) {
      return BottomAppBar(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            _viewModel.setPage(value);
          },
          unselectedLabelStyle:
              blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
          selectedLabelStyle:
              primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
          selectedItemColor: primaryColor,
          currentIndex: currentPage,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/icons/ic_home.png',
                  width: 24,
                  height: 24,
                  color: currentPage == 0 ? primaryColor : greyColor,
                ),
              ),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/icons/ic_nasabah.png',
                  width: 24,
                  height: 24,
                  color: currentPage == 1 ? primaryColor : greyColor,
                ),
              ),
              label: "Anggota",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/icons/ic_pengajuan.png',
                  width: 24,
                  height: 24,
                  color: currentPage == 2 ? primaryColor : greyColor,
                ),
              ),
              label: "Pengajuan",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/icons/ic_angsuran.png',
                  width: 24,
                  height: 24,
                  color: currentPage == 3 ? primaryColor : greyColor,
                ),
              ),
              label: "Angsuran",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/icons/ic_profile.png',
                  width: 24,
                  height: 24,
                  color: currentPage == 4 ? primaryColor : greyColor,
                ),
              ),
              label: "Profil",
            ),
          ],
        ),
      );
    }

    return ChangeNotifierProvider<MainViewModel?>(
      create: (context) => _viewModel,
      child: Consumer<MainViewModel>(
        builder: (context, viewModel, _) => Scaffold(
          body: buildContent(_viewModel.currentPage),
          bottomNavigationBar: bottomNav(_viewModel.currentPage),
        ),
      ),
    );
  }
}
