import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Or extends StatefulWidget {
  OrController controller;

  Or({super.key, required this.controller});

  @override
  State<Or> createState() => _OrState();
}

class OrController {
  final bool inputLeft;
  final bool inputRight;

  OrController({required this.inputLeft, required this.inputRight});

  bool ouput() {
    return inputLeft || inputRight;
  }
}

class _OrState extends State<Or> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Image.asset(
      'assets/images/portesLogiques/or.png',
      width: 125,
      height: 125,
    );
  }
}
