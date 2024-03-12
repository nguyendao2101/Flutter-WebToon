import 'dart:convert';

class LoginResponseModel {
  final String? message;
  final int? statusCode;
  final MetaData? metadata;

  LoginResponseModel(
    this.message,
    this.statusCode,
    this.metadata,
  );

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'statusCode': statusCode,
      'metaData': metadata?.toMap(),
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      map['message'],
      map['statusCode']?.toInt(),
      map['metaData'] != null ? MetaData.fromMap(map['metaData']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source));
}

class Shop {
  final String? id;
  final String? name;
  final String? email;

  Shop({required this.id, required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) => Shop.fromMap(json.decode(source));
}

class Tokenn {
  final String? accessToken;
  final String? refreshToken;

  Tokenn(this.accessToken, this.refreshToken);

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory Tokenn.fromMap(Map<String, dynamic> map) {
    return Tokenn(
      map['accessToken'],
      map['refreshToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tokenn.fromJson(String source) => Tokenn.fromMap(json.decode(source));
}

class MetaData {
  final Shop? shop;
  final Tokenn? tokenn;

  MetaData(this.shop, this.tokenn);

  Map<String, dynamic> toMap() {
    return {
      'shop': shop?.toMap(),
      'tokenn': tokenn?.toMap(),
    };
  }

  factory MetaData.fromMap(Map<String, dynamic> map) {
    return MetaData(
      map['shop'] != null ? Shop.fromMap(map['shop']) : null,
      map['tokenn'] != null ? Tokenn.fromMap(map['tokenn']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MetaData.fromJson(String source) =>
      MetaData.fromMap(json.decode(source));
}
