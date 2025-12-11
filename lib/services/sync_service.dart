import 'dart:math';

import 'package:drift/drift.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart' as api;
import 'package:sigmus/services/sigmus_api.dart';

class SyncService {
  final AppDatabase _db;

  SyncService._(this._db);
  static final SyncService instance = SyncService._(AppDatabase());

  Future<int> getLastLocalModification(int mutiraoId) async {
    final mutiroesTS = await (_db.select(
      _db.mutiroes,
    )..where((tbl) => tbl.id.equals(mutiraoId))).getSingleOrNull();

    final pacienteMutiraoFilter =
        _db.condutas.mutiraoId.equals(mutiraoId) |
        _db.procedimentos.mutiraoId.equals(mutiraoId) |
        _db.condutasGenericas.mutiraoId.equals(mutiraoId);

    final pacienteQuery = _db.selectOnly(_db.pacientes)
      ..join([
        leftOuterJoin(
          _db.condutas,
          _db.condutas.pacienteId.equalsExp(_db.pacientes.id),
        ),
        leftOuterJoin(
          _db.procedimentos,
          _db.procedimentos.pacienteId.equalsExp(_db.pacientes.id),
        ),
        leftOuterJoin(
          _db.condutasGenericas,
          _db.condutasGenericas.pacienteId.equalsExp(_db.pacientes.id),
        ),
      ])
      ..where(pacienteMutiraoFilter)
      ..addColumns([_db.pacientes.atualizadoEm.max()]);
    final pacientesTS = await pacienteQuery
        .map((row) => row.read(_db.pacientes.atualizadoEm.max()))
        .getSingleOrNull();

    final colaboradoresQuery = _db.selectOnly(_db.colaboradores)
      ..where(_db.colaboradores.mutiraoId.equals(mutiraoId))
      ..addColumns([_db.colaboradores.atualizadoEm.max()]);
    final colaboradoresTS = await colaboradoresQuery
        .map((row) => row.read(_db.colaboradores.atualizadoEm.max()))
        .getSingleOrNull();

    final medicosQuery = _db.selectOnly(_db.medicos)
      ..where(_db.medicos.mutiraoId.equals(mutiraoId))
      ..addColumns([_db.medicos.atualizadoEm.max()]);
    final medicosTS = await medicosQuery
        .map((row) => row.read(_db.medicos.atualizadoEm.max()))
        .getSingleOrNull();

    final condutasQuery = _db.selectOnly(_db.condutas)
      ..where(_db.condutas.mutiraoId.equals(mutiraoId))
      ..addColumns([_db.condutas.atualizadoEm.max()]);
    final condutasTS = await condutasQuery
        .map((row) => row.read(_db.condutas.atualizadoEm.max()))
        .getSingleOrNull();

    final procedimentosQuery = _db.selectOnly(_db.procedimentos)
      ..where(_db.procedimentos.mutiraoId.equals(mutiraoId))
      ..addColumns([_db.procedimentos.atualizadoEm.max()]);
    final procedimentosTS = await procedimentosQuery
        .map((row) => row.read(_db.procedimentos.atualizadoEm.max()))
        .getSingleOrNull();

    final condutasGenericasQuery = _db.selectOnly(_db.condutasGenericas)
      ..where(_db.condutasGenericas.mutiraoId.equals(mutiraoId))
      ..addColumns([_db.condutasGenericas.atualizadoEm.max()]);
    final condutaGenericaTS = await condutasGenericasQuery
        .map((row) => row.read(_db.condutasGenericas.atualizadoEm.max()))
        .getSingleOrNull();

    final timestamps = [
      mutiroesTS?.atualizadoEm ?? 0,
      pacientesTS ?? 0,
      colaboradoresTS ?? 0,
      medicosTS ?? 0,
      condutasTS ?? 0,
      procedimentosTS ?? 0,
      condutaGenericaTS ?? 0,
    ];

    return timestamps.where((ts) => ts > 0).reduce(max);
  }

