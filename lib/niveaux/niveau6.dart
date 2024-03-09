// ignore: file_names
import 'package:flutter/material.dart';
import 'package:logico/Database/globals.dart';
import 'package:logico/menu.dart';
import 'package:logico/widgetUtilitaires/autres/actu_bar.dart';
import 'package:logico/widgetUtilitaires/autres/bottom_app.dart';
import 'package:logico/widgetUtilitaires/autres/reprendre.dart';
import 'package:logico/widgetUtilitaires/autres/suivant.dart';

// ignore: must_be_immutable
class Niveau6 extends StatefulWidget {
  const Niveau6({
    super.key,
  });

  @override
  State<Niveau6> createState() => _Niveau6State();
}

class _Niveau6State extends State<Niveau6> {
  bool interrupteurState = false;
  int chance = 3;

  @override
  Widget build(BuildContext context) {
    int level = 6;
    int globalLevel = getGlobalLevel();
    int score = level * 5;

    int validate = 0;

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
      body: Container(
        height: 700,
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
            width: 475,
            height: 650,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    child: Container(
                      alignment: Alignment.center,
                      width: 390,
                      child: Wrap(
                        children: [
                          //not
                          IconButton(
                            onPressed: () {
                              setState(() {
                                chance = chance - 1;
                              });
                              if (chance == 0) {
                                Reprendre(context, '/Niveau${level - 1}');
                              }
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
                                validate = validate + 1;
                              });
                              if (validate == 3) {
                                if (level == globalLevel) {
                                  setGlobalLevel(level + 1);
                                }
                                Suivant(context, '/Niveau${level + 1}');
                              } else if (chance == 0) {
                                Reprendre(context, '/Niveau${level - 1}');
                              }
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
                              if (chance == 0) {
                                Reprendre(context, '/Niveau${level - 1}');
                              }
                            },
                            icon: Image.asset(
                              'assets/images/portesLogiques/and.png',
                              width: 150,
                              height: 150,
                            ),
                          ),
                          // nor
                          IconButton(
                            onPressed: () {
                              setState(() {
                                chance = chance - 1;
                              });
                              if (chance == 0) {
                                Reprendre(context, '/Niveau${level - 1}');
                              }
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
                                validate = validate + 1;
                              });
                              if (validate == 3) {
                                if (level == globalLevel) {
                                  setGlobalLevel(level + 1);
                                }
                                Suivant(context, '/Niveau${level + 1}');
                              } else if (chance == 0) {
                                Reprendre(context, '/Niveau${level - 1}');
                              }
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
                                validate = validate + 1;
                              });
                              if (validate == 3) {
                                if (level == globalLevel) {
                                  setGlobalLevel(level + 1);
                                }
                                Suivant(context, '/Niveau${level + 1}');
                              } else if (chance == 0) {
                                Reprendre(context, '/Niveau${level - 1}');
                              }
                              Suivant(context, '/Niveau${level + 1}');
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
                  bottom: 50,
                  child: SizedBox(
                    width: 360,
                    child: Text(
                      "Selections les portes dont pour une entrée est vrai et l'autre est fausse la sortie est vrai",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomSheet: const BottomApp(),
    );
  }
}
