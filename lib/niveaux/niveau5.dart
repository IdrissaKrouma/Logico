import 'package:flutter/material.dart';
import 'package:logico/globals.dart';
import 'package:logico/menu.dart';
import 'package:logico/widgetUtilitaires/autres/actu_bar.dart';
import 'package:logico/widgetUtilitaires/autres/bottom_app.dart';
import 'package:logico/widgetUtilitaires/autres/reprendre.dart';
import 'package:logico/widgetUtilitaires/autres/suivant.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/and.dart';
import 'package:logico/widgetUtilitaires/autres/bouton.dart';
import 'package:logico/widgetUtilitaires/autres/lampe.dart';
import 'package:logico/widgetUtilitaires/autres/lien_horizontal.dart';
import 'package:logico/widgetUtilitaires/autres/lien_vertical.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/nor.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/not.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/or.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/xor.dart';

class Niveau5 extends StatefulWidget {
  const Niveau5({super.key});

  @override
  State<Niveau5> createState() => _Niveau5State();
}

class _Niveau5State extends State<Niveau5> {
  bool stateBouton1 = false;
  bool stateBouton2 = false;
  bool stateBouton3 = false;

  int chance = 1;

  @override
  Widget build(BuildContext context) {
    AndController andController = AndController(
      inputRight: stateBouton2,
      inputLeft: stateBouton1,
    );
    OrController orController = OrController(
      inputRight: stateBouton2,
      inputLeft: stateBouton3,
    );
    NotController notController = NotController(input: stateBouton2);
    NorController norController = NorController(
      inputRight: notController.output(),
      inputLeft: andController.ouput(),
    );
    XorController xorController = XorController(
      inputRight: orController.ouput(),
      inputLeft: notController.output(),
    );

    int level = 5;
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
        alignment: Alignment.center,
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
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                width: 475,
                height: 650,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              //left Lampe
              Positioned(
                  top: 50,
                  left: 100,
                  child: Lampe(lampeState: norController.ouput())),
              // right Lampe
              Positioned(
                  top: 50,
                  right: 100,
                  child: Lampe(lampeState: xorController.output())),
              // xor
              Positioned(
                  top: 130, right: 65, child: Xor(controller: xorController)),
              // NOR
              Positioned(
                  top: 130, left: 65, child: Nor(controller: norController)),
              // OUTPUT nor L1
              Positioned(
                top: 105,
                left: 125,
                child:
                    LienVertical(lienState: norController.ouput(), height: 50),
              ),
              // OUTPUT xor L2
              Positioned(
                top: 105,
                right: 125,
                child:
                    LienVertical(lienState: xorController.output(), height: 50),
              ),
              // AND
              Positioned(
                  top: 280, left: 43, child: And(controller: andController)),
              // OR
              Positioned(
                  top: 280, right: 43, child: Or(controller: orController)),
              // not
              Positioned(top: 280, child: Not(controller: notController)),
              // OUTPUT and L3
              Positioned(
                top: 235,
                left: 103,
                child:
                    LienVertical(lienState: andController.ouput(), height: 80),
              ),
              // OUTPUT OR L4
              Positioned(
                top: 230,
                right: 104,
                child:
                    LienVertical(lienState: orController.ouput(), height: 80),
              ),
              //OUTPUT not L5
              Positioned(
                top: 270,
                child:
                    LienVertical(lienState: notController.output(), height: 35),
              ),
              Positioned(
                top: 270,
                child: LienHorizontal(
                    lienState: notController.output(), width: 100),
              ),
              Positioned(
                top: 235,
                left: 145,
                child:
                    LienVertical(lienState: notController.output(), height: 40),
              ),
              Positioned(
                top: 230,
                right: 145,
                child:
                    LienVertical(lienState: notController.output(), height: 40),
              ),
              // RIGHT INPUT OR L6
              Positioned(
                  bottom: 167,
                  right: 82,
                  child: LienVertical(lienState: stateBouton3, height: 145)),
              // LEFT INPUT OR L7
              Positioned(
                  bottom: 250,
                  child: LienHorizontal(lienState: stateBouton2, width: 140)),
              Positioned(
                  bottom: 250,
                  right: 123,
                  child: LienVertical(lienState: stateBouton2, height: 55)),
              // RIGHT INPUT AND L8
              Positioned(
                bottom: 250,
                left: 123,
                child: LienVertical(lienState: stateBouton2, height: 55),
              ),
              // LEFT INPUT AND L9
              Positioned(
                  bottom: 167,
                  left: 82,
                  child: LienVertical(lienState: stateBouton1, height: 140)),
              // INPUT not L10
              Positioned(
                  bottom: 167,
                  child: LienVertical(lienState: stateBouton2, height: 140)),
              // RIGHT BTN
              Positioned(
                // top: 250,
                bottom: 110,
                right: 57,
                child: Bouton(
                    input: stateBouton3,
                    onTap: () {
                      setState(() {
                        stateBouton3 = !stateBouton3;
                        chance = chance - 1;
                        if (chance == 0) {
                          Reprendre(context, '/Niveau${level - 1}');
                        }
                      });
                    }),
              ),
              // CENTER BTN
              Positioned(
                // top: 250,
                bottom: 110,
                child: Bouton(
                    input: stateBouton2,
                    onTap: () {
                      setState(() {
                        stateBouton2 = !stateBouton2;
                        chance = chance - 1;
                        if (!norController.ouput() && xorController.output()) {
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
              // LEFT BTN
              Positioned(
                // top: 250,
                bottom: 110,
                left: 57,
                child: Bouton(
                    input: stateBouton1,
                    onTap: () {
                      setState(() {
                        stateBouton1 = !stateBouton1;
                        chance = chance - 1;
                        if (chance == 0) {
                          Reprendre(context, '/Niveau${level - 1}');
                        }
                      });
                    }),
              ),
              //
              const Positioned(
                bottom: 20,
                child: Text(
                  "Allumez les lampes en un CLIC",
                  style: TextStyle(
                    fontSize: 25,
                    // textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
      bottomSheet: const BottomApp(),
    );
  }
}
