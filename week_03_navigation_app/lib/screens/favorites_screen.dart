import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_card.dart';
import 'item_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final List<MenuItem> menuItems;

  const FavoritesScreen({super.key, required this.menuItems});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<MenuItem> get favoriteItems {
    return widget.menuItems.where((item) => item.isFavorite).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: favoriteItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start adding items to your favorites!',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return MenuItemCard(
                  menuItem: item,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailScreen(menuItem: item),
                      ),
                    );
                    setState(() {});
                  },
                  onFavoriteToggle: () {
                    setState(() {
                      item.isFavorite = !item.isFavorite;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} removed from favorites'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}