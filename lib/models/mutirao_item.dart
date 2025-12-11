import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';

class MutiraoItem {
  int id;
  String tipo;
  String contratante;
  String dataFinal;
  String dataInicio;
  String demandante;
  String estado;
  String local;
  String municipio;
  Map<String, List<String>> permissoes;
  int status;
  SyncStatus syncStatus;

  MutiraoItem({
    required this.id,
    required this.tipo,
    required this.contratante,
    required this.dataFinal,
    required this.dataInicio,
    required this.demandante,
    required this.estado,
    required this.local,
    required this.municipio,
    required this.permissoes,
    required this.status,
    required this.syncStatus,
  });

  MutiraoItem.fromApiMutirao(MutiraoInfo item)
    : id = item.id,
      tipo = item.tipo,
      contratante = item.contratante,
      dataFinal = item.dataFinal,
      dataInicio = item.dataInicio,
      demandante = item.demandante,
      estado = item.estado,
      local = item.local,
      municipio = item.municipio,
      permissoes = (item.permissoes).map(
        (key, value) =>
            MapEntry(key, (value as List<dynamic>).cast<String>().toList()),
      ),
      status = item.status,
      syncStatus = SyncStatus.toDownload;

  MutiraoItem.fromDbMutirao(Mutirao item)
    : id = item.id,
      tipo = item.tipo,
      contratante = item.contratante,
      dataFinal = item.dataFinal,
      dataInicio = item.dataInicio,
      demandante = item.demandante,
      estado = item.estado,
      local = item.local,
      municipio = item.municipio,
      permissoes = const {},
      status = item.status,
      syncStatus = SyncStatus.toUpload;

  Mutirao toDbMutirao({required int atualizadoEm}) => Mutirao(
    id: id,
    tipo: tipo,
    contratante: contratante,
    dataFinal: dataFinal,
    dataInicio: dataInicio,
    demandante: demandante,
    estado: estado,
    local: local,
    municipio: municipio,
    status: status,
    atualizadoEm: atualizadoEm,
  );
}

enum SyncStatus { toDownload, toUpload, toMerge, upToDate }
