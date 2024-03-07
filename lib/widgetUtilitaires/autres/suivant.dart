import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void Suivant(BuildContext context, String pageName) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                width: 100,
                'assets/images/icons/validate.png',
                color: const Color(0xFF2667FF),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pageName);
                  },
                  child: const Text(
                    "Suivant",
                    style: TextStyle(
                      fontSize: 20,
                      height: 3,
                    ),
                  )),
            ],
          ),
        );
      });
}
