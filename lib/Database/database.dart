import 'package:sembast_web/sembast_web.dart';
import 'package:sembast/sembast.dart';

class GameData {
  final int level;
  final int score;

  GameData(this.level, this.score);

  Map<String, dynamic> toMap() {
    return {
      'level': level,
      'score': score,
    };
  }

  // Méthode statique pour créer une instance GameData à partir d'un Map
  static GameData fromMap(Map<String, dynamic> map) {
    return GameData(
      map['level'],
      map['score'],
    );
  }
}

class DatabaseManager {
  final String _dbName = 'database.db';
  final DatabaseFactory _dbFactory = databaseFactoryWeb;

  Future<Database> _openDatabase() async {
    final db = await _dbFactory.openDatabase(_dbName);
    return db;
  }

  Future<void> saveGameData(GameData gameData) async {
    final db = await _openDatabase();
    final store = intMapStoreFactory.store('game_data');
    await store.record(1).put(db, gameData.toMap());
    await db.close();
  }

  Future<GameData> loadGameData() async {
    final db = await _openDatabase();
    final store = intMapStoreFactory.store('game_data');
    final record = await store.record(1).get(db);
    await db.close();
    if (record == null) {
      return GameData(1, 0); // Valeurs par défaut
    }
    return GameData.fromMap(record);
  }
}
