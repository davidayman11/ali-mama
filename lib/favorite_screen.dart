import 'package:ali_mama/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'favorites_service.dart'; // Import the FavoritesService

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesService().favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? Center(child: Text('No favorites yet.'))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final product = favorites[index];
          return ListTile(
            title: Text(product['title'] ?? 'No title'),
            subtitle: Text('Price: \$${product['price'] ?? 'No price'}'),
            leading: Image.network(product['thumbnail'] ?? '', width: 50, height: 50),
            onTap: () {
              // Navigate to ProductDetailsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    productId: product['id'], // Pass the product ID
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
