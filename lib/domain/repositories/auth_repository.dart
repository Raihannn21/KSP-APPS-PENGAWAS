import 'package:ksp_pengawas_monthly/data/remote/dio_client.dart';
import 'package:ksp_pengawas_monthly/data/remote/endpoints/auth_endpoints.dart';
import 'package:ksp_pengawas_monthly/domain/models/request/request.dart';
import 'package:ksp_pengawas_monthly/domain/models/response/response.dart';
import 'package:ksp_pengawas_monthly/domain/repositories/base_repository.dart';

import 'base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(DioClient? dioClient) : super(dioClient);

  dynamic data;

  Future<LoginResponse> requestLogin({required LoginRequest request}) async {
    await dioClient!
        .post(AuthEndpoint.urlLogin, data: request.toJson())
        .then((value) {
      data = value;
    });
    return LoginResponse.fromJson(data);
  }

  Future<LoginResponse> getProfile(int userId, String email) async {
    await dioClient!
        .get(AuthEndpoint.urlGetProfile(userId, email))
        .then((value) {
      data = value;
    });
    return LoginResponse.fromJson(data);
  }
}
