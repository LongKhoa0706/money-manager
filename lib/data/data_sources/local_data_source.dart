import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  factory LocalDataSource() {
    if (_instance == null) {
      _instance = LocalDataSource._internal();
    }

    return _instance;
  }

  LocalDataSource._internal();

  static LocalDataSource _instance;
  static Database _database;
  static const _databaseName = 'data.db';
  static const _databaseVersion = 1;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }

    return _database;
  }

  Future<Database> _initDatabase() async {
    var databasePath = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(
      databasePath,
      version: _databaseVersion,
      onConfigure: _onConfigureDatabase,
      onCreate: _onCreateDatabase,
      onUpgrade: _onUpgradeDatabase,
    );
  }

  void _onConfigureDatabase(Database db) async {
    // Add support for cascade delete.
    await db.execute('PRAGMA foreign_keys = ON');
  }

  void _onCreateDatabase(Database db, int version) async {
    // Create account table.
    await db.execute('''
    CREATE TABLE Account(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      description TEXT,
      balance REAL NOT NULL,
      icon INTEGER NOT NULL,
      created_date INTEGER NOT NULL
    )
    ''');

    // Create category table.
    await db.execute('''
    CREATE TABLE Category(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      type TEXT NOT NULL,
      icon INTEGER NOT NULL
    )
    ''');

    // Create transaction table.
    await db.execute('''
    CREATE TABLE Transactions(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      account_id INTEGER NOT NULL,
      category_id INTEGER NOT NULL,
      title TEXT NOT NULL,
      amount REAL NOT NULL,
      created_date INTEGER NOT NULL,
      updated_date INTEGER NOT NULL,
      FOREIGN KEY (account_id) REFERENCES Account(id) ON DELETE CASCADE,
      FOREIGN KEY (category_id) REFERENCES Category(id) ON DELETE CASCADE
    )
    ''');

    // Add first account.
    await db.insert('Account', <String, dynamic>{
      'id': null,
      'title': 'Wallet',
      'description': null,
      'balance': 23,
      'icon': Icons.person.codePoint,
      'created_date': DateTime.now().millisecondsSinceEpoch,
    });
  }

  void _onUpgradeDatabase(Database db, int oldVersion, int newVersion) {
    return;
  }
}
