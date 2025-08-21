// ignore_for_file: prefer_mixin

import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/domain/commons/screen_utils.dart';
import 'package:need_resume/need_resume.dart';

import 'base_navigator.dart';
import 'nav_key.dart';

class BaseStateWidget<S extends StatefulWidget> extends ResumableState<S>
    with BaseNavigator {
  bool isLoading = true;

  @override
  void initState() {
    // if (Platform.isAndroid) {
    //   secureScreen();
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // ignore: avoid_positional_boolean_parameters
  void setLoading(bool condition) {
    isLoading = condition;
  }

  @override
  void setLoadingPage(bool condition) {
    setLoading(condition);
  }

  @override
  void showError(String? message) {
    checkExpired(message);
  }

  void checkExpired(String? message) {
    // if (httpCode == 400) {
    //   showExpired();
    // } else {
    ScreenUtils.showAlertMessage(context, message);
    // }
  }

  @override
  void showExpired() {
    ScreenUtils.showExpiredMessage(context);
  }

  @override
  void refreshState() {
    setState(() {});
  }

  @override
  void showConnectionError() {
    if (!NavKey.isAlreadyShowingConnectionError) {
      ScreenUtils.showConnectionError(context);
    }
  }
}
