
import 'package:path/path.dart';
import 'package:shop_app/Data_Base/DB_Models/cart_model.dart';
import 'package:sqflite/sqflite.dart';
final String columnId = 'id';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnName = 'name';
final String cartTable = 'cart_table';

class Cart_Provider {
  Database? db;
  static final Cart_Provider instance = Cart_Provider._internal();

  factory Cart_Provider() {
    return instance;
  }
  Cart_Provider._internal();
  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'cart_List.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('''
          create table $cartTable (
          $columnId integer primary key autoincrement,
          $columnPrice real not null,
          $columnImage text not null,
          $columnName text not null
          )
          ''');
        });
  }

  Future<int> insertCart(Cart_Model cart) async {
    cart.id = await db!.insert('$cartTable', cart.toMap());
    return cart.id! ;
  }

  Future<int> deleteCart(int id) async {
    return await db!
        .delete('$cartTable', where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Cart_Model>> getAllCarts() async {
    List<Map<String, dynamic>> CartMaps = await db!.query('${cartTable}');
    if (CartMaps.isEmpty) {
      return [];
    } else {
      List<Cart_Model> carts = [];
      for (var cart in CartMaps) {
        carts.add(Cart_Model.fromMap(cart));
      }
      return carts;
    }
  }

  Future close() async => db!.close();
}