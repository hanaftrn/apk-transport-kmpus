import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'bus_page.dart';
import 'van_page.dart';
import 'sepeda_page.dart';
import 'favorite_routes.dart';
import 'favorite_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteRoutes()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Transportasi Kampus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/bus': (context) => BusPage(),
        '/van': (context) => VanPage(),
        '/sepeda': (context) => SepedaPage(),
        '/favorites': (context) => FavoritePage(),
      },
    );
  }
}
