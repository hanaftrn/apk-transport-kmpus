import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_routes.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rute Favorit'),
      ),
      body: Consumer<FavoriteRoutes>(
        builder: (context, favoriteRoutes, child) {
          return ListView.builder(
            itemCount: favoriteRoutes.favorites.length,
            itemBuilder: (context, index) {
              final route = favoriteRoutes.favorites[index];
              return Card(
                child: ListTile(
                  title: Text(route['route'] ?? ''),
                  subtitle: Text(route['type'] ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      favoriteRoutes.removeFavorite(route);
                    },
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
