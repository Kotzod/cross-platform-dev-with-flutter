class MenuItem {
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  bool isFavorite;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.isFavorite = false,
  });
}