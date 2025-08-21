import 'package:ksp_pengawas_monthly/domain/models/error/error_message.dart';
import 'package:ksp_pengawas_monthly/domain/models/request/request.dart';
import 'package:ksp_pengawas_monthly/domain/models/response/response.dart';
import 'package:ksp_pengawas_monthly/domain/repositories/auth_repository.dart';

import '../base_usecase.dart';

abstract class IAuthUsecase extends BaseUsecase<AuthRepository?> {
  IAuthUsecase(AuthRepository? repository) : super(repository);

  Future<Map<LoginResponse?, ErrorMessage?>> doLogin(LoginRequest request);

  Future<Map<LoginResponse?, ErrorMessage?>> getProfile(
      int userId, String email);
}
