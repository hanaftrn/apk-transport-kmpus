import 'package:flutter/material.dart';

class FavoriteRoutes with ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  void addFavorite(Map<String, String> route) {
    if (!_favorites.contains(route)) {
      _favorites.add(route);
      notifyListeners();
    }
  }

  void removeFavorite(Map<String, String> route) {
    if (_favorites.contains(route)) {
      _favorites.remove(route);
      notifyListeners();
    }
  }
}
