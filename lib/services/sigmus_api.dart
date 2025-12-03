import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';

class AuthService implements Interceptor {
  ValueNotifier<String?> token = ValueNotifier<String?>(null);
  ValueNotifier<SafeUsuario?> userData = ValueNotifier<SafeUsuario?>(null);

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final senha = prefs.getString('senha');
    if (email != null && senha != null) {
      await sigmusApi.postEntrar(
        body: PostEntrarReq(email: email, senha: senha),
      );
    }
  }

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    if (token.value != null) {
      chain.request.headers['Authorization'] = 'Bearer ${token.value}';
    }

    if (chain.request.uri.path == '/entrar') {
      final res = await chain.proceed(chain.request);
      final prefs = await SharedPreferences.getInstance();
      if (res.isSuccessful) {
        final resBody = res.body;
        if (resBody is PostEntrarRes) {
          setToken(resBody.token);
        }
        final body = PostEntrarReq.fromJson(jsonDecode(chain.request.body));
        await prefs.setString('email', body.email);
        await prefs.setString('senha', body.senha);
      } else {
        await prefs.remove('email');
        await prefs.remove('senha');
      }
      return res;
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

extension AuthExt on SigmusApi {
  AuthService get authService =>
      client.interceptors.whereType<AuthService>().first;
}

final sigmusApi = SigmusApi.create(
  baseUrl: Uri.tryParse("http://145.223.26.57:8080/"),
  interceptors: [AuthService()],
);
