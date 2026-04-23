import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_card.dart';
import 'item_detail_screen.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuItem> menuItems;

  const MenuScreen({super.key, required this.menuItems});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String selectedCategory = 'All';

  List<String> get categories {
    final cats = widget.menuItems.map((item) => item.category).toSet().toList();
    return ['All', ...cats];
  }

  List<MenuItem> get filteredItems {
    if (selectedCategory == 'All') {
      return widget.menuItems;
    }
    return widget.menuItems
        .where((item) => item.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Category filter
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Menu items list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return MenuItemCard(
                  menuItem: item,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailScreen(menuItem: item),
                      ),
                    );
                    setState(() {}); // Refresh to show favorite changes
                  },
                  onFavoriteToggle: () {
                    setState(() {
                      item.isFavorite = !item.isFavorite;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          item.isFavorite
                              ? '${item.name} added to favorites'
                              : '${item.name} removed from favorites',
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}