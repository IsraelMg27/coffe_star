import 'package:flutter/material.dart';
import 'package:coffe_star/ui/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafetería App',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: LoginPage(), // Página de inicio
    );
  }
}