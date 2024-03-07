import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Nand extends StatefulWidget {
  NandController controller;

  Nand({super.key, required this.controller});

  @override
  State<Nand> createState() => _NandState();
}

class NandController {
  final bool inputLeft;
  final bool inputRight;

  NandController({required this.inputLeft, required this.inputRight});

  bool ouput() {
    return !inputLeft || !inputRight;
  }
}

class _NandState extends State<Nand> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Image.asset(
      'assets/images/portesLogiques/nand.png',
      width: 125,
      height: 125,
    );
  }
}
