import 'package:flutter/material.dart';

class Lampe extends StatelessWidget {
  final bool lampeState;

  const Lampe({super.key, required this.lampeState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: lampeState ? Colors.orange : Colors.black,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        Icons.lightbulb,
        color: lampeState ? Colors.orange : Colors.black,
        size: 40,
      ),
    );
  }
}
