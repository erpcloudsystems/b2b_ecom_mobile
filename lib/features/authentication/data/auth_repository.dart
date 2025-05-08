import 'dart:developer';

import 'package:class_a_ec/features/authentication/data/auth_data_source.dart';
import 'package:class_a_ec/features/authentication/data/models/login_model.dart';

abstract class BaseAuthRepository {
  Future<LoginModel> login({required LoginModel loginModel});
}

class AuthRepository implements BaseAuthRepository {
  AuthRepository({required this.authDataSource});
  final AuthDataSource authDataSource;

  @override
  Future<LoginModel> login({required LoginModel loginModel}) async {
    final response = await authDataSource.login(loginModel: loginModel);
    final cookies = response.headers['set-cookie'];
    Map<String, String> cookieMap = {};
    if (cookies != null && cookies.isNotEmpty) {
      for (var cookie in cookies) {
        final parts = cookie.split(';');
        for (var part in parts) {
          final keyValue = part.split('=');
          if (keyValue.length == 2) {
            final key = keyValue[0].trim();
            final value = keyValue[1];
            cookieMap[key] = value;
          }
        }
      }
    }
    cookieMap = cookieMap
        .map((key, value) => MapEntry(key, Uri.decodeComponent(value)));

    cookieMap.forEach((key, value) {
      log('$key: $value');
    });
    return LoginModel.fromMap(response.data);
  }
}
