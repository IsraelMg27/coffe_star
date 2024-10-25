import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, usersCollection, productsCollection, ordersCollection, reviewsCollection;

  static connect() async {
    db = await Db.create("mongodb://localhost:27017/app_coffe_star");
    await db.open();
    usersCollection = db.collection("users");
    productsCollection = db.collection("products");
    ordersCollection = db.collection("orders");
    reviewsCollection = db.collection("reviews");
    print("Conexión exitosa a MongoDB");
  }
}
