import 'package:flutter/material.dart';
import 'package:logico/globals.dart';
import 'package:logico/widgetUtilitaires/autres/actu_bar.dart';
import 'package:logico/widgetUtilitaires/autres/bottom_app.dart';

// ignore: must_be_immutable
class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  createRang<widget>(BuildContext context, int depart, int valeurFinal,
      String name, int globalLevel) {
    return Container(
      // padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: 365,
      decoration: BoxDecoration(
        border: Border.all(width: 2.5),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: const TextStyle(
              fontSize: 25,
              // fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          children: [
            for (int i = depart; i <= valeurFinal; i++)
              Container(
                  margin: const EdgeInsets.all(5),
                  // padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.5,
                      color: i <= globalLevel
                          ? const Color(0xFF2667FF)
                          : const Color(0xFFbde0fe),
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigator.defaultGenerateInitialRoutes(navigator, initialRouteName)
                      Navigator.pushNamed(context, '/Niveau$i');
                    },
                    child: Text(
                      '$i',
                      style: TextStyle(
                          fontSize: 20,
                          color: i <= globalLevel
                              ? const Color(0xFF2667FF)
                              : const Color(0xFFbde0fe)),
                    ),
                  )),
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    int globalLevel = getGlobalLevel();
    int score = globalLevel * 5;
    return Scaffold(
        appBar: AppBar(
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
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.5, color: Color(0xFF2667FF)),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ActuBar(level: globalLevel, score: score, chance: 0),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: (550),
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    createRang(context, 1, 30, 'DEBUTANT', globalLevel),
                    const SizedBox(
                      width: 50,
                    ),
                    createRang(context, 31, 60, 'INTERMEDIAIRE', globalLevel),
                    const SizedBox(
                      width: 50,
                    ),
                    createRang(context, 61, 90, 'DIFICILE', globalLevel),
                  ]),
                ),
              ],
            )),
        bottomSheet: const BottomApp());
  }
}
