import 'package:flutter/material.dart';

class BottomApp extends StatefulWidget {
  const BottomApp({super.key});

  @override
  State<BottomApp> createState() => _BottomAppState();
}

class _BottomAppState extends State<BottomApp> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        height: 70,
        child: SizedBox(
          width: 390,
          child: Image.asset(
            'assets/images/icons/brain.png',
            color: const Color(0xFF2667FF),
          ),
        ));
  }
}
