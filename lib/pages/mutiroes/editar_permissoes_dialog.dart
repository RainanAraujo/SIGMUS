import 'package:flutter/material.dart';
import 'package:sigmus/models/mutirao_item.dart';
import 'package:sigmus/utils/date_utils.dart';
import 'package:sigmus/widgets/app_dialog.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/app_toast.dart';

/// Representa uma permissão de usuário no mutirão
class PermissaoUsuario {
  String email;
  String permissao;

  PermissaoUsuario({required this.email, required this.permissao});
}

class EditarPermissoesDialog extends StatefulWidget {
  final MutiraoItem mutirao;
  final VoidCallback? onSave;

  const EditarPermissoesDialog({super.key, required this.mutirao, this.onSave});

  @override
  State<EditarPermissoesDialog> createState() => _EditarPermissoesDialogState();
}

class _EditarPermissoesDialogState extends State<EditarPermissoesDialog> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String _selectedPermissao = 'leitura';

  List<PermissaoUsuario> _permissoes = [];
  bool _isSaving = false;

  final List<String> _permissaoOptions = ['leitura', 'escrita', 'edicao'];

  String _getPermissaoLabel(String value) {
    switch (value) {
      case 'leitura':
        return 'Leitor';
      case 'escrita':
        return 'Editor';
      case 'edicao':
        return 'Administrador';
      default:
        return value;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPermissoes();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _loadPermissoes() {
    final permissoesMap = widget.mutirao.permissoes;
    _permissoes = [];

    permissoesMap.forEach((email, permissoes) {
      String permissao = 'leitura';
      if (permissoes.contains('edicao')) {
        permissao = 'edicao';
      } else if (permissoes.contains('escrita')) {
        permissao = 'escrita';
      } else if (permissoes.contains('leitura')) {
        permissao = 'leitura';
      }

      _permissoes.add(PermissaoUsuario(email: email, permissao: permissao));
    });

    setState(() {});
  }

  void _adicionarPermissao() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();

      if (_permissoes.any((p) => p.email == email)) {
        AppToast.error(context, message: 'Este email já possui permissão');
        return;
      }

      setState(() {
        _permissoes.add(
          PermissaoUsuario(email: email, permissao: _selectedPermissao),
        );
        _emailController.clear();
        _selectedPermissao = 'leitura';
      });
    }
  }

  void _removerPermissao(PermissaoUsuario permissao) {
    setState(() {
      _permissoes.remove(permissao);
    });
  }

  void _atualizarPermissao(PermissaoUsuario permissao, String novaPermissao) {
    setState(() {
      permissao.permissao = novaPermissao;
    });
  }

  Future<void> _salvar() async {
    setState(() => _isSaving = true);

    try {
      // Converte List<PermissaoUsuario> de volta para o formato esperado pela API
      // A API espera um Map onde cada email tem uma lista de permissões
      // Como a permissão é hierárquica, incluímos todas as permissões abaixo
      final Map<String, List<String>> permissoesMap = {};

      for (final p in _permissoes) {
        List<String> perms = [];
        switch (p.permissao) {
          case 'edicao':
            perms = ['leitura', 'escrita', 'edicao'];
            break;
          case 'escrita':
            perms = ['leitura', 'escrita'];
            break;
          case 'leitura':
          default:
            perms = ['leitura'];
            break;
        }
        permissoesMap[p.email] = perms;
      }

      // TODO: Chamar API quando o modelo PutMutiraoPermissoesReq for atualizado
      // await sigmusApi.putMutiraoPermissoes(
      //   mutiraoID: widget.mutirao.id,
      //   body: PutMutiraoPermissoesReq(...),
      // );

      // Atualiza localmente
      widget.mutirao.permissoes = permissoesMap;

      if (mounted) {
        AppToast.success(
          context,
          message: 'Permissões atualizadas com sucesso',
        );
        widget.onSave?.call();
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        AppToast.error(context, message: 'Erro ao salvar permissões: $e');
      }
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataInicio = formatDateFromString(widget.mutirao.dataInicio);
    final dataFinal = formatDateFromString(widget.mutirao.dataFinal);

    return AppDialog(
      title: 'Editar permissões',
      description: '${widget.mutirao.local} - ($dataInicio - $dataFinal)',
      maxWidth: 700,

      actions: [
        ElevatedButton(
          onPressed: _isSaving ? null : _salvar,
          child: _isSaving
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Salvar'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email *',
                      hintText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email é obrigatório';
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Email inválido';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppDropdown<String>(
                    initialValue: _selectedPermissao,

                    label: 'Permissão',
                    items: _permissaoOptions.map((p) {
                      return DropdownMenuItem(
                        value: p,
                        child: Text(_getPermissaoLabel(p)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _selectedPermissao = value);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: _adicionarPermissao,
                    child: const Text('Adicionar'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Permissão',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),

        if (_permissoes.isEmpty)
          Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Text(
                'Nenhuma permissão adicionada',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ),
          )
        else
          ...List.generate(_permissoes.length, (index) {
            final permissao = _permissoes[index];
            return _buildTableRow(permissao);
          }),
      ],
    );
  }

  Widget _buildTableRow(PermissaoUsuario permissao) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(permissao.email)),
          Expanded(
            child: AppDropdown<String>(
              initialValue: permissao.permissao,
              items: _permissaoOptions.map((p) {
                return DropdownMenuItem(
                  value: p,
                  child: Text(_getPermissaoLabel(p)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  _atualizarPermissao(permissao, value);
                }
              },
              label: '',
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => _removerPermissao(permissao),
            icon: const Icon(Icons.delete_outline),
            color: Colors.grey.shade600,
            tooltip: 'Remover',
          ),
        ],
      ),
    );
  }
}
