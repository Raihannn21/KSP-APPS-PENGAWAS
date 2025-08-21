import 'dart:developer';
import 'dart:io';

import 'package:encrypt/encrypt.dart' as enc;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:loadmore/loadmore.dart';

extension DateExtension on String {
  String toDateWithDay() {
    initializeDateFormatting('in_ID');
    return DateFormat('EEEE, dd MMMM yyyy')
        .format(DateTime.parse(this))
        .toString();
  }
}

// ignore: avoid_classes_with_only_static_members
class OtherUtils {
  static bool validatePhoneNumber(String value) {
    const pattern = r'(^(?:[+0]8)[0-9]{8,12}$)';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String removeJsonProp(String json) {
    return json
        .replaceAll("(", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(")", "");
  }

  static List<String> splitName(String displayName) {
    final splitted = displayName.split(" ");
    return splitted;
  }

  static dynamic myEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    if (item is File) {
      return "";
    }
    return item;
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => log(match.group(0)!));
  }

  static String? buildLoadMoreText(LoadMoreStatus status) {
    String? text = "";
    switch (status) {
      case LoadMoreStatus.fail:
        text = "load_more_failed";
        break;
      case LoadMoreStatus.idle:
        text = "load_more_idle";
        break;
      case LoadMoreStatus.loading:
        text = "load_more_load";
        break;
      case LoadMoreStatus.nomore:
        text = "load_more_finish";
        break;
      default:
        text = "";
    }
    return text;
  }

  static const String waitingPayment = "waiting_payment";
  static const String paid = "paid";
  static const String inProgress = "inprogress";
  static const String confirmByAdmin = "confirm_by_admin";
  static const String stockChecked = "stock_checked";
  static const String modified = "modified";
  static const String picked = "picked";
  static const String pickConfirmed = "pick_confirmed";
  static const String delivery = "delivery";
  static const String arrived = "arrived";
  static const String distributedToCustomer = "distributed_to_customer";
  static const String expired = "expired";
  static const String canceledByAdmin = "canceled_by_admin";

  static String? translateStatusOrder(String? status) {
    switch (status) {
      case waitingPayment:
        return "waiting_payment";
      case inProgress:
        return "order_process";
      case delivery:
        return "order_delivery";
      case arrived:
        return "order_arrived";
      case distributedToCustomer:
        return "order_distributed_to_customer";
      case expired:
        return "payment_decline";
      case canceledByAdmin:
        return "canceled_by_admin";
      default:
        return "order_process";
    }
  }

  static String? translateStatusOrderNotification(String status) {
    switch (status) {
      case waitingPayment:
        return "notif_waiting_payment";
      case paid:
        return "notif_paid";
      case inProgress:
        return "notif_order_process";
      case confirmByAdmin:
        return "notif_confirm_by_admin";
      case stockChecked:
        return "notif_stock_checked";
      case modified:
        return "notif_modified";
      case picked:
        return "notif_picked";
      case pickConfirmed:
        return "notif_pick_confirmed";
      case expired:
        return "notif_expired";
      case canceledByAdmin:
        return "notif_canceled_by_admin";
      case delivery:
        return "notif_order_delivery";
      case arrived:
        return "notif_order_arrived";
      case distributedToCustomer:
        return "notif_order_distributed_to_customer";
      default:
        return "notif_order_process";
    }
  }

  static String getRegexPassword() {
    return r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!\#$%&\()*+,-./:;<=>?@[\]^_\`{|}~\"]).{6,}$';
  }

  static String nullReturnStripe(String? value) {
    if (value == null) {
      return "-";
    } else {
      if (value.isEmpty) {
        return "-";
      } else {
        return value;
      }
    }
  }

  static String replacePhoneNumber(String identity) {
    // if (identity.startsWith("0")) {
    //   return identity.replaceFirst("0", "");
    // } else
    if (identity.startsWith("62")) {
      return identity.replaceAll("62", "");
    }
    // else if (identity.startsWith("8")) {
    //   return "62$identity";
    // }
    else if (identity.startsWith("+")) {
      return identity.replaceFirst("+", "");
    } else {
      return identity;
    }
  }

  static String? decrypt(String s) {
    if (s.isEmpty) return "";
    final key = enc.Key.fromUtf8("IKaFajZGzdyDzLoyZvizGLVsrHorTtug");
    final iv = enc.IV.fromUtf8("0123456789987654");

    final _e = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final _dctr = _e.decrypt64(s, iv: iv);
    return _dctr;
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
