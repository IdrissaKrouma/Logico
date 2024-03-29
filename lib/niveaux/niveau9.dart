// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:logico/Database/database.dart';
import 'package:logico/menu.dart';
import 'package:logico/widgetUtilitaires/autres/actu_bar.dart';
import 'package:logico/widgetUtilitaires/autres/bottom_app.dart';
import 'package:logico/widgetUtilitaires/autres/reprendre.dart';
import 'package:logico/widgetUtilitaires/autres/suivant.dart';

// ignore: must_be_immutable
class Niveau9 extends StatefulWidget {
  const Niveau9({
    super.key,
  });

  @override
  State<Niveau9> createState() => _Niveau9State();
}

class _Niveau9State extends State<Niveau9> {
  bool interrupteurState = false;
  int chance = 1;

  final DatabaseManager _dbManager = DatabaseManager();
  late int globalLevel = 0;
  late int score = 0;

  @override
  Widget build(BuildContext context) {
    int level = 9;
    //int globalLevel = getGlobalLevel();
    //int score = level * 5;

    void get() async {
      final gameData = await _dbManager.loadGameData();
      setState(() {
        globalLevel = gameData.level;
        score = gameData.score;
      });
    }

    get();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Menu',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Menu()));
            },
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF2667FF),
            ),
          ),
        ],
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
          width: 390,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 2.5, color: Color(0xFF2667FF)),
            ),
          ),
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            ActuBar(level: level, score: score, chance: chance),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              height: 650,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                      top: 10,
                      child: Container(
                        alignment: Alignment.center,
                        width: 475,
                        child: Wrap(
                          children: [
                            //not
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  chance = chance - 1;
                                });
                                Reprendre(context, '/Niveau${level - 1}');
                              },
                              icon: Image.asset(
                                'assets/images/portesLogiques/not.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            //or
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  chance = chance - 1;
                                });
                                Reprendre(context, '/Niveau${level - 1}');
                              },
                              icon: Image.asset(
                                'assets/images/portesLogiques/or.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            // and
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  chance = chance - 1;
                                });
                                Reprendre(context, '/Niveau${level - 1}');
                              },
                              icon: Image.asset(
                                'assets/images/portesLogiques/and.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            // nor
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  chance = chance - 1;
                                });
                                if (level == globalLevel) {
                                  final newGameData =
                                      GameData(globalLevel + 1, score + 10);
                                  await _dbManager.saveGameData(newGameData);
                                }
                                Suivant(context, '/Niveau${level + 1}');
                              },
                              icon: Image.asset(
                                'assets/images/portesLogiques/nor.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            //nand
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  chance = chance - 1;
                                });
                                Reprendre(context, '/Niveau${level - 1}');
                              },
                              icon: Image.asset(
                                'assets/images/portesLogiques/nand.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            //xor
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  chance = chance - 1;
                                });
                                Reprendre(context, '/Niveau${level - 1}');
                              },
                              icon: Image.asset(
                                'assets/images/portesLogiques/xor.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                          ],
                        ),
                      )),
                  const Positioned(
                    bottom: 40,
                    child: Text(
                      'Selection le Nor',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ]),
        ),
      ),
      bottomSheet: const BottomApp(),
    );
  }
}
