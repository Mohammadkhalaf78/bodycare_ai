import 'package:bodycare_ai/core/network/api/end_point.dart';

class SignInModel {
  final String message;
  final String token;

  SignInModel( {required this.message, required this.token});

  Map<String, dynamic> toJson() {
    return {'email': message, 'password': token,};
  }

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      message: jsonData[ApiKey.status],
      token: jsonData[ApiKey.token],
    );
  }
}

class Data {
  final String id;
  final String name;
  final String role;

  Data({required this.id, required this.name, required this.role});

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'role': role};
  }

  factory Data.fromJson(Map<String, dynamic> jsonData) {
    return Data(
      id: jsonData['id'],
      name: jsonData['name'],
      role: jsonData['role'],
    );
  }
}
