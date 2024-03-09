import 'package:flutter/material.dart';
import 'package:logico/Database/globals.dart';
import 'package:logico/menu.dart';
import 'package:logico/widgetUtilitaires/autres/actu_bar.dart';
import 'package:logico/widgetUtilitaires/autres/bottom_app.dart';
import 'package:logico/widgetUtilitaires/autres/reprendre.dart';
import 'package:logico/widgetUtilitaires/autres/suivant.dart';
import 'package:logico/widgetUtilitaires/autres/bouton.dart';
import 'package:logico/widgetUtilitaires/autres/lampe.dart';
import 'package:logico/widgetUtilitaires/autres/lien_horizontal.dart';
import 'package:logico/widgetUtilitaires/autres/lien_vertical.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/and.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/not.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/or.dart';

// ignore: must_be_immutable
class Niveau3 extends StatefulWidget {
  const Niveau3({super.key});

  @override
  State<Niveau3> createState() => _Niveau3State();
}

class _Niveau3State extends State<Niveau3> {
  bool stateBouton1 = false;
  bool stateBouton2 = false;
  bool stateBouton3 = false;
  int chance = 1;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    NotController notController = NotController(
      input: stateBouton2,
    );
    OrController orController = OrController(
      inputRight: notController.output(),
      inputLeft: stateBouton1,
    );
    AndController andController = AndController(
      inputRight: stateBouton3,
      inputLeft: notController.output(),
    );

    int level = 3;
    int globalLevel = getGlobalLevel();
    int score = level * 5;

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
            height: 10,
          ),
          ActuBar(level: level, score: score, chance: chance),
          Container(
            margin: const EdgeInsets.all(15),
            width: 390,
            height: 650,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                //Lampe left
                Positioned(
                    top: 50,
                    left: 100,
                    child: Lampe(lampeState: orController.ouput())),
                //Lampe right
                Positioned(
                    top: 50,
                    right: 100,
                    child: Lampe(lampeState: andController.ouput())),
                // OR
                Positioned(
                    top: 190, left: 65, child: Or(controller: orController)),
                // AND
                Positioned(
                    top: 190, right: 65, child: And(controller: andController)),
                // nor
                Positioned(top: 370, child: Not(controller: notController)),
                // OUTPUT or L1
                Positioned(
                  top: 105,
                  left: 125,
                  child: LienVertical(
                    height: 120,
                    lienState: orController.ouput(),
                  ),
                ),
                // OUTPUT and L2
                Positioned(
                  top: 105,
                  right: 125,
                  child: LienVertical(
                    height: 120,
                    lienState: andController.ouput(),
                  ),
                ),
                // left input or L3
                Positioned(
                  top: 280,
                  left: 103,
                  child: LienVertical(lienState: stateBouton1, height: 225),
                ),
                // right input or L4
                Positioned(
                  top: 280,
                  left: 145,
                  child: LienVertical(
                    height: 56,
                    lienState: notController.output(),
                  ),
                ),
                Positioned(
                  top: 330,
                  left: 150,
                  child: LienHorizontal(
                    width: 63,
                    lienState: notController.output(),
                  ),
                ),
                Positioned(
                  top: 330,
                  child: LienVertical(
                    height: 60,
                    lienState: notController.output(),
                  ),
                ),
                // left input and L4
                Positioned(
                  top: 285,
                  right: 145,
                  child: LienVertical(
                      lienState: notController.output(), height: 50),
                ),
                // right input and L5
                Positioned(
                  top: 285,
                  right: 104,
                  child: LienVertical(
                    height: 224,
                    lienState: stateBouton3,
                  ),
                ),
                // input not
                Positioned(
                  bottom: 140,
                  child: LienVertical(lienState: stateBouton2, height: 50),
                ),
                // B1
                Positioned(
                  // top: 250,
                  bottom: 87,
                  left: 77,
                  child: Bouton(
                      input: stateBouton1,
                      onTap: () {
                        setState(() {
                          stateBouton1 = !stateBouton1;
                          chance = chance - 1;
                          orController.ouput();
                          andController.ouput();
                          if (chance == 0) {
                            Reprendre(context, '/Niveau${level - 1}');
                          }
                        });
                      }),
                ),
                // B2
                Positioned(
                  // top: 250,
                  bottom: 87,
                  child: Bouton(
                      input: stateBouton2,
                      onTap: () {
                        setState(() {
                          stateBouton2 = !stateBouton2;
                          chance = chance - 1;
                          orController.ouput();
                          andController.ouput();
                          if (chance == 0) {
                            Reprendre(context, '/Niveau${level - 1}');
                          }
                        });
                      }),
                ),
                // B3
                Positioned(
                  // top: 250,
                  bottom: 87,
                  right: 77,
                  child: Bouton(
                      input: stateBouton3,
                      onTap: () {
                        setState(() {
                          stateBouton3 = !stateBouton3;
                          chance = chance - 1;
                          orController.ouput();
                          andController.ouput();
                          if ((orController.ouput() == true &&
                              !andController.ouput() == true)) {
                            if (level == globalLevel) {
                              setGlobalLevel(level + 1);
                            }
                            Suivant(context, '/Niveau${level + 1}');
                          } else if (chance == 0) {
                            Reprendre(context, '/Niveau${level - 1}');
                          }
                        });
                      }),
                ),
                // text
                const Positioned(
                  bottom: 15,
                  width: 360,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Allumer les deux lampes en un clics",
                    style: TextStyle(
                      fontSize: 25,
                      // textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
      bottomSheet: const BottomApp(),
    );
  }
}
