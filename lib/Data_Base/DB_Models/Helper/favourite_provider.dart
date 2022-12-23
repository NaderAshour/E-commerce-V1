import 'package:path/path.dart';
import 'package:shop_app/Data_Base/DB_Models/favourite_model.dart';
import 'package:sqflite/sqflite.dart';

final String columnId = 'id';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnName = 'name';
final String favourite_Table = 'fav_table';
class Favourite_Provider {
   Database? db;
  static final Favourite_Provider instance = Favourite_Provider._internal();

  factory Favourite_Provider() {
    return instance;
  }
  Favourite_Provider._internal();
  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'fav_table.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('''
          create table $favourite_Table (
          $columnId integer primary key autoincrement,
          $columnPrice real not null,
          $columnImage text not null,
          $columnName text not null
          )
          ''');
        });
  }

  Future<int> insertFev(Favourite_Model favourite) async {
    favourite.id = await db!.insert('$favourite_Table', favourite.toMap());
    return favourite.id! ;
  }

  Future<int> deleteFev(int id) async {
    return await db!
        .delete('$favourite_Table', where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Favourite_Model>> getAllFav() async {
    List<Map<String, dynamic>> FavMaps = await db!.query('$favourite_Table');
    if (FavMaps.isEmpty) {
      return [];
    } else {
      List<Favourite_Model> f_products = [];
      for (var element in FavMaps) {
        f_products.add(Favourite_Model.fromMap(element));
      }
      return f_products;
    }
  }

  Future close() async => db!.close();
}
