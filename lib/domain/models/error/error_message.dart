class ErrorMessage {
  String? message;
  List<dynamic>? data;
  Meta? meta;

  ErrorMessage({this.message, this.data, this.meta});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['message'] = message;
    json['json'] = data;
    if (meta != null) {
      json['meta'] = meta!.toJson();
    }
    return json;
  }
}

class Meta {
  String? message;

  Meta({this.message});

  Meta.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
