import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Bouton extends StatefulWidget {
  bool input;
  final VoidCallback onTap;

  Bouton({
    super.key,
    required this.input,
    required this.onTap,
  });

  @override
  State<Bouton> createState() => _BoutonState();
}

class _BoutonState extends State<Bouton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: widget.input ? Colors.blue : Colors.black,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
          onPressed: widget.onTap,
          icon: Icon(
            Icons.power_settings_new,
            color: widget.input ? Colors.blue : Colors.black,
            size: 30,
          )),
    );
  }
}
