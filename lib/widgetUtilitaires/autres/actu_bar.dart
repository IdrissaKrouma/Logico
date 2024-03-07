import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActuBar extends StatefulWidget {
  int level;
  int score;
  int chance;
  ActuBar(
      {super.key,
      required this.level,
      required this.score,
      required this.chance});

  @override
  State<ActuBar> createState() => _ActuBarState();
}

class _ActuBarState extends State<ActuBar> {
  @override
  Widget build(BuildContext context) {
    int chance = widget.chance;
    int level = widget.level;
    int score = widget.score;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Chances $chance',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2667FF),
          ),
        ),
        Text(
          'Niveau $level',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2667FF),
          ),
        ),
        Text(
          'Score $score',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2667FF),
          ),
        ),
      ],
    );
  }
}
