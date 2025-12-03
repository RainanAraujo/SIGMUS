import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';

class AuthInterceptor implements Interceptor {
  ValueNotifier<String?> token = ValueNotifier<String?>(null);
  ValueNotifier<SafeUsuario?> userData = ValueNotifier<SafeUsuario?>(null);

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    if (token.value != null) {
      chain.request.headers['Authorization'] = 'Bearer ${token.value}';
    }
    return chain.proceed(chain.request);
  }

  void setToken(String? token) {
    this.token.value = token;
    if (token != null) {
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      userData.value = SafeUsuario.fromJson(payload);
    } else {
      userData.value = null;
    }
  }
}

extension TokenExt on SigmusApi {
  void setToken(String? token) {
    client.interceptors.whereType<AuthInterceptor>().first.setToken(token);
  }

  ValueNotifier<SafeUsuario?> get userData {
    return client.interceptors.whereType<AuthInterceptor>().first.userData;
  }

  ValueNotifier<String?> get token {
    return client.interceptors.whereType<AuthInterceptor>().first.token;
  }
}

final sigmusApi = SigmusApi.create(
  baseUrl: Uri.tryParse("http://145.223.26.57:8080/"),
  interceptors: [AuthInterceptor()],
);
