import 'package:flutter/material.dart';
import 'package:sigmus/theme/app_colors.dart';

/// Configuração para uma coluna da tabela
class TableColumnConfig<T> {
  final String label;
  final String Function(T item) getValue;
  final double? width;
  final bool sortable;

  TableColumnConfig({
    required this.label,
    required this.getValue,
    this.width,
    this.sortable = false,
  });
}

/// Configuração para ações em linha da tabela
class TableRowAction<T> {
  final IconData icon;
  final String tooltip;
  final void Function(T item) onPressed;
  final Color? color;

  TableRowAction({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.color,
  });
}

/// Widget de menu popup para ações adicionais
class TableRowMenuAction<T> {
  final String label;
  final IconData? icon;
  final void Function(T item) onPressed;

  TableRowMenuAction({required this.label, this.icon, required this.onPressed});
}

/// DataTable genérico e reutilizável
class AppDataTable<T> extends StatefulWidget {
  final List<T> items;
  final List<TableColumnConfig<T>> columns;
  final List<TableRowAction<T>>? rowActions;
  final List<TableRowMenuAction<T>>? menuActions;
  final bool isLoading;
  final String? searchHint;
  final bool enableSearch;
  final String Function(T item)? getSearchText;
  final String emptyMessage;
  final String emptySearchMessage;
  final Widget? emptyIcon;
  final Widget? emptySearchIcon;
  final List<Widget>? actions;

  const AppDataTable({
    super.key,
    required this.items,
    required this.columns,
    this.rowActions,
    this.menuActions,
    this.isLoading = false,
    this.searchHint,
    this.enableSearch = true,
    this.getSearchText,
    this.emptyMessage = 'Nenhum item encontrado',
    this.emptySearchMessage = 'Nenhum resultado encontrado',
    this.emptyIcon,
    this.emptySearchIcon,
    this.actions,
  });

  @override
  State<AppDataTable<T>> createState() => _AppDataTableState<T>();
}

