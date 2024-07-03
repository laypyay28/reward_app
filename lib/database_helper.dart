import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  String usersTable = 'users';
  String reviewsTable = 'reviews';

  String colId = 'id';
  String colEmail = 'email';
  String colPassword = 'password';
  
  String colName = 'name';
  String colReview = 'review';
  String colRating = 'rating';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    final dbDir = await getDatabasesPath();
    final dbPath = join(dbDir, 'app.db');

    print('Database path: $dbPath'); // Log the database path

    final appDb = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDb,
    );
    return appDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $usersTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colEmail TEXT UNIQUE, $colPassword TEXT)',
    );
    await db.execute(
      'CREATE TABLE $reviewsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colReview TEXT, $colRating REAL)',
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database? db = await this.db;
    final int result = await db!.insert(usersTable, user);
    return result;
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(
      usersTable,
      where: '$colEmail = ? AND $colPassword = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<int> insertReview(Map<String, dynamic> review) async {
    Database? db = await this.db;
    final int result = await db!.insert(reviewsTable, review);
    return result;
  }

  Future<List<Map<String, dynamic>>> getAllReviews() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(reviewsTable);
    return result;
  }
}
