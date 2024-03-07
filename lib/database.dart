import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'dart:io';

class DatabaseHelper {
  DatabaseFactory dbFactory = databaseFactoryIo;
  final String dbName = 'my_database.db';
  final String storeName = 'my_store';
  Database _database = {} as Database;

  Future<Database> get database async {
    // ignore: unnecessary_null_comparison, prefer_conditional_assignment
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dbPath = {appDocDir.path, dbName} as String;
    return await dbFactory.openDatabase(dbPath);
  }

  Future<void> insertData(Map<String, dynamic> data) async {
    var store = intMapStoreFactory.store(storeName);
    await store.add(await database, data);
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    var store = intMapStoreFactory.store(storeName);
    var snapshot = await store.find(await database);
    return snapshot.map((record) {
      return record.value;
    }).toList();
  }

  // Autres méthodes pour effectuer des opérations CRUD
}
