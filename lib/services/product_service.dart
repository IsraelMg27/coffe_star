import 'package:mongo_dart/mongo_dart.dart';
import 'package:coffe_star/models/product_model.dart';

class ProductService {
  static Future<List<Product>> getAllProducts() async {
    var db = Db('mongodb://tu-conexion-a-mongodb');
    await db.open();
    var productsCollection = db.collection('products');

    List<Map<String, dynamic>> productsData = await productsCollection.find().toList();
    await db.close();

    return productsData.map((data) => Product.fromJson(data)).toList();
  }

  static Future<bool> addProduct(Product product) async {
    var db = Db('mongodb://tu-conexion-a-mongodb');
    await db.open();
    var productsCollection = db.collection('products');

    await productsCollection.insertOne(product.toJson());
    await db.close();
    return true;
  }
}