  Future<({int localTs, int remoteTs})> getLastSinc(int mutiraoId) async {
    final lastSinc =
        await (_db.select(_db.historicoSincronizacao)
              ..where((tbl) => tbl.mutiraoId.equals(mutiraoId))
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.remoteTs)])
              ..limit(1))
            .getSingleOrNull();

    return (localTs: lastSinc?.localTs ?? 0, remoteTs: lastSinc?.remoteTs ?? 0);
  }

  Future<void> setLastSinc(int mutiraoId, int remoteTs) async {
    final companion = HistoricoSincronizacaoCompanion(
      localTs: Value(DateTime.now().millisecondsSinceEpoch),
      remoteTs: Value(remoteTs),
      mutiraoId: Value(mutiraoId),
    );
    await _db
        .into(_db.historicoSincronizacao)
        .insert(companion, mode: InsertMode.replace);
  }

  Future<void> uploadMutiraoMudancas(int mutiraoId) async {
    final lastSinc = await getLastSinc(mutiraoId);
    final lastSincTS = lastSinc.localTs;

    final mutiraoChanges =
        await (_db.select(_db.mutiroes)
              ..where((tbl) => tbl.id.equals(mutiraoId))
              ..where((tbl) => tbl.atualizadoEm.isBiggerThanValue(lastSincTS)))
            .getSingleOrNull();

    Map<String, dynamic> permissoesMap = {};
    List<String> mutiraoCondutasList = [];

    if (mutiraoChanges != null) {
      final permissoes = await (_db.select(
        _db.permissoes,
      )..where((tbl) => tbl.mutiraoId.equals(mutiraoId))).get();
      permissoesMap = {
        for (var p in permissoes) p.email: {'permissoes': p.permissoes},
      };

      final mutiraoCondutas = await (_db.select(
        _db.mutiraoCondutas,
      )..where((tbl) => tbl.mutiraoId.equals(mutiraoId))).get();
      mutiraoCondutasList = mutiraoCondutas
          .map((mc) => mc.conduta ?? "")
          .toList();
    }

    final pacientesQuery =
        _db.select(_db.pacientes).join([
            leftOuterJoin(
              _db.condutas,
              _db.condutas.pacienteId.equalsExp(_db.pacientes.id),
            ),
            leftOuterJoin(
              _db.procedimentos,
              _db.procedimentos.pacienteId.equalsExp(_db.pacientes.id),
            ),
            leftOuterJoin(
              _db.condutasGenericas,
              _db.condutasGenericas.pacienteId.equalsExp(_db.pacientes.id),
            ),
          ])
          ..where(
            _db.condutas.mutiraoId.equals(mutiraoId) |
                _db.procedimentos.mutiraoId.equals(mutiraoId) |
                _db.condutasGenericas.mutiraoId.equals(mutiraoId),
          )
          ..where(_db.pacientes.atualizadoEm.isBiggerThanValue(lastSincTS));

    final pacientesChanges = await pacientesQuery
        .map((row) => row.readTable(_db.pacientes))
        .get();

    final colaboradoresChanges =
        await (_db.select(_db.colaboradores)
              ..where((tbl) => tbl.mutiraoId.equals(mutiraoId))
              ..where((tbl) => tbl.atualizadoEm.isBiggerThanValue(lastSincTS)))
            .get();

    final medicosChanges =
        await (_db.select(_db.medicos)
              ..where((tbl) => tbl.mutiraoId.equals(mutiraoId))
              ..where((tbl) => tbl.atualizadoEm.isBiggerThanValue(lastSincTS)))
            .get();

    final procedimentosChanges =
        await (_db.select(_db.procedimentos)
              ..where((tbl) => tbl.mutiraoId.equals(mutiraoId))
              ..where((tbl) => tbl.atualizadoEm.isBiggerThanValue(lastSincTS)))
            .get();

    final condutasChanges =
        await (_db.select(_db.condutas)
              ..where((tbl) => tbl.mutiraoId.equals(mutiraoId))
              ..where((tbl) => tbl.atualizadoEm.isBiggerThanValue(lastSincTS)))
            .get();

    final condutasGenericasChanges =
        await (_db.select(_db.condutasGenericas)
              ..where((tbl) => tbl.mutiraoId.equals(mutiraoId))
              ..where((tbl) => tbl.atualizadoEm.isBiggerThanValue(lastSincTS)))
            .get();

    final body = api.PostMutiraoMudancasReq(
      mutirao: mutiraoChanges == null
          ? null
          : api.MutiraoData(
              id: mutiraoChanges.id,
              tipo: mutiraoChanges.tipo,
              dataInicio: mutiraoChanges.dataInicio,
              dataFinal: mutiraoChanges.dataFinal,
              estado: mutiraoChanges.estado,
              municipio: mutiraoChanges.municipio,
              local: mutiraoChanges.local,
              demandante: mutiraoChanges.demandante,
              contratante: mutiraoChanges.contratante,
              atualizadoEm: mutiraoChanges.atualizadoEm,
              status: mutiraoChanges.status,
              permissoes: permissoesMap,
            ),
      colaboradores: {
        for (var c in colaboradoresChanges) c.id.toString(): c.toJson(),
      },
      pacientes: {for (var p in pacientesChanges) p.id.toString(): p.toJson()},
      medicos: {for (var m in medicosChanges) m.id.toString(): m.toJson()},
      procedimentos: {
        for (var p in procedimentosChanges) p.id.toString(): p.toJson(),
      },
      condutas: {for (var c in condutasChanges) c.id.toString(): c.toJson()},
      condutasGenericas: {
        for (var cg in condutasGenericasChanges) cg.id.toString(): cg.toJson(),
      },
      mutiraoCondutas: mutiraoCondutasList,
    );

    final res = await sigmusApi.postMutiraoMudancas(
      mutiraoID: mutiraoId,
      body: body,
    );

    if (res.isSuccessful && res.body?.timestamp != null) {
      await setLastSinc(mutiraoId, res.body!.timestamp);
    }
  }

  Future<void> downloadMutiraoMudancas(int mutiraoId) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final lastSinc = await getLastSinc(mutiraoId);

    final res = await sigmusApi.getMutiraoMudancas(
      mutiraoID: mutiraoId,
      depoisDe: lastSinc.remoteTs,
    );

    if (!res.isSuccessful || res.body == null) {
      throw Exception("Servidor inacessivel.");
    }

    final data = res.body!;

    try {
      await _db.transaction(() async {
        if (data.mutirao != null) {
          final mutirao = data.mutirao!;
          await _db
              .into(_db.mutiroes)
              .insert(
                MutiroesCompanion(
                  id: Value(mutirao.id),
                  tipo: Value(mutirao.tipo),
                  dataInicio: Value(mutirao.dataInicio),
                  dataFinal: Value(mutirao.dataFinal),
                  estado: Value(mutirao.estado),
                  municipio: Value(mutirao.municipio),
                  local: Value(mutirao.local),
                  demandante: Value(mutirao.demandante),
                  contratante: Value(mutirao.contratante),
                  atualizadoEm: Value(mutirao.atualizadoEm),
                  status: Value(mutirao.status),
                ),
                mode: InsertMode.replace,
              );

          await (_db.delete(
            _db.permissoes,
          )..where((tbl) => tbl.mutiraoId.equals(mutiraoId))).go();
          for (var entry in mutirao.permissoes.entries) {
            final permissoes = entry.value as List<dynamic>;
            await _db
                .into(_db.permissoes)
                .insert(
                  PermissoesCompanion(
                    mutiraoId: Value(mutiraoId),
                    email: Value(entry.key),
                    permissoes: Value(permissoes.cast<String>()),
                  ),
                  mode: InsertMode.replace,
                );
          }
        }

        if (data.mudancas?.mutiraoCondutas != null) {
          await (_db.delete(
            _db.mutiraoCondutas,
          )..where((tbl) => tbl.mutiraoId.equals(mutiraoId))).go();
          for (var conduta in data.mudancas!.mutiraoCondutas!) {
            await _db
                .into(_db.mutiraoCondutas)
                .insert(
                  MutiraoCondutasCompanion.insert(
                    mutiraoId: mutiraoId,
                    conduta: Value(conduta),
                  ),
                  mode: InsertMode.replace,
                );
          }
        }

        if (data.mudancas?.pacientes != null) {
          for (var entry in data.mudancas!.pacientes!.entries) {
            final id = int.parse(entry.key);
            final paciente = api.Paciente.fromJson(entry.value);
            final companion = PacientesCompanion(
              id: Value(id),
              cpf: Value(paciente.cpf),
              cns: Value(paciente.cns),
              nome: Value(paciente.nome),
              tel: Value(paciente.tel),
              dataNascimento: Value(paciente.dataNascimento),
              uf: Value(paciente.uf),
              municipio: Value(paciente.municipio),
              endereco: Value(paciente.endereco),
              nomeDaMae: Value(paciente.nomeDaMae),
              atualizadoEm: Value(now),
              status: Value(paciente.status),
            );
            await _db
                .into(_db.pacientes)
                .insert(companion, mode: InsertMode.replace);
          }
        }

        if (data.mudancas?.colaboradores != null) {
          for (var entry in data.mudancas!.colaboradores!.entries) {
            final id = int.parse(entry.key);
            final colaborador = api.Colaborador.fromJson(entry.value);
            final companion = ColaboradoresCompanion(
              id: Value(id),
              mutiraoId: Value(mutiraoId),
              nome: Value(colaborador.nome),
              funcao: Value(colaborador.funcao),
              atualizadoEm: Value(now),
              status: Value(colaborador.status),
            );
            await _db
                .into(_db.colaboradores)
                .insert(companion, mode: InsertMode.replace);
          }
        }

        if (data.mudancas?.medicos != null) {
          for (var entry in data.mudancas!.medicos!.entries) {
            final id = int.parse(entry.key);
            final medico = api.Medico.fromJson(entry.value);
            final companion = MedicosCompanion(
              id: Value(id),
              mutiraoId: Value(mutiraoId),
              nome: Value(medico.nome),
              crm: Value(medico.crm),
              atualizadoEm: Value(now),
              status: Value(medico.status),
            );
            await _db
                .into(_db.medicos)
                .insert(companion, mode: InsertMode.replace);
          }
        }

        if (data.mudancas?.condutas != null) {
          for (var entry in data.mudancas!.condutas!.entries) {
            final id = int.parse(entry.key);
            final conduta = api.Conduta.fromJson(entry.value);
            final companion = CondutasCompanion(
              id: Value(id),
              mutiraoId: Value(mutiraoId),
              data: Value(conduta.data),
              pacienteId: Value(conduta.pacienteId),
              medicoId: Value(conduta.medicoId),
              tipo: Value(conduta.tipo),
              dados: Value(conduta.dados.toString()),
              atualizadoEm: Value(now),
              status: Value(conduta.status),
            );
            await _db
                .into(_db.condutas)
                .insert(companion, mode: InsertMode.replace);
          }
        }

        if (data.mudancas?.procedimentos != null) {
          for (var entry in data.mudancas!.procedimentos!.entries) {
            final id = int.parse(entry.key);
            final procedimento = api.Procedimento.fromJson(entry.value);
            final companion = ProcedimentosCompanion(
              id: Value(id),
              mutiraoId: Value(mutiraoId),
              data: Value(procedimento.data),
              pacienteId: Value(procedimento.pacienteId),
              medicoId: Value(procedimento.medicoId ?? 0),
              tipo: Value(procedimento.tipo ?? ''),
              olho: Value(procedimento.olho ?? ''),
              dioptriaLente: Value(procedimento.dioptriaLente),
              intercorrencia: Value(procedimento.intercorrencia),
              observacao: Value(procedimento.observacao),
              atualizadoEm: Value(now),
              status: Value(procedimento.status),
            );
            await _db
                .into(_db.procedimentos)
                .insert(companion, mode: InsertMode.replace);
          }
        }

        if (data.mudancas?.condutasGenericas != null) {
          for (var entry in data.mudancas!.condutasGenericas!.entries) {
            final id = int.parse(entry.key);
            final condutaGenerica = api.CondutaGenerica.fromJson(entry.value);
            final companion = CondutasGenericasCompanion(
              id: Value(id),
              mutiraoId: Value(mutiraoId),
              data: Value(condutaGenerica.data),
              pacienteId: Value(condutaGenerica.pacienteId),
              medicoId: Value(condutaGenerica.medicoId),
              conduta: Value(condutaGenerica.conduta),
              observacao: Value(null),
              atualizadoEm: Value(now),
              status: Value(condutaGenerica.status),
            );
            await _db
                .into(_db.condutasGenericas)
                .insert(companion, mode: InsertMode.replace);
          }
        }
      });

      await setLastSinc(mutiraoId, data.timestamp);
    } catch (e) {
      print('Error during sync download: $e');
      rethrow;
    }
  }
}
