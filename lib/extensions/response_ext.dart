import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';

extension ResponseExtension on Response {
  ErrorMessage? get errorMessage {
    final content = error;
    if (content is String) {
      final jsonContent = jsonDecode(content) as Map<String, dynamic>;
      if (jsonContent case {
        "messagem": String mensagem,
        "error": String error,
      }) {
        return ErrorMessage(messagem: mensagem, error: error);
      }
    }
    return null;
  }
}
