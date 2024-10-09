import 'package:flutter/material.dart';

class EntityList<T> extends StatefulWidget {
  final List<T> items;
  final TextEditingController searchController;
  final String Function(T) getName;
  final void Function(T) onItemTap;

  const EntityList({
    super.key,
    required this.items,
    required this.searchController,
    required this.getName,
    required this.onItemTap,
  });

  @override
  State<EntityList<T>> createState() => _EntityListState<T>();
}

class _EntityListState<T> extends State<EntityList<T>> {
  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 0),
        ...widget.items
            .where((item) => widget
                .getName(item)
                .toLowerCase()
                .contains(widget.searchController.text.toLowerCase()))
            .map(
              (item) => Column(
                children: [
                  ListTile(
                    title: Text(widget.getName(item)),
                    onTap: () => widget.onItemTap(item),
                  ),
                  const Divider(height: 0),
                ],
              ),
            )
      ],
    );
  }
}
