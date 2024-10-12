import 'package:mongo_dart/mongo_dart.dart';

class AuthService {
  static Future<bool> register(String email, String password) async {
    var db = Db('mongodb://tu-conexion-a-mongodb');
    await db.open();
    var usersCollection = db.collection('users');

    var existingUser = await usersCollection.findOne({'email': email});
    if (existingUser != null) {
      return false; // El usuario ya existe
    }

    await usersCollection.insertOne({'email': email, 'password': password});
    await db.close();
    return true;
  }

  static Future<bool> login(String email, String password) async {
    var db = Db('mongodb://tu-conexion-a-mongodb');
    await db.open();
    var usersCollection = db.collection('users');

    var user = await usersCollection.findOne({'email': email, 'password': password});
    await db.close();
    return user != null;
  }
}
