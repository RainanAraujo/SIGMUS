import 'package:intl/intl.dart';

String formatDateRangeFromString(String inicio, String fim) {
  final inicioParsed = DateTime.tryParse(inicio);
  final fimParsed = DateTime.tryParse(fim);
  final dateInicio = DateFormat('dd/MM/yyyy', 'pt_BR').format(inicioParsed!);
  final dateFim = DateFormat('dd/MM/yyyy', 'pt_BR').format(fimParsed!);

  if (inicio == fim) {
    return dateInicio.toString();
  }

  return '$dateInicio - $dateFim';
}

String formatDateFromString(String date) {
  final dateParsed = DateTime.tryParse(date);
  final dateFormatted = DateFormat('dd/MM/yyyy', 'pt_BR').format(dateParsed!);
  return dateFormatted;
}

/// Formata uma data para o formato DD/MM/AAAA
String formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}

/// Formata uma data para o formato AAAA-MM-DD (ISO)
String formatDateISO(DateTime date) {
  return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

/// Faz o parse de uma string no formato DD/MM/AAAA para DateTime
DateTime? parseDate(String text) {
  final parts = text.split('/');
  if (parts.length != 3) return null;
  try {
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    // Validação básica
    if (day < 1 || day > 31) return null;
    if (month < 1 || month > 12) return null;
    if (year < 1900 || year > 2100) return null;

    return DateTime(year, month, day);
  } catch (_) {
    return null;
  }
}

/// Faz o parse de uma string no formato AAAA-MM-DD (ISO) para DateTime
DateTime? parseDateISO(String text) {
  return DateTime.tryParse(text);
}

/// Formata um intervalo de datas
/// Se as datas forem iguais, retorna apenas uma data
String formatDateRange(DateTime inicio, DateTime fim) {
  final inicioFormatted = formatDate(inicio);
  final fimFormatted = formatDate(fim);

  if (inicioFormatted == fimFormatted) {
    return inicioFormatted;
  }

  return '$inicioFormatted - $fimFormatted';
}

/// Formata um intervalo de datas a partir de strings ISO
String formatDateRangeFromISO(String inicio, String fim) {
  final inicioParsed = DateTime.tryParse(inicio);
  final fimParsed = DateTime.tryParse(fim);

  if (inicioParsed == null || fimParsed == null) {
    return '$inicio - $fim';
  }

  return formatDateRange(inicioParsed, fimParsed);
}

/// Calcula a idade a partir da data de nascimento
int calculateAge(DateTime birthDate) {
  final now = DateTime.now();
  int age = now.year - birthDate.year;

  if (now.month < birthDate.month ||
      (now.month == birthDate.month && now.day < birthDate.day)) {
    age--;
  }

  return age;
}

/// Verifica se uma data é válida
bool isValidDate(int day, int month, int year) {
  if (month < 1 || month > 12) return false;
  if (day < 1) return false;

  final daysInMonth = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  // Ano bissexto
  if (month == 2 && _isLeapYear(year)) {
    return day <= 29;
  }

  return day <= daysInMonth[month];
}

bool _isLeapYear(int year) {
  return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}
