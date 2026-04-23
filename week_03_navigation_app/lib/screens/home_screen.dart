import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'favorites_screen.dart';
import '../models/menu_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sample menu data
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Margherita Pizza',
      description: 'Classic pizza with tomato, mozzarella, and basil',
      price: 12.99,
      category: 'Main Course',
      imageUrl: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400',
    ),
    MenuItem(
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with Caesar dressing and croutons',
      price: 8.99,
      category: 'Appetizer',
      imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400',
    ),
    MenuItem(
      name: 'Grilled Salmon',
      description: 'Fresh salmon with herbs and lemon',
      price: 18.99,
      category: 'Main Course',
      imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400',
    ),
    MenuItem(
      name: 'Chocolate Cake',
      description: 'Rich chocolate cake with ganache',
      price: 6.99,
      category: 'Dessert',
      imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400',
    ),
    MenuItem(
      name: 'Pasta Carbonara',
      description: 'Creamy pasta with bacon and parmesan',
      price: 14.99,
      category: 'Main Course',
      imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=400',
    ),
    MenuItem(
      name: 'Tiramisu',
      description: 'Classic Italian dessert with coffee and mascarpone',
      price: 7.99,
      category: 'Dessert',
      imageUrl: 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Restaurant'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.restaurant,
                    size: 48,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Restaurant Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.restaurant_menu),
              title: const Text('Menu'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuScreen(menuItems: menuItems),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(menuItems: menuItems),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings coming soon!')),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant,
                size: 120,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'Welcome to Our Restaurant',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Explore our delicious menu and find your favorite dishes',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuScreen(menuItems: menuItems),
                    ),
                  );
                },
                icon: const Icon(Icons.restaurant_menu),
                label: const Text('View Menu'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}