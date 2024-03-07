import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LienHorizontal extends StatefulWidget {
  bool lienState;
  double width;
  LienHorizontal({
    super.key,
    required this.lienState,
    required this.width,
  });

  @override
  State<LienHorizontal> createState() => _LienHorizontalState();
}

class _LienHorizontalState extends State<LienHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: widget.width,
      decoration: BoxDecoration(
        gradient: widget.lienState
            ? const LinearGradient(colors: [
                Colors.orange,
                Colors.blue,
              ])
            : const LinearGradient(colors: [Colors.black, Colors.black]),
        color: widget.lienState ? Colors.orange : Colors.black,
      ),
    );
  }
}
