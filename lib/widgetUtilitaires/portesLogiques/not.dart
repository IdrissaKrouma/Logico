import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Not extends StatefulWidget {
  NotController controller;

  Not({
    super.key,
    required this.controller,
  });

  @override
  State<Not> createState() => _NotState();
}

class NotController {
  final bool input;

  NotController({required this.input});

  bool output() {
    return !input;
  }
}

class _NotState extends State<Not> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return Image.asset(
      'assets/images/portesLogiques/not.png',
      width: 125,
      height: 125,
    );
  }
}
