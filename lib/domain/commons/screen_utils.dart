import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/images.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_key.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: avoid_classes_with_only_static_members
class ScreenUtils {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static void showDialog(
      BuildContext context, AlertType alertType, String title, String message,
      {Function()? doSomething}) {
    Alert(
      context: context,
      style: const AlertStyle(
          titleStyle: TextStyle(fontSize: 16),
          descStyle: TextStyle(fontSize: 14)),
      type: alertType,
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          width: 120,
          color: primaryColor,
          onPressed: () => {
            if (doSomething != null) {doSomething.call()},
            Navigator.pop(context)
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ],
    ).show();
  }

  static void showAlertMessage(BuildContext context, String? message) {
    Alert(
      context: context,
      style: const AlertStyle(titleStyle: TextStyle(fontSize: 14)),
      type: AlertType.error,
      title: "something_wrong",
      desc: message,
      buttons: [
        DialogButton(
          color: primaryColor,
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ],
    ).show();
  }

  static void showLogout(BuildContext context, Function() doLogout) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "logout",
      desc: "logout_message",
      buttons: [
        DialogButton(
          color: primaryColor,
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: Text(
            "cancel",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          color: Colors.red,
          onPressed: () {
            doLogout.call();
          },
          width: 120,
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  static void showExpiredMessage(BuildContext context) {
    // Alert(
    //   context: context,
    //   type: AlertType.error,
    //   title: "login_expired",
    //   desc: "login_again",
    //   buttons: [
    //     DialogButton(
    //       color: primaryColor,
    //       onPressed: () => AuthUsecase.empty().doLogout().then((value) =>
    //           Navigator.pushAndRemoveUntil(
    //               context,
    //               MaterialPageRoute(builder: (context) => SignInPage()),
    //               (r) => false)),
    //       width: 120,
    //       child: const Text(
    //         "OK",
    //         style: TextStyle(color: Colors.white, fontSize: 20),
    //       ),
    //     )
    //   ],
    // ).show();
  }

  static void showAlertClearCartShopRoutine(
      BuildContext context, Function(bool isClear) callback) {
    Alert(
        context: context,
        type: AlertType.info,
        title: "",
        desc: "info_clear_cart",
        buttons: [
          DialogButton(
            color: primaryColor,
            onPressed: () => {
              Navigator.pop(context),
            },
            width: 120,
            child: Text(
              "cancel",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            color: primaryColor,
            onPressed: () {
              callback(false);
              Navigator.pop(context);
            },
            width: 120,
            child: const Text(
              "no",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            color: primaryColor,
            onPressed: () {
              callback(true);
              Navigator.pop(context);
            },
            width: 120,
            child: const Text(
              "yes",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  static void showOptionImagePicker(
      BuildContext context, Function(bool isGallery) openImagePicker) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, modalState) {
            return Container(
              color: lightGreyColor,
              height: ScreenUtils.getScreenHeight(context) / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "choose_image",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0.5,
                  ),
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => openImagePicker(true),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: const <Widget>[
                            Icon(Icons.camera_alt),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Text(
                                "camera",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0.5,
                  ),
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => openImagePicker(false),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: const <Widget>[
                            Icon(Icons.image),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Text(
                                "gallery",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: greyColor,
                    height: 0.5,
                  ),
                ],
              ),
            );
          });
        });
  }

  static void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16);
  }

  static void expiredToken() {
    if (!NavKey.isInLogin) {
      showToastMessage("expired_token");
      // AuthUsecase.empty().doLogout().then((value) {
      //   NavKey.isInLogin = true;
      //   NavKey.navKey.currentState!.pushNamed('/login');
      // });
    }
  }

  static void copyToClipBoard(String? text) {
    Clipboard.setData(ClipboardData(text: text ?? ""));
    showToastMessage("Copy to clipboard");
  }

  static void showConfirmDialog(BuildContext context, AlertType alertType,
      String? title, String? message, Function() action) {
    Alert(
      context: context,
      style: const AlertStyle(
          titleStyle: TextStyle(fontSize: 16),
          descStyle: TextStyle(fontSize: 14)),
      type: alertType,
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
          child: Text(
            "cancel",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        DialogButton(
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
            action.call();
          },
          width: 120,
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ],
    ).show();
  }

  static void showConfirmDialogDoubleAction(
      BuildContext context,
      AlertType alertType,
      String? title,
      String? message,
      String buttonNegative,
      String buttonPositive,
      Function() actionNegative,
      Function() actionPositive) {
    Alert(
      context: context,
      style: const AlertStyle(
          titleStyle: TextStyle(fontSize: 16),
          descStyle: TextStyle(fontSize: 14)),
      type: alertType,
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
            actionNegative.call();
          },
          width: 120,
          child: Text(
            buttonNegative,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        DialogButton(
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
            actionPositive.call();
          },
          width: 120,
          child: Text(
            buttonPositive,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ],
    ).show();
  }

  static void showConnectionError(BuildContext context) {
    final alert = Alert(
      context: context,
      style: const AlertStyle(
        isButtonVisible: false,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        titleStyle: TextStyle(fontSize: 16),
        descStyle: TextStyle(fontSize: 14),
      ),
      image: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Image.asset(ilDataEmpty, width: 100, height: 100),
      ),
      title: "connection_issue",
      desc: "connection_issue_message",
    );
    NavKey.isAlreadyShowingConnectionError = true;
    alert.show();
    const duration = Duration(seconds: 3);
    Timer(duration, () {
      alert.dismiss();
      NavKey.isAlreadyShowingConnectionError = false;
    });
  }

  static bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 550;
  }

  Future<void> isIpad(BuildContext? context) async {
    var isIpadOrTablet = false;
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      if (context != null) {
        isIpadOrTablet = isTablet(context);
      }
    } else {
      final info = await deviceInfo.iosInfo;
      if (info.model != null) {
        if (info.model!.toLowerCase().contains("ipad")) {
          isIpadOrTablet = true;
        }
      } else {
        if (context != null) {
          isIpadOrTablet = isTablet(context);
        }
      }
    }

    NavKey.isIpadOrTablet = isIpadOrTablet;
  }
}
