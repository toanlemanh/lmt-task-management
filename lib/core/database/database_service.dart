// Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

import 'database_configuration.dart';


class DatabaseService{
  static final DatabaseService _service = DatabaseService._internal();

  //private named constructor
  DatabaseService._internal();

  //public factory always return service
  factory DatabaseService() => _service;

  Database? _database;

  Future<Database> openConnectionToDb() async {
    WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
    return _database ?? openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
        version: 1,
        join(await getDatabasesPath(), databaseConfiguration['database_name']),
        onCreate: (db, version) async {
          //first time create database => run init sql
          final sql = await rootBundle.loadString('assets/db/init.sql');
          final batch = db.batch();
          for (var query in sql.split(';')) {
            final trimmedQuery = query.trim();
            if (trimmedQuery.isNotEmpty) {
              batch.execute(trimmedQuery);
            }
          }
          var result = await batch.commit(noResult: true);
          debugPrint('Init Result $result');
        }
    );
  }

  Future<void> closeConnection() async {
    await _database?.close();
    _database = null;
  }
}

