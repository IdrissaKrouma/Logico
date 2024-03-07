import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LienVertical extends StatefulWidget {
  bool lienState;
  double height;
  LienVertical({
    super.key,
    required this.lienState,
    required this.height,
  });

  @override
  State<LienVertical> createState() => _LienVerticalState();
}

class _LienVerticalState extends State<LienVertical> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: widget.lienState
            ? const LinearGradient(colors: [
                Colors.orange,
                Colors.blue,
              ])
            : const LinearGradient(colors: [Colors.black, Colors.black]),
        // color: widget.lienState ? Colors.orange : Colors.black,
      ),
    );
  }
}
