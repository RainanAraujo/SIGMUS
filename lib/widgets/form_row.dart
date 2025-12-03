import 'package:flutter/material.dart';

/// Componente de linha de formulário que automaticamente:
/// - Envolve cada child em Expanded
/// - Adiciona espaçamento padrão entre os children
/// - Alinha todos os children ao início (topo)
/// - Suporta um widget de sufixo opcional (não expandido)
class FormRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final CrossAxisAlignment crossAxisAlignment;

  /// Widget opcional que será adicionado ao final da row sem ser expandido
  /// Útil para botões de ação como "Adicionar"
  final Widget? suffix;

  const FormRow({
    super.key,
    required this.children,
    this.spacing = 16,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> expandedChildren = [];

    for (int i = 0; i < children.length; i++) {
      expandedChildren.add(Expanded(child: children[i]));

      // Adiciona espaçamento entre os children (exceto após o último)
      if (i < children.length - 1) {
        expandedChildren.add(SizedBox(width: spacing));
      }
    }

    // Adiciona o sufixo se existir
    if (suffix != null) {
      expandedChildren.add(SizedBox(width: spacing / 2));
      expandedChildren.add(suffix!);
    }

    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: expandedChildren,
    );
  }
}
