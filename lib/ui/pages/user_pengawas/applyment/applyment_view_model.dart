import 'package:ksp_pengawas_monthly/domain/commons/base_navigator.dart';
import 'package:ksp_pengawas_monthly/domain/commons/base_view_model.dart';

class ApplymentViewModel extends BaseViewModel<ApplymentNavigator> {
  ApplymentViewModel();

  int currentPage = 0;

  void setPage(int page) {
    currentPage = page;
    notifyListeners();
  }
}

abstract class ApplymentNavigator extends BaseNavigator {}
