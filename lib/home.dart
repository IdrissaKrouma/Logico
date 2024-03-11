import 'package:flutter/material.dart';
import 'package:logico/Database/database.dart';
import 'package:logico/Database/globals.dart';
import 'package:logico/widgetUtilitaires/autres/bottom_app.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseManager _dbManager = DatabaseManager();
  @override
  Widget build(BuildContext context) {
    int globalLevel = getGlobalLevel();
    // ignore: unused_local_variable
    int level;

    () async {
      final gameData = await _dbManager.loadGameData();
      level = gameData.level;
      //final newGameData = GameData(gameData.level + 1, gameData.score + 10);
      //await _dbManager.saveGameData(newGameData);
    };
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF0a0908),
          centerTitle: true,
          title: const Text(
            'LOGICO',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2667FF),
            ),
          ),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
                //0XFF365daf, 0XFF0a0908, 0XFF0a0908)
                //gradient: LinearGradient(colors:Color(value) ),
                color: Color(0XFF365daf)),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset('assets/background_2.png'),
                Positioned(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/Niveau$globalLevel");
                  },
                  child: const Text('JOUER',
                      style: TextStyle(fontSize: 50, color: Colors.black)),
                ))
              ],
            ),
          ),
        ),
        bottomSheet: const BottomApp());
  }
}
