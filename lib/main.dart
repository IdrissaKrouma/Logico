// import 'package:audioplayers/audioplayers.dart';
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
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
import 'globals.dart';

//import 'package:sqflite/sqflite.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AudioPlayer? _player;

  // @override
  // void dispose() {
  //   _player?.dispose();
  //   super.dispose();
  // }

  // void _play() {
  //   _player?.dispose();
  //   final player = _player = AudioPlayer();
  //   player.play(AssetSource('audio/SoundHelix-Song-1.mp3'));
  // }

  @override
  Widget build(BuildContext context) {
    // _play();
    return MaterialApp(
      title: 'LOGICO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFbde0fe)),
        useMaterial3: true,
      ),
      home: const Menu(), // becomes the route named '/'
      routes: <String, WidgetBuilder>{
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
    );
  }
}
