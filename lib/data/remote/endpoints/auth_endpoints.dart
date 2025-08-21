import 'package:ksp_pengawas_monthly/data/remote/endpoints/endpoints.dart';

class AuthEndpoint {
  AuthEndpoint._();

  static String urlLogin = '${Endpoints().baseUrl!}/api/login';
  static String urlLoginSocial = '${Endpoints().baseUrl!}/api/login-social';
  static String urlLogout = '${Endpoints().baseUrl!}/api/logout';
  static String urlRegister = '${Endpoints().baseUrl!}/api/register';
  static String urlSendOtp = '${Endpoints().baseUrl!}/api/send-otp';
  static String urlValidateOtp = '${Endpoints().baseUrl!}/api/validate-otp';

  static String urlGetProfile(int userId, String email) {
    return '${Endpoints().baseUrl!}/api/user/show?user_id=$userId&email=$email';
  }

  static String urlUpdateProfile =
      '${Endpoints().baseUrl!}/api/user/update-profile';
  static String urlUpdatePhotoProfile =
      '${Endpoints().baseUrl!}/api/user/update-image';
}
