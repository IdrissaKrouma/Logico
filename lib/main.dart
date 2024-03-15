import 'package:flutter/material.dart';
import 'package:logico/home.dart';
import 'package:logico/niveaux/niveau1.dart';
import 'package:logico/niveaux/niveau2.dart';
import 'package:logico/niveaux/niveau3.dart';
import 'package:logico/niveaux/niveau4.dart';
import 'package:logico/niveaux/niveau5.dart';
import 'package:logico/niveaux/niveau6.dart';
import 'package:logico/niveaux/niveau7.dart';
import 'package:logico/niveaux/niveau8.dart';
import 'package:logico/niveaux/niveau9.dart';
import 'package:logico/niveaux/niveau10.dart';
import 'package:logico/menu.dart';

void main() async {
  //final DatabaseManager _dbManager = DatabaseManager();
  //await _dbManager.openDatabase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGICO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFbde0fe)),
        useMaterial3: true,
      ),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => const Menu(),
        '/Menu': (BuildContext context) => const Menu(),
        '/Niveau1': (BuildContext context) => const Niveau1(),
        '/Niveau2': (BuildContext context) => const Niveau2(),
        '/Niveau3': (BuildContext context) => const Niveau3(),
        '/Niveau4': (BuildContext context) => const Niveau4(),
        '/Niveau5': (BuildContext context) => const Niveau5(),
        '/Niveau6': (BuildContext context) => const Niveau6(),
        '/Niveau7': (BuildContext context) => const Niveau7(),
        '/Niveau8': (BuildContext context) => const Niveau8(),
        '/Niveau9': (BuildContext context) => const Niveau9(),
        '/Niveau10': (BuildContext context) => const Niveau10(),
      },
      home: const Home(), // becomes the route named '/'
    );
  }
}
