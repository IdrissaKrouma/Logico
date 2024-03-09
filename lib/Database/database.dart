import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseManager {
  // Déclaration d'une base de données et d'un store
  late Database _database;
  final StoreRef<int, Map<String, dynamic>> _store =
      intMapStoreFactory.store("my_store");

  // Initialisation de la base de données
  Future<void> initDatabase() async {
    // ignore: unnecessary_null_comparison
    if (_database == null) {
      Directory appDocumentDir = await getApplicationDocumentsDirectory();
      String dbPath = join(appDocumentDir.path, 'my_database.db');
      DatabaseFactory dbFactory = databaseFactoryIo;

      _database = await dbFactory.openDatabase(dbPath);
    }
  }

  // Fonction pour insérer des données
  Future<void> insertData(
      Map<String, dynamic> data, int level, int score) async {
    await _store.add(_database, {'level': level, 'score': score});
  }

  // Fonction pour récupérer toutes les données
  Future<List<int>> getLevels() async {
    final recordSnapshots = await _store.find(_database);
    List<int> levels = [];
    for (final snapshot in recordSnapshots) {
      levels.add(snapshot.value['level']);
    }
    return levels;
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    final recordSnapshots = await _store.find(_database);
    return recordSnapshots.map((snapshot) => snapshot.value).toList();
  }
}
