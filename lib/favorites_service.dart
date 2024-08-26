import 'package:flutter/material.dart';

class FavoritesService {
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void addFavorite(Map<String, dynamic> product) {
    if (!_favorites.any((p) => p['id'] == product['id'])) {
      _favorites.add(product);
    }
  }

  void removeFavorite(int productId) {
    _favorites.removeWhere((p) => p['id'] == productId);
  }
}
