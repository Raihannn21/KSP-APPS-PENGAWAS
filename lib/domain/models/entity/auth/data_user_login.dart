import 'dart:convert';

class DataUserLogin {
  int? id;
  String? name;
  String? phoneNumberCode;
  String? phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? status;
  String? image;
  String? address;
  String? facebookUrl;
  String? instagramUrl;
  String? createdAt;
  String? updatedAt;
  String? token;
  String? imageUrl;

  DataUserLogin(
      {this.id,
      this.name,
      this.phoneNumberCode,
      this.phoneNumber,
      this.email,
      this.emailVerifiedAt,
      this.status,
      this.image,
      this.address,
      this.facebookUrl,
      this.instagramUrl,
      this.createdAt,
      this.updatedAt,
      this.token,
      this.imageUrl});

  DataUserLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumberCode = json['phone_number_code'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    image = json['image'];
    address = json['address'];
    facebookUrl = json['facebook_url'];
    instagramUrl = json['instagram_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_number_code'] = phoneNumberCode;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['status'] = status;
    data['image'] = image;
    data['address'] = address;
    data['facebook_url'] = facebookUrl;
    data['instagram_url'] = instagramUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    data['image_url'] = imageUrl;
    return data;
  }
}