class _AppDataTableState<T> extends State<AppDataTable<T>> {
  final TextEditingController _searchController = TextEditingController();
  List<T> _filteredItems = [];
  int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(_filterItems);
  }

  @override
  void didUpdateWidget(AppDataTable<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _filterItems();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        _filteredItems = widget.items.where((item) {
          if (widget.getSearchText != null) {
            return widget.getSearchText!(item).toLowerCase().contains(query);
          }
          // Fallback: busca em todos os valores das colunas
          return widget.columns.any((column) {
            return column.getValue(item).toLowerCase().contains(query);
          });
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildToolbar(), const SizedBox(height: 16), _buildContent()],
    );
  }

  Widget _buildToolbar() {
    return Row(
      children: [
        // Barra de pesquisa
        if (widget.enableSearch)
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.foreground,
                ),
                decoration: InputDecoration(
                  hintText: widget.searchHint ?? 'Buscar...',
                  hintStyle: const TextStyle(
                    color: AppColors.mutedForeground,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 18,
                    color: AppColors.mutedForeground,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.close,
                            size: 16,
                            color: AppColors.mutedForeground,
                          ),
                          onPressed: () {
                            _searchController.clear();
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ),
        if (widget.enableSearch && widget.actions != null)
          const SizedBox(width: 12),
        // Ações customizadas (botões passados como parâmetro)
        if (widget.actions != null) ...widget.actions!,
      ],
    );
  }

  Widget _buildContent() {
    if (widget.isLoading) {
      return Container(
        padding: const EdgeInsets.all(48),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: const Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.foreground,
            ),
          ),
        ),
      );
    }

    if (_filteredItems.isEmpty) {
      return _buildEmptyState();
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Theme(
            data: Theme.of(context).copyWith(
              cardTheme: const CardThemeData(
                elevation: 0,
                margin: EdgeInsets.zero,
                color: Colors.transparent,
              ),
              dataTableTheme: DataTableThemeData(
                headingRowColor: WidgetStateProperty.all(AppColors.muted),
                dataRowColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return AppColors.accent;
                  }
                  return AppColors.card;
                }),
                headingTextStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mutedForeground,
                  letterSpacing: 0.02,
                ),
                dataTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.foreground,
                ),
                dividerThickness: 1,
              ),
              dividerColor: AppColors.border,
            ),
            child: PaginatedDataTable(
              header: null,
              rowsPerPage: _rowsPerPage,
              availableRowsPerPage: const [5, 10, 20, 50],
              onRowsPerPageChanged: (value) {
                setState(() {
                  _rowsPerPage = value ?? 10;
                });
              },
              columns: [
                ...widget.columns.map(
                  (column) =>
                      DataColumn(label: Text(column.label.toUpperCase())),
                ),
                if (widget.rowActions != null || widget.menuActions != null)
                  const DataColumn(label: SizedBox.shrink(), numeric: true),
              ],
              source: _DataTableSourceAdapter<T>(
                items: _filteredItems,
                columns: widget.columns,
                rowActions: widget.rowActions,
                menuActions: widget.menuActions,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    final isSearching = _searchController.text.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isSearching ? Icons.search_off_outlined : Icons.inbox_outlined,
                size: 24,
                color: AppColors.mutedForeground,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              isSearching
                  ? '${widget.emptySearchMessage} "${_searchController.text}"'
                  : widget.emptyMessage,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.foreground,
              ),
              textAlign: TextAlign.center,
            ),
            if (isSearching) ...[
              const SizedBox(height: 4),
              const Text(
                'Tente ajustar os termos da sua busca',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.foreground,
                  backgroundColor: AppColors.secondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _searchController.clear(),
                child: const Text(
                  'Limpar busca',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Adapter para conectar os dados ao PaginatedDataTable
class _DataTableSourceAdapter<T> extends DataTableSource {
  final List<T> items;
  final List<TableColumnConfig<T>> columns;
  final List<TableRowAction<T>>? rowActions;
  final List<TableRowMenuAction<T>>? menuActions;

  _DataTableSourceAdapter({
    required this.items,
    required this.columns,
    this.rowActions,
    this.menuActions,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= items.length) return null;
    final item = items[index];

    return DataRow(
      cells: [
        ...columns.map(
          (column) => DataCell(
            Text(
              column.getValue(item),
              style: const TextStyle(fontSize: 14, color: AppColors.foreground),
            ),
          ),
        ),
        if (rowActions != null || menuActions != null)
          DataCell(
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Ações inline
                if (rowActions != null)
                  ...rowActions!.map(
                    (action) => Container(
                      width: 32,
                      height: 32,
                      margin: const EdgeInsets.only(right: 4),
                      child: IconButton(
                        icon: Icon(action.icon, size: 16),
                        onPressed: () => action.onPressed(item),
                        tooltip: action.tooltip,
                        color: action.color ?? AppColors.mutedForeground,
                        hoverColor: AppColors.accent,
                        padding: EdgeInsets.zero,
                        splashRadius: 16,
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ),
                  ),
                // Menu de ações
                if (menuActions != null)
                  PopupMenuButton<int>(
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 18,
                      color: AppColors.mutedForeground,
                    ),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: AppColors.border),
                    ),
                    color: AppColors.popover,
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(0.1),
                    itemBuilder: (context) => menuActions!
                        .asMap()
                        .entries
                        .map(
                          (entry) => PopupMenuItem<int>(
                            value: entry.key,
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                if (entry.value.icon != null) ...[
                                  Icon(
                                    entry.value.icon,
                                    size: 16,
                                    color:
                                        entry.value.label
                                            .toLowerCase()
                                            .contains('apagar')
                                        ? AppColors.destructive
                                        : AppColors.foreground,
                                  ),
                                  const SizedBox(width: 8),
                                ],
                                Text(
                                  entry.value.label,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        entry.value.label
                                            .toLowerCase()
                                            .contains('apagar')
                                        ? AppColors.destructive
                                        : AppColors.foreground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onSelected: (index) {
                      menuActions![index].onPressed(item);
                    },
                  ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => items.length;

  @override
  int get selectedRowCount => 0;
}
