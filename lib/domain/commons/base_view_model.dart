import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ksp_pengawas_monthly/data/remote/dio_client.dart';
import 'package:ksp_pengawas_monthly/data/sharedpreference/user_preferences.dart';

import 'base_navigator.dart';

abstract class BaseViewModel<NV extends BaseNavigator> extends ChangeNotifier {
  NV? view;
  DioClient? dioClient;
  UserPreferences? prefs;

  bool isLoading = false;

  BaseViewModel() {
    dioClient = DioClient(Dio());
    prefs = UserPreferences();
  }

  // ignore: avoid_returning_this
  BaseViewModel setView(NV view) {
    this.view = view;
    return this;
  }

  NV? getView() {
    return view;
  }

  // ignore: avoid_positional_boolean_parameters
  void showLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  void checkExpired(int httpCode) {
    // if (httpCode == 400) {
    //   getView().showExpired();
    // }
  }

  @override
  void dispose();
}
