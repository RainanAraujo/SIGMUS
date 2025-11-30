import 'package:flutter/material.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/theme/app_typography.dart';

class MutiraoCirurgiaPage extends StatefulWidget {
  final int mutiraoId;

  const MutiraoCirurgiaPage({super.key, required this.mutiraoId});

  @override
  State<MutiraoCirurgiaPage> createState() => _MutiraoCirurgiaPageState();
}

class _MutiraoCirurgiaPageState extends State<MutiraoCirurgiaPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => isLoading = true);

    // TODO: Carregar dados do mutirão
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Voltar',
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mutirão de Cirurgia',
                  style: AppTypography.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${widget.mutiraoId}',
                  style: AppTypography.textTheme.bodySmall?.copyWith(
                    color: AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton.icon(
            onPressed: _loadData,
            icon: const Icon(Icons.sync, size: 16),
            label: const Text('Atualizar'),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: Implementar conteúdo da página
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.medical_services_outlined,
                  size: 64,
                  color: AppColors.mutedForeground,
                ),
                const SizedBox(height: 16),
                Text(
                  'Página de Mutirão de Cirurgia',
                  style: AppTypography.textTheme.titleLarge?.copyWith(
                    color: AppColors.mutedForeground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Em desenvolvimento...',
                  style: AppTypography.textTheme.bodyMedium?.copyWith(
                    color: AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
