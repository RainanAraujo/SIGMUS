import 'package:sigmus/models/mutirao_item.dart';
import 'package:sigmus/utils/date_utils.dart';

extension MutiraoItemExtension on MutiraoItem {
  List<String> get availableDates {
    final startData = DateTime.tryParse(dataInicio);
    final endData = DateTime.tryParse(dataFinal);

    if (startData == null || endData == null) return [];

    final datas = <String>[];
    var current = startData;
    while (!current.isAfter(endData)) {
      datas.add(formatDate(current));
      current = current.add(const Duration(days: 1));
    }
    return datas;
  }
}
