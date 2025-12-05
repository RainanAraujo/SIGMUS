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
  Map<String, dynamic> permissoes;
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
      permissoes = item.permissoes,
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
}

enum SyncStatus { toDownload, toUpload, toMerge, upToDate }
