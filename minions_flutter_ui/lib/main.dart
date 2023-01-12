import 'package:flutter/material.dart';
import 'package:minions_flutter_ui/Models/Pages/charakter_listing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.white),
        ),
        home: const CharakterListingScreen());
  }
}
