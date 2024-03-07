import 'package:flutter/material.dart';
import 'package:logico/globals.dart';
import 'package:logico/menu.dart';
import 'package:logico/widgetUtilitaires/autres/actu_bar.dart';
import 'package:logico/widgetUtilitaires/autres/bottom_app.dart';
import 'package:logico/widgetUtilitaires/autres/bouton.dart';
import 'package:logico/widgetUtilitaires/autres/lampe.dart';
import 'package:logico/widgetUtilitaires/autres/lien_vertical.dart';
import 'package:logico/widgetUtilitaires/autres/suivant.dart';
import 'package:logico/widgetUtilitaires/portesLogiques/not.dart';

// ignore: must_be_immutable
class Niveau1 extends StatefulWidget {
  const Niveau1({
    super.key,
  });

  @override
  State<Niveau1> createState() => _Niveau1State();
}

class _Niveau1State extends State<Niveau1> {
  bool interrupteurState = false;
  int chance = 1;

  @override
  Widget build(BuildContext context) {
    NotController notController = NotController(input: interrupteurState);

    int level = 1;
    int globalLevel = getGlobalLevel();
    int score = globalLevel * 5;

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
                // LAMPE
                Positioned(
                    top: 70,
                    // bottom: 100,
                    child: Lampe(lampeState: notController.output())),
                // NOT
                Positioned(
                  top: 200,
                  child: Not(
                    controller: notController,
                  ),
                ),
                // L1
                Positioned(
                  top: 125,
                  child: LienVertical(
                    height: 100,
                    lienState: notController.output(),
                  ),
                ),
                // L2
                Positioned(
                  top: 310,
                  child: LienVertical(
                    lienState: interrupteurState,
                    height: 100,
                  ),
                ),
                // BTN
                Positioned(
                  // top: 250,
                  top: 410,
                  child: Bouton(
                    input: interrupteurState,
                    onTap: () {
                      setState(() {
                        interrupteurState = !interrupteurState;
                        chance = chance - 1;
                        if (interrupteurState) {
                          if (level == globalLevel) {
                            setGlobalLevel(level + 1);
                          }
                          Suivant(context, '/Niveau${level + 1}');
                        }
                      });
                    },
                  ),
                ),
                // TEXT
                const Positioned(
                  bottom: 40,
                  child: Text(
                    'Eteignez la lampe',
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
