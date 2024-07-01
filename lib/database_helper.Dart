import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    returnw _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'my_database.db');

    // Make sure the directory exists
    await Directory(databasesPath).create(recursive: true);

    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT)',
      );
    });
  }

  Future<int> insertUser(String name) async {
    final db = await database;
    return await db.insert('users', {'name': name});
  }

  Future<bool> userExists(String name) async {
    final db = await database;
    var result = await db.query('users', where: 'name = ?', whereArgs: [name]);
    return result.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('users');
  }
}