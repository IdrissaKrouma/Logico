import 'package:flutter/material.dart';
import 'package:logico/Database/globals.dart';
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

class Niveau4 extends StatefulWidget {
  const Niveau4({super.key});

  @override
  State<Niveau4> createState() => _Niveau4State();
}

class _Niveau4State extends State<Niveau4> {
  bool stateBouton1 = false;
  bool stateBouton2 = false;
  bool stateBouton3 = false;
  int chance = 1;

  @override
  Widget build(BuildContext context) {
    NotController notController = NotController(input: stateBouton2);

    AndController andController = AndController(
      inputRight: notController.output(),
      inputLeft: stateBouton1,
    );
    OrController orController = OrController(
      inputRight: stateBouton3,
      inputLeft: notController.output(),
    );
    NorController norController = NorController(
      inputRight: orController.ouput(),
      inputLeft: andController.ouput(),
    );

    int level = 4;
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
              //Lampe
              Positioned(
                  top: 50, child: Lampe(lampeState: norController.ouput())),
              // NOR
              Positioned(top: 115, child: Nor(controller: norController)),
              // OUTPUT NOR L1
              Positioned(
                top: 105,
                child:
                    LienVertical(lienState: norController.ouput(), height: 45),
              ),
              // AND
              Positioned(
                  top: 275, left: 42, child: And(controller: andController)),
              // OR
              Positioned(
                  top: 275, right: 42, child: Or(controller: orController)),
              // NOT
              Positioned(bottom: 155, child: Not(controller: notController)),
              // OUTPUT And L3
              Positioned(
                top: 220,
                left: 172,
                child:
                    LienVertical(lienState: andController.ouput(), height: 40),
              ),
              Positioned(
                top: 254,
                left: 102,
                child:
                    LienHorizontal(lienState: andController.ouput(), width: 75),
              ),
              Positioned(
                top: 254,
                left: 102,
                child:
                    LienVertical(lienState: andController.ouput(), height: 50),
              ),
              // OUTPUT NOR L2
              Positioned(
                top: 220,
                right: 171,
                child:
                    LienVertical(lienState: orController.ouput(), height: 40),
              ),
              Positioned(
                top: 254,
                right: 102,
                child:
                    LienHorizontal(lienState: orController.ouput(), width: 75),
              ),
              Positioned(
                top: 254,
                right: 102,
                child:
                    LienVertical(lienState: orController.ouput(), height: 50),
              ),
              // output noT
              Positioned(
                bottom: 260,
                child:
                    LienVertical(lienState: notController.output(), height: 25),
              ),
              // right INPUT or L7
              Positioned(
                  bottom: 157,
                  right: 81,
                  child: LienVertical(lienState: stateBouton3, height: 160)),
              // left INPUT or L6
              Positioned(
                bottom: 280,
                right: 122,
                child:
                    LienVertical(lienState: notController.output(), height: 35),
              ),
              Positioned(
                bottom: 280,
                right: 122,
                child: LienHorizontal(
                    lienState: notController.output(), width: 145),
              ),
              // right INPUT AND L5
              Positioned(
                bottom: 280,
                left: 122,
                child:
                    LienVertical(lienState: notController.output(), height: 35),
              ),
              // LEFT INPUT AND L4
              Positioned(
                  bottom: 157,
                  left: 81,
                  child: LienVertical(lienState: stateBouton1, height: 155)),
              // input nor
              Positioned(
                  bottom: 155,
                  child: LienVertical(lienState: stateBouton2, height: 37)),
              // RIGHT BTN b3
              Positioned(
                // top: 250,
                bottom: 100,
                right: 55,
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
              // CENTER BTN b2
              Positioned(
                // top: 250,
                bottom: 100,
                child: Bouton(
                    input: stateBouton2,
                    onTap: () {
                      setState(() {
                        stateBouton2 = !stateBouton2;
                        chance = chance - 1;
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
              // LEFT BTN b1
              Positioned(
                // top: 250,
                bottom: 100,
                left: 55,
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
              // text
              const Positioned(
                bottom: 20,
                child: Text(
                  "Allumez la lampe en un CLIC",
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
