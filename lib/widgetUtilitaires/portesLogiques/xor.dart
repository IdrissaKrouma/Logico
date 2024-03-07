import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Xor extends StatefulWidget {
  XorController controller;

  Xor({
    super.key,
    required this.controller,
  });

  @override
  State<Xor> createState() => _XorState();
}

class XorController {
  final bool inputLeft;
  final bool inputRight;

  XorController({
    required this.inputLeft,
    required this.inputRight,
  });

  bool output() {
    bool and1 = inputLeft && !inputRight;
    bool and2 = !inputLeft && inputRight;
    return and1 || and2;
  }
}

class _XorState extends State<Xor> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/portesLogiques/xor.png',
      width: 125,
      height: 125,
    );
  }
}
