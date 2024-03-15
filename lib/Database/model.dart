import 'package:flutter/material.dart';
import 'package:logico/Database/database.dart';

Future<int> getLevel(BuildContext context, DatabaseManager dbManager) async {
  final gameData = await dbManager.loadGameData();
  return gameData.level;
}
