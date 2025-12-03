import 'package:sqflite/sqflite.dart';
import 'package:workshops_flutter_4sim3/entities/Film.dart';

class Mydb {
  static Database? _db;
  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await openDatabase(
      'cart.db',
      version: 1,
      onCreate: (db, version) async {
        db.execute(''' CREATE TABLE cart
     (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     title TEXT ,
     description TEXT ,
     price REAL ,
     image TEXT
     
      )''');
      },
    );

    return _db!;
  }


  static Future<void> addItem(Film film) async{
    final db = await database;
    await db.insert('cart', {
      'title': film.title,
      'description': film.description,
      'price': film.price,
      'image': film.image,
    });
  }

  static Future<List<Map<String,dynamic>>> getItems() async{
    final db = await database;
    return db.query('cart');
  }

  static Future<void> removeItem(int id) async{
    final db = await database;
    db.delete('cart',where: 'id=?',whereArgs: [id]);
  }




}
