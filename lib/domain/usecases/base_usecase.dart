// ignore_for_file: parameter_assignments

import 'dart:convert';
import 'dart:developer';

import 'package:ksp_pengawas_monthly/domain/models/error/error_dynamic.dart';
import 'package:ksp_pengawas_monthly/domain/models/error/error_message.dart';
import 'package:ksp_pengawas_monthly/domain/repositories/base_repository.dart';

abstract class BaseUsecase<R extends BaseRepository?> {
  R repository;

  ErrorMessage? error;
  ErrorHandlerDynamic? errorHandlerDynamic;

  BaseUsecase(this.repository);

  Future<ErrorMessage> mappingError(ErrorMessage? error, dynamic e) async {
    print(e);
    log(e.response.statusCode.toString());
    final int statusCode = e.response.statusCode;
    print(e.response.toString());
    try {
      error = ErrorMessage.fromJson(jsonDecode(e.response.toString()));
      return Future.value(error);
    } catch (e) {
      error = ErrorMessage(message: "There is something wrong !");
      return Future.value(error);
    }
  }

  Future<ErrorHandlerDynamic> mappingErrorDynamic(
      ErrorHandlerDynamic error, dynamic e) async {
    error = ErrorHandlerDynamic(0, "");
    try {
      final decoded = jsonDecode(e.response.toString());
      error.geMapping(decoded['errors']);
      error.httpCode = e.response.statusCode;
      error.message = decoded['message'];
      return Future.value(error);
    } catch (ignored) {
      error = ErrorHandlerDynamic(e.response.statusCode, e.response.toString());
      return Future.value(error);
    }
  }

  void disposeVariable() {
    error = null;
    errorHandlerDynamic = null;
  }
}
