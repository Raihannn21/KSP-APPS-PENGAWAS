import 'package:ksp_pengawas_monthly/domain/commons/base_navigator.dart';
import 'package:ksp_pengawas_monthly/domain/commons/base_view_model.dart';

class CustomerViewModel extends BaseViewModel<CustomerNavigator> {
  CustomerViewModel();

  int currentPage = 0;

  void setPage(int page) {
    currentPage = page;
    notifyListeners();
  }
}

abstract class CustomerNavigator extends BaseNavigator {}
