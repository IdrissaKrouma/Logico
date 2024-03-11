import 'package:flutter/material.dart';
import 'package:logico/Database/globals.dart';
import 'package:logico/menu.dart';
import 'package:logico/widgetUtilitaires/autres/actu_bar.dart';
import 'package:logico/widgetUtilitaires/autres/bottom_app.dart';
import 'package:logico/widgetUtilitaires/autres/bouton.dart';
import 'package:logico/widgetUtilitaires/autres/lampe.dart';
import 'package:logico/widgetUtilitaires/autres/lien_horizontal.dart';
import 'package:logico/widgetUtilitaires/autres/lien_vertical.dart';
import 'package:logico/widgetUtilitaires/autres/reprendre.dart';
import 'package:logico/widgetUtilitaires/autres/suivant.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/not.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/or.dart';

// ignore: must_be_immutable
class Niveau2 extends StatefulWidget {
  const Niveau2({
    super.key,
  });

  @override
  State<Niveau2> createState() => _Niveau2State();
}

class _Niveau2State extends State<Niveau2> {
  bool stateBouton1 = false;
  bool stateBouton2 = false;
  int chance = 1;

  @override
  Widget build(BuildContext context) {
    int level = 2;
    int globalLevel = getGlobalLevel();
    int score = globalLevel * 5;

    NotController notController = NotController(input: stateBouton1);
    // ignore: unused_local_variable
    OrController orController = OrController(
      inputRight: stateBouton2,
      inputLeft: notController.output(),
    );

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
              height: 10,
            ),
            ActuBar(level: level, score: score, chance: chance),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 650,
              margin: const EdgeInsets.all(15),
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  //Lampe
                  Positioned(
                      top: 50,
                      left: 150,
                      child: Lampe(lampeState: orController.ouput())),
                  // OR
                  Positioned(
                      top: 135, left: 115, child: Or(controller: orController)),
                  //OUTPUT OR L1
                  Positioned(
                    top: 105,
                    left: 175,
                    child: LienVertical(
                      height: 65,
                      lienState: orController.ouput(),
                    ),
                  ),
                  // NOT
                  Positioned(
                      top: 300,
                      left: 94,
                      child: Not(controller: notController)),
                  // L2
                  Positioned(
                    top: 230,
                    left: 154,
                    child: LienVertical(
                      height: 100,
                      lienState: notController.output(),
                    ),
                  ),
                  // L3
                  Positioned(
                    top: 225,
                    right: 157,
                    child: LienVertical(
                      height: 120,
                      lienState: stateBouton2,
                    ),
                  ),
                  Positioned(
                    top: 340,
                    right: 123,
                    child: LienHorizontal(
                      lienState: stateBouton2,
                      width: 40,
                    ),
                  ),
                  Positioned(
                    top: 345,
                    right: 124,
                    child: LienVertical(
                      lienState: stateBouton2,
                      height: 150,
                    ),
                  ),
                  // L4
                  Positioned(
                    bottom: 150,
                    left: 153,
                    child: LienVertical(
                      height: 85,
                      lienState: stateBouton1,
                    ),
                  ),
                  // B1
                  Positioned(
                    // top: 250,
                    bottom: 100,
                    left: 125,
                    child: Bouton(
                      input: stateBouton1,
                      onTap: () {
                        setState(() {
                          stateBouton1 = !stateBouton1;
                          chance = chance - 1;
                        });
                        if (orController.ouput()) {
                          if (level == globalLevel) {
                            setGlobalLevel(level + 1);
                          }
                          Suivant(context, '/Niveau${level + 1}');
                        } else if (chance == 0) {
                          Reprendre(context, '/Niveau${level - 1}');
                        }
                      },
                    ),
                  ),
                  // B2
                  Positioned(
                    // top: 250,
                    bottom: 100,
                    right: 100,
                    child: Bouton(
                      input: stateBouton2,
                      onTap: () {
                        setState(() {
                          stateBouton2 = !stateBouton2;
                          chance = chance - 1;
                        });
                        if (chance == 0) {
                          Reprendre(context, '/Niveau${level - 1}');
                        }
                      },
                    ),
                  ),
                  // TEXT
                  const Positioned(
                    bottom: 30,
                    child: Text(
                      "Eteingnez la lampe en un CLIC",
                      style: TextStyle(
                        fontSize: 25,
                        // textAlign: TextAlign.center,
                      ),
                    ),
                  )
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
