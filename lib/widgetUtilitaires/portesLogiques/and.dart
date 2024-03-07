import 'package:flutter/material.dart';

// ignore: must_be_immutable
class And extends StatefulWidget {
  AndController controller;

  And({super.key, required this.controller});

  @override
  State<And> createState() => _AndState();
}

class AndController {
  final bool inputLeft;
  final bool inputRight;

  AndController({required this.inputLeft, required this.inputRight});

  bool ouput() {
    return inputLeft && inputRight;
  }
}

class _AndState extends State<And> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Image.asset(
      'assets/images/portesLogiques/and.png',
      width: 125,
      height: 125,
    );
  }
}
