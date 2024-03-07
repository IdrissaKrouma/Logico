import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Nor extends StatefulWidget {
  NorController controller;

  Nor({super.key, required this.controller});

  @override
  State<Nor> createState() => _NorState();
}

class NorController {
  final bool inputLeft;
  final bool inputRight;

  NorController({required this.inputLeft, required this.inputRight});

  bool ouput() {
    return !inputLeft && !inputRight;
  }
}

class _NorState extends State<Nor> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Image.asset(
      'assets/images/portesLogiques/nor.png',
      width: 125,
      height: 150,
    );
  }
}
