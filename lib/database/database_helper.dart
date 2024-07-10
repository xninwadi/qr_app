// Helper class for managing SQLite database operations
import 'package:qr_app/models/favorite.dart';
import 'package:qr_app/models/myqrcode.dart';
import 'package:qr_app/models/scanhistory.dart';
import 'package:qr_app/models/user.dart';
import 'package:sqflite/sqflite.dart'; // Import sqflite package
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';// Import path package

class DatabaseHelper {
  static final DatabaseHelper _instance =
      DatabaseHelper._internal(); // Singleton instance
  factory DatabaseHelper() =>
      _instance; // Factory constructor to return the singleton instance

  static Database? _database; // Reference to the database instance

  DatabaseHelper._internal(); // Private constructor

  // Get the database instance
  Future<Database> get database async {
    if (_database != null)
      return _database!; // Return existing database instance if available

    _database =
        await _initDatabase(); // Initialize database if not already done
    return _database!; // Return initialized database instance
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'qrApp.db'); // Get database path
    print("Database path: $path"); // Debug: Print database path
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE users(id TEXT PRIMARY KEY, userName TEXT, displayName TEXT, password TEXT, email TEXT, phone TEXT);",
      );
      await db.execute(
        "CREATE TABLE qrcodes(id TEXT PRIMARY KEY, content TEXT, content_type TEXT, generate_date TEXT);",
      );
      await db.execute(
        "CREATE TABLE favorites(id TEXT PRIMARY KEY, user_id TEXT, qr_id TEXT);",
      );
      await db.execute(
        "CREATE TABLE histories(id TEXT PRIMARY KEY, user_id TEXT, qr_id TEXT, scan_date TEXT);", 
      );
    });
  }

  // start User
  Future<void> insertUser(User user) async {
    final db = await database;
    user.id = Uuid().v4();
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm:
          ConflictAlgorithm.replace, // Conflict resolution strategy
    );
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> tasks = await db.query('users');
    return tasks;
  }

  Future<Map<String, dynamic>?> checkLogin(String name, String password) async {
    final db = await database;
    final result = await db.query(
      "users",
      where: 'userName = ? AND password = ?',
      whereArgs: [name, password],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  // Delete a task from the database
  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  // end User

  // 
  Future<dynamic> insertQR(MyQRCode qr) async {
    final db = await database;
    await db.insert(
      'qrcodes',
      qr.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // Conflict resolution strategy
    );
  }

  Future<void> insertFavorite(Favorite fav) async {
    final db = await database;
    await db.insert(
      'favorites',
      fav.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // Conflict resolution strategy
    );
  }
  
  Future<void> insertHistory(History hty) async {
    final db = await database;
    await db.insert(
      'histories',
      hty.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // Conflict resolution strategy
    );
  }
}



//delete from users where id=3;
//update users set email='ee@gmail.com' where email='ee';