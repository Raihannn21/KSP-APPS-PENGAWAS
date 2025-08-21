
import 'package:json_annotation/json_annotation.dart';

class EmptyResponse  {
  bool? status;
  String? message;

  EmptyResponse({this.status, this.message});

  EmptyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}