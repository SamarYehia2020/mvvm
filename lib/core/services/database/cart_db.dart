import 'package:mvvm_usamaa_app/constant.dart';
import 'package:mvvm_usamaa_app/models/cart_product_model.dart';
import 'package:mvvm_usamaa_app/models/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String databasePath = await getDatabasesPath(); //default path for db
    String path = join(databasePath, "cart.db");
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 6,
      onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    //called when we changed the num of version at openDatabase
    print("upgrade===================================>");
    // await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
    // await db.execute("ALTER TABLE notes ADD COLUMN title TEXT");
  }

  _onCreate(Database db, int version) async {
    //on create called one time at the creation of db so when making
    //any update we should use upgrade function
    //we can use Batch when we want to make more than one table and it can do more than one process and execute it one time

    Batch batch = db.batch();
    batch.execute(''' CREATE TABLE $tableCartProduct(
  $colProId TEXT,
  $colImg TEXT,
  $colName TEXT ,
  $colPrice TEXT,
  $colQuantity INTEGER)
''');
    await batch.commit();
    print("create===================================>");
  }

  getAllProduct() async {
    var databaseClient = await database;
    List<Map> fields = await databaseClient.query(tableCartProduct);
    List<CartProductModel> list = fields
        .map(
            (field) => CartProductModel.fromJson(field as Map<String, dynamic>))
        .toList();
    return list;
  }

  deleteData() async {
    var databaseClient = await database;
    int response = await databaseClient.delete(tableCartProduct);
    return response;
  }

  insert(CartProductModel cartProductModel) async {
    var databaseClient = await database;
    int g = await databaseClient.insert(
        tableCartProduct, cartProductModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateDb(CartProductModel cartProductModel) async {
    var databaseClient = await database;
    return await databaseClient.update(
        tableCartProduct, cartProductModel.toJson(),
        where: '$colProId=?', whereArgs: [cartProductModel.productId]);
  }
}
