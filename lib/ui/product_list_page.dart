import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Capuchino',
        'description': 'Un delicioso café capuchino con leche espumosa.',
        'price': 60.0,
        'image': 'assets/capuchino.jpg'
      },
      {
        'name': 'Expreso',
        'description': 'Café puro y fuerte para los amantes del sabor intenso.',
        'price': 75.0,
        'image': 'assets/expreso.jpg'
      },
      {
        'name': 'Latte',
        'description': 'Café suave con leche cremoso y delicioso.',
        'price': 70.0,
        'image': 'assets/latte.jpg'
      },
      {
        'name': 'Frapé',
        'description': 'Café frío mezclado con hielo y crema.',
        'price': 65.0,
        'image': 'assets/frape.jpg'
      },
      {
        'name': 'Americano',
        'description': 'Un clásico café americano, perfecto para cualquier momento del día.',
        'price': 50.0,
        'image': 'assets/americano.jpg'
      },
      {
        'name': 'Con Caramelo',
        'description': 'Café con caramelo y leche espumosa.',
        'price': 80.0,
        'image': 'assets/con_caramelo.jpg'
      },
      {
        'name': 'Café Helado',
        'description': 'Una deliciosa bebida refrescante de café frío.',
        'price': 70.0,
        'image': 'assets/cafe_helado.jpg'
      },
      {
        'name': 'Café Mocha',
        'description': 'Café con chocolate y leche espumosa.',
        'price': 85.0,
        'image': 'assets/cafe_mocha.jpg'
      },
      {
        'name': 'Irlandés',
        'description': 'Café con un toque de crema irlandesa.',
        'price': 90.0,
        'image': 'assets/irlandes.jpg'
      },
      {
        'name': 'Descafeinado',
        'description': 'Café sin cafeína, ideal para cualquier hora del día.',
        'price': 50.0,
        'image': 'assets/descafeinado.jpg'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Selecciona tu café')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(product['image'] as String),
              title: Text(product['name'] as String),
              subtitle: Text(product['description'] as String),
              trailing: Text('\$${product['price']}'),
              onTap: () {
                // TODO: Navegar a la página de detalles del producto.
              },
            ),
          );
        },
      ),
    );
  }
}
