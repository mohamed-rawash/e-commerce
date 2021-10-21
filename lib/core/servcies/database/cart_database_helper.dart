import 'package:e_commerce/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constance.dart';

class CartDatabaseHelper{

  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            '''
            CREATE TABLE $tableCartProduct (
            $columnName TEXT,
            $columnImage TEXT,
            $columnQuantity INTEGER,
            $columnPrice TEXT,
            $columnProductId TEXT
            )
            '''
        );
      }
    );
  }

  insert(CartProductModel model) async {
    Database dbClient = await database;
    await dbClient.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  updateProduct(CartProductModel model) async {
    Database dbClient = await database;
    return await dbClient.update(
      tableCartProduct,
        model.toJson(),
      where: '$columnProductId = ?',
      whereArgs: [model.productId]
    );
  }

  Future<List<CartProductModel>> getAllProduct() async {
    Database dbClient = await database;
    List<Map<String, dynamic>> json = await dbClient.query(tableCartProduct);
    List<CartProductModel> cartProducts = json.isNotEmpty
        ?json.map((element) => CartProductModel.fromJson(element)).toList():[];
    return cartProducts;
  }

}
