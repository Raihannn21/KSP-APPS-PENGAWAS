// ignore_for_file: always_declare_return_types, type_annotate_public_apis

import 'package:ksp_pengawas_monthly/domain/models/error/error_message.dart';
import 'package:ksp_pengawas_monthly/domain/models/request/request.dart';
import 'package:ksp_pengawas_monthly/domain/models/response/response.dart';
import 'package:ksp_pengawas_monthly/domain/repositories/auth_repository.dart';

import 'i_auth_usecase.dart';

class AuthUsecase extends IAuthUsecase {
  AuthUsecase(AuthRepository repository) : super(repository);

  AuthUsecase.empty() : super(null);

  @override
  Future<Map<LoginResponse?, ErrorMessage?>> doLogin(
      LoginRequest request) async {
    disposeVariable();
    LoginResponse? response;
    await repository?.requestLogin(request: request).then((val) {
      response = val;
    }).catchError((e) async {
      await mappingError(error, e).then((value) => error = value);
    });
    return Future.value({response: error});
  }

  @override
  Future<Map<LoginResponse?, ErrorMessage?>> getProfile(
      int userId, String email) async {
    disposeVariable();
    LoginResponse? response;
    await repository?.getProfile(userId, email).then((val) {
      response = val;
    }).catchError((e) async {
      await mappingError(error, e).then((value) => error = value);
    });
    return Future.value({response: error});
  }
}
