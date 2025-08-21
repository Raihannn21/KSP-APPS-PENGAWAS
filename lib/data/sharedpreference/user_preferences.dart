import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String userToken = "userToken";
  static const String userId = "userId";
  static const String userData = "userData";

  Future<bool> clearData() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(userToken);
    await preferences.remove(userData);
    await preferences.remove(userId);

    const secureStorage = FlutterSecureStorage();
    await secureStorage.deleteAll();
    return true;
  }

  Future<String> getUserToken() async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(userToken) ?? "";
    return value;
  }

  Future<String> getUserData() async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(userData) ?? "";
    return value;
  }

  Future<int> getUserId() async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getInt(userId) ?? 0;
    return value;
  }

  Future<void> setUserToken(String val) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(userToken, val);
  }

  Future<void> setUserData(String val) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(userData, val);
  }

  Future<void> setUserId(int val) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(userId, val);
  }
}
