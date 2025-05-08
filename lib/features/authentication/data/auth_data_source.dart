import 'package:class_a_ec/core/network/api_constant.dart';
import 'package:class_a_ec/core/network/dio_helper.dart';
import 'package:class_a_ec/features/authentication/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_data_source.g.dart';

class AuthDataSource {
  const AuthDataSource({required this.dio});
  final BaseDioHelper dio;

  Future<Response> login({required LoginModel loginModel}) async {
    return await dio.post(
      endPoint: ApiConstance.login,
      isLogin: true,
      data: loginModel.toMap(),
    );
  }
}

@riverpod
AuthDataSource authDataSource(Ref ref) {
  final dio = ref.read(dioHelperProvider);
  return AuthDataSource(dio: dio);
}
