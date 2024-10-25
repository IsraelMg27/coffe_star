import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import '../models/product_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    var db = mongo.Db('mongodb://localhost:27017/app_coffee_star');
    await db.open();
    var cartCollection = db.collection('cart');

    List<Map<String, dynamic>> cartData = await cartCollection.find().toList();
    setState(() {
      cartItems = cartData.map((data) => Product.fromJson(data)).toList();
    });

    await db.close();
  }

  Future<void> _removeCartItem(mongo.ObjectId productId) async {
    var db = mongo.Db('mongodb://localhost:27017/app_coffee_star');
    await db.open();
    var cartCollection = db.collection('cart');

    await cartCollection.remove(mongo.where.eq('_id', productId));
    await db.close();

    _loadCartItems();
  }

  double _calculateTotalAmount() {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.coffee),
                  title: Text(cartItems[index].name),
                  subtitle: Text('Cantidad: 1'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('\$${cartItems[index].price.toStringAsFixed(2)}'),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _removeCartItem(cartItems[index].id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('\$${_calculateTotalAmount().toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Funcionalidad de pago no implementada.')),
                    );
                  },
                  child: const Text('Proceder al Pago'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
