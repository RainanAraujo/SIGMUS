/// Valida um CPF brasileiro
/// Retorna null se válido, ou uma mensagem de erro se inválido
String? validateCpf(String? value) {
  if (value == null || value.isEmpty) {
    return null; // Campo vazio é tratado por outro validator (obrigatório)
  }

  // Remove caracteres não numéricos
  final cpf = value.replaceAll(RegExp(r'\D'), '');

  // Verifica se tem 11 dígitos
  if (cpf.length != 11) {
    return 'CPF deve ter 11 dígitos';
  }

  // Verifica se todos os dígitos são iguais (CPF inválido)
  if (RegExp(r'^(\d)\1{10}$').hasMatch(cpf)) {
    return 'CPF inválido';
  }

  // Calcula o primeiro dígito verificador
  int sum = 0;
  for (int i = 0; i < 9; i++) {
    sum += int.parse(cpf[i]) * (10 - i);
  }
  int firstDigit = (sum * 10) % 11;
  if (firstDigit == 10) firstDigit = 0;

  // Verifica o primeiro dígito
  if (firstDigit != int.parse(cpf[9])) {
    return 'CPF inválido';
  }

  // Calcula o segundo dígito verificador
  sum = 0;
  for (int i = 0; i < 10; i++) {
    sum += int.parse(cpf[i]) * (11 - i);
  }
  int secondDigit = (sum * 10) % 11;
  if (secondDigit == 10) secondDigit = 0;

  // Verifica o segundo dígito
  if (secondDigit != int.parse(cpf[10])) {
    return 'CPF inválido';
  }

  return null;
}

/// Verifica se um CPF é válido (retorna bool)
bool isValidCpf(String? value) {
  return validateCpf(value) == null && value != null && value.isNotEmpty;
}

/// Valida um CNS (Cartão Nacional de Saúde)
/// Retorna null se válido, ou uma mensagem de erro se inválido
String? validateCns(String? value) {
  if (value == null || value.isEmpty) {
    return null; // Campo vazio é tratado por outro validator
  }

  // Remove caracteres não numéricos
  final cns = value.replaceAll(RegExp(r'\D'), '');

  // Verifica se tem 15 dígitos
  if (cns.length != 15) {
    return 'CNS deve ter 15 dígitos';
  }

  // CNS definitivo começa com 1 ou 2
  // CNS provisório começa com 7, 8 ou 9
  final firstDigit = cns[0];
  if (!['1', '2', '7', '8', '9'].contains(firstDigit)) {
    return 'CNS inválido';
  }

  // Validação para CNS definitivo (começa com 1 ou 2)
  if (firstDigit == '1' || firstDigit == '2') {
    int sum = 0;
    for (int i = 0; i < 15; i++) {
      sum += int.parse(cns[i]) * (15 - i);
    }
    if (sum % 11 != 0) {
      return 'CNS inválido';
    }
  }
  // Validação para CNS provisório (começa com 7, 8 ou 9)
  else {
    int sum = 0;
    for (int i = 0; i < 15; i++) {
      sum += int.parse(cns[i]) * (15 - i);
    }
    if (sum % 11 != 0) {
      return 'CNS inválido';
    }
  }

  return null;
}

/// Verifica se um CNS é válido (retorna bool)
bool isValidCns(String? value) {
  return validateCns(value) == null && value != null && value.isNotEmpty;
}

/// Valida um telefone brasileiro
/// Retorna null se válido, ou uma mensagem de erro se inválido
String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }

  final phone = value.replaceAll(RegExp(r'\D'), '');

  if (phone.length < 10 || phone.length > 11) {
    return 'Telefone inválido';
  }

  // DDD válido (11 a 99)
  final ddd = int.parse(phone.substring(0, 2));
  if (ddd < 11 || ddd > 99) {
    return 'DDD inválido';
  }

  return null;
}

/// Verifica se um telefone é válido (retorna bool)
bool isValidPhone(String? value) {
  return validatePhone(value) == null && value != null && value.isNotEmpty;
}
