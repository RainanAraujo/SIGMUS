/// Formata um CPF para o padrão 000.000.000-00
String formatCpf(String cpf) {
  final digits = cpf.replaceAll(RegExp(r'\D'), '');
  if (digits.length != 11) return cpf;
  return '${digits.substring(0, 3)}.${digits.substring(3, 6)}.${digits.substring(6, 9)}-${digits.substring(9)}';
}

/// Formata um CNS para o padrão 000 0000 0000 0000
String formatCns(String cns) {
  final digits = cns.replaceAll(RegExp(r'\D'), '');
  if (digits.length != 15) return cns;
  return '${digits.substring(0, 3)} ${digits.substring(3, 7)} ${digits.substring(7, 11)} ${digits.substring(11)}';
}

/// Formata um telefone para o padrão (00) 00000-0000
String formatPhone(String phone) {
  final digits = phone.replaceAll(RegExp(r'\D'), '');
  if (digits.length == 11) {
    return '(${digits.substring(0, 2)}) ${digits.substring(2, 7)}-${digits.substring(7)}';
  } else if (digits.length == 10) {
    return '(${digits.substring(0, 2)}) ${digits.substring(2, 6)}-${digits.substring(6)}';
  }
  return phone;
}
