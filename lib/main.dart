import 'package:flutter/material.dart';
import 'package:store_app/Screens/home_page.dart';
import 'package:store_app/Screens/update_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id : (context) => HomePage(),
        UpdatePage.id : (context) => UpdatePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}