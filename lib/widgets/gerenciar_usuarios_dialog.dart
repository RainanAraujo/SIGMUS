import 'package:flutter/material.dart';
import 'package:sigmus/generated/sigmus_api.models.swagger.dart';
import 'package:sigmus/services/sigmus_api.dart';
import 'package:sigmus/widgets/app_alert.dart';
import 'package:sigmus/widgets/app_data_table.dart';
import 'package:sigmus/widgets/app_dialog.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart' as api;
import 'package:sigmus/widgets/app_toast.dart';

class GerenciarUsuariosDialog extends StatefulWidget {
  const GerenciarUsuariosDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const GerenciarUsuariosDialog(),
    );
  }

  @override
  State<GerenciarUsuariosDialog> createState() =>
      _GerenciarUsuariosDialogState();
}

class _GerenciarUsuariosDialogState extends State<GerenciarUsuariosDialog> {
  List<SafeUsuario> _usuarios = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsuarios();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadUsuarios() async {
    setState(() => _isLoading = true);
    try {
      final response = await sigmusApi.getUsuarios();
      if (response.isSuccessful && response.body != null) {
        setState(() {
          _usuarios = response.body!;
          _isLoading = false;
        });
      } else {
        throw Exception('Erro ao carregar usuários');
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        AppToast.error(context, message: 'Erro ao carregar usuários: $e');
      }
    }
  }

  Future<void> _deleteUsuario(SafeUsuario usuario) async {
    await showDialog<bool>(
      context: context,
      builder: (context) => AppAlert(
        title: "Confirmar Exclusão",
        message: "Tem certeza que deseja excluir o usuário '${usuario.nome}'?",
        confirmText: 'Excluir',
        cancelText: 'Cancelar',
        onConfirm: () async {
          try {
            await sigmusApi.deleteUsuario(id: usuario.id);
            if (mounted) {
              AppToast.success(
                context,
                message: 'Usuário excluído com sucesso',
              );
            }
            _loadUsuarios();
          } catch (e) {
            if (mounted) {
              AppToast.error(context, message: 'Erro ao excluir usuário: $e');
            }
          }
        },
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  void _showUsuarioFormDialog({SafeUsuario? usuario}) {
    final isEditing = usuario != null;
    final formKey = GlobalKey<FormState>();
    final nomeController = TextEditingController(text: usuario?.nome ?? '');
    final emailController = TextEditingController(text: usuario?.email ?? '');
    final senhaController = TextEditingController();
    final confirmarSenhaController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: isEditing ? 'Editar Usuário' : 'Adicionar Usuário',
        description: isEditing
            ? 'Edite as informações do usuário.'
            : 'Preencha as informações para criar um novo usuário.',
        maxWidth: 500,
        actions: [
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  await sigmusApi.postRegistrar(
                    body: api.PostRegistarReq(
                      nome: nomeController.text.trim(),
                      email: emailController.text.trim(),
                      senha: senhaController.text,
                    ),
                  );
                  if (mounted) {
                    AppToast.success(
                      context,
                      message: isEditing
                          ? 'Usuário atualizado com sucesso'
                          : 'Usuário criado com sucesso',
                    );
                  }
                  _loadUsuarios();
                } catch (e) {
                  if (mounted) {
                    AppToast.error(
                      context,
                      message:
                          'Erro ao ${isEditing ? 'atualizar' : 'criar'} usuário: $e',
                    );
                  }
                }
                Navigator.of(dialogContext).pop();
              }
            },
            child: const Text('Salvar'),
          ),
        ],
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite o Nome',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome é obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite o Email',
                ),
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
              const SizedBox(height: 16),
              TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: isEditing ? 'Nova Senha' : 'Senha',
                  hintText: 'Digite sua senha',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Senha é obrigatória';
                  }
                  if (value.length < 6) {
                    return 'Senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: confirmarSenhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                  hintText: 'Confirme sua senha',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirmação de senha é obrigatória';
                  }
                  if (value != senhaController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'Gerenciar Usuários',
      description: 'Adicione ou remova usuários do sistema.',
      maxWidth: 700,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Concluir'),
        ),
      ],
      child: AppDataTable<SafeUsuario>(
        items: _usuarios,
        isLoading: _isLoading,
        searchHint: 'Filtrar',
        emptyMessage: 'Nenhum usuário encontrado',
        getSearchText: (usuario) => '${usuario.nome} ${usuario.email}',
        menuActions: null,
        columns: [
          TableColumnConfig(label: 'Nome', getValue: (usuario) => usuario.nome),
          TableColumnConfig(
            label: 'Email',
            getValue: (usuario) => usuario.email,
          ),
        ],
        rowActions: (usuario) => [
          TableRowAction(
            icon: Icons.edit_outlined,
            tooltip: 'Editar',
            onPressed: (u) => _showUsuarioFormDialog(usuario: u),
          ),
          TableRowAction(
            icon: Icons.delete_outline,
            tooltip: 'Excluir',
            onPressed: (u) => _deleteUsuario(u),
          ),
        ],
        actions: [
          OutlinedButton.icon(
            onPressed: _loadUsuarios,
            icon: const Icon(Icons.refresh, size: 16),
            label: const Text('Atualizar'),
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: () => _showUsuarioFormDialog(),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Criar Usuário'),
          ),
        ],
      ),
    );
  }
}
