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
class Niveau8 extends StatefulWidget {
  const Niveau8({
    super.key,
  });

  @override
  State<Niveau8> createState() => _Niveau8State();
}

class _Niveau8State extends State<Niveau8> {
  bool interrupteur1State = false;
  bool interrupteur2State = false;
  bool interrupteur3State = false;
  int chance = 1;

  @override
  Widget build(BuildContext context) {
    NotController notController1 = NotController(input: interrupteur1State);
    NotController notController2 = NotController(input: interrupteur2State);
    NotController notController3 = NotController(input: interrupteur3State);
    OrController orController1 = OrController(
        inputLeft: notController1.output(),
        inputRight: notController2.output());
    OrController orController2 = OrController(
        inputLeft: interrupteur2State, inputRight: notController3.output());

    int level = 8;
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
            height: 20,
          ),
          ActuBar(level: level, score: score, chance: chance),
          Container(
            alignment: Alignment.center,
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
                // lampe
                Positioned(
                  left: 100,
                  top: 10,
                  child: Lampe(lampeState: orController1.ouput()),
                ),
                // lampe2
                Positioned(
                  right: 100,
                  top: 10,
                  child: Lampe(lampeState: orController2.ouput()),
                ),

                //Les portes Ou liés à la lampe
                Positioned(
                    left: 63, top: 100, child: Or(controller: orController1)),
                Positioned(
                    right: 63, top: 100, child: Or(controller: orController2)),
                //les portes not
                Positioned(
                    left: 5,
                    bottom: 270,
                    child: Not(controller: notController1)),
                Positioned(
                    bottom: 270,
                    left: 83,
                    child: Not(controller: notController2)),
                Positioned(
                    right: 43,
                    bottom: 270,
                    child: Not(controller: notController3)),
                // or1 l1
                Positioned(
                  top: 65,
                  left: 122,
                  child: LienVertical(
                      lienState: orController1.ouput(), height: 70),
                ),
                // or2 l2
                Positioned(
                  top: 65,
                  right: 122,
                  child: LienVertical(
                      lienState: notController3.output(), height: 70),
                ),
                // left input or1 l3
                Positioned(
                  top: 190,
                  left: 102,
                  child: LienVertical(
                      lienState: notController1.output(), height: 45),
                ),
                Positioned(
                  top: 235,
                  left: 63,
                  child: LienHorizontal(
                      lienState: notController1.output(), width: 45),
                ),
                Positioned(
                  top: 235,
                  left: 63,
                  child: LienVertical(
                      lienState: notController1.output(), height: 45),
                ),
                // right input or2 l4
                Positioned(
                  top: 195,
                  right: 102,
                  child: LienVertical(
                      lienState: notController3.output(), height: 70),
                ),

                // right input or1
                Positioned(
                  top: 200,
                  left: 143,
                  child: LienVertical(
                      lienState: notController2.output(), height: 70),
                ),

                // left input or2
                Positioned(
                  top: 190,
                  right: 143,
                  child:
                      LienVertical(lienState: interrupteur2State, height: 210),
                ),
                Positioned(
                  top: 400,
                  child:
                      LienHorizontal(lienState: interrupteur2State, width: 70),
                ),
                // input left not
                Positioned(
                  top: 350,
                  left: 65,
                  child:
                      LienVertical(lienState: interrupteur1State, height: 130),
                ),
                // input center not
                Positioned(
                  top: 350,
                  right: 210,
                  child:
                      LienVertical(lienState: interrupteur2State, height: 130),
                ),
                // input right not
                Positioned(
                  top: 350,
                  right: 103,
                  child:
                      LienVertical(lienState: interrupteur3State, height: 130),
                ),
                //Les interrupteurs
                Positioned(
                  bottom: 115,
                  left: 40,
                  child: Bouton(
                      input: interrupteur1State,
                      onTap: () {
                        setState(() {
                          interrupteur1State = !interrupteur1State;
                          chance = chance - 1;
                          Reprendre(context, '/Niveau${level - 1}');
                        });
                      }),
                ),
                Positioned(
                  bottom: 115,
                  left: 120,
                  child: Bouton(
                      input: interrupteur2State,
                      onTap: () {
                        setState(() {
                          interrupteur2State = !interrupteur2State;
                          Reprendre(context, '/Niveau${level - 1}');
                        });
                      }),
                ),
                Positioned(
                  bottom: 115,
                  right: 70,
                  child: Bouton(
                      input: interrupteur3State,
                      onTap: () {
                        setState(() {
                          interrupteur3State = !interrupteur3State;
                          if (level == globalLevel) {
                            setGlobalLevel(level + 1);
                          }
                          Suivant(context, '/Niveau${level + 1}');
                        });
                      }),
                ),
                const Positioned(
                  bottom: 40,
                  child: Text(
                    'Eteignez la lampe de droite',
                    style: TextStyle(
                      fontSize: 25,
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
