import 'package:flutter/material.dart';

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
      children: [
        _buildToolbar(),
        const SizedBox(height: 16),
        Row(
          children: [Expanded(child: Card(child: _buildContent()))],
        ),
      ],
    );
  }

  Widget _buildToolbar() {
    return Row(
      children: [
        // Barra de pesquisa
        if (widget.enableSearch)
          Expanded(
            child: SizedBox(
              height: 36,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: widget.searchHint ?? 'Buscar...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),
        if (widget.enableSearch && widget.actions != null)
          const SizedBox(width: 8),
        // Ações customizadas (botões passados como parâmetro)
        if (widget.actions != null) ...widget.actions!,
      ],
    );
  }

  Widget _buildContent() {
    if (widget.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_filteredItems.isEmpty) {
      return _buildEmptyState();
    }

    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: CardThemeData(
          elevation: 0,
          margin: EdgeInsets.zero,
          color: Colors.transparent,
        ),
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
            (column) => DataColumn(label: Text(column.label)),
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
    );
  }

  Widget _buildEmptyState() {
    final isSearching = _searchController.text.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          if (isSearching && widget.emptySearchIcon != null)
            widget.emptySearchIcon!
          else if (!isSearching && widget.emptyIcon != null)
            widget.emptyIcon!
          else
            Icon(
              isSearching ? Icons.search_off : Icons.inbox_outlined,
              size: 48,
              color: Colors.grey.shade400,
            ),
          const SizedBox(height: 16),
          Text(
            isSearching
                ? '${widget.emptySearchMessage} "${_searchController.text}"'
                : widget.emptyMessage,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          if (isSearching) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => _searchController.clear(),
              child: const Text('Limpar busca'),
            ),
          ],
        ],
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
        ...columns.map((column) => DataCell(Text(column.getValue(item)))),
        if (rowActions != null || menuActions != null)
          DataCell(
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Ações inline
                if (rowActions != null)
                  ...rowActions!.map(
                    (action) => IconButton(
                      icon: Icon(action.icon, size: 20),
                      onPressed: () => action.onPressed(item),
                      tooltip: action.tooltip,
                      color: action.color,
                    ),
                  ),
                // Menu de ações
                if (menuActions != null)
                  PopupMenuButton<int>(
                    itemBuilder: (context) => menuActions!
                        .asMap()
                        .entries
                        .map(
                          (entry) => PopupMenuItem<int>(
                            value: entry.key,
                            child: Row(
                              children: [
                                if (entry.value.icon != null) ...[
                                  Icon(entry.value.icon, size: 18),
                                  const SizedBox(width: 8),
                                ],
                                Text(entry.value.label),
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
