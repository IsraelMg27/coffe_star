import 'package:flutter/material.dart';
import 'package:coffe_star/services/product_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cafetería')),
      body: Center(child: Text('Bienvenido a la Cafetería')),
    );
  }
}
