import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void Reprendre(BuildContext context, String pageName) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          // color: Colors.white,
          height: 30,
          width: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                width: 100,
                'assets/images/icons/cancel.png',
                color: const Color(0xFFe63946),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFe63946))
                      //backgroundColor: Color(0xFFe63946),
                      ),
                  onPressed: () {
                    Navigator.pushNamed(context, pageName);
                  },
                  child: const Text(
                    "Reprendre",
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
