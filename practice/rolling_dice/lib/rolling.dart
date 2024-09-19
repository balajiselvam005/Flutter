import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class RollingDie extends StatefulWidget {
  const RollingDie({super.key});

  @override
  State<RollingDie> createState() => _RollingDie();
}

class _RollingDie extends State<RollingDie> {
  Random random = Random();
  int num = 1, counter = 1;

  String dieNum = 'assets/images/dice_1.png';

  

  void onTap() async {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      counter++;
      setState(() {
        num = 1 + random.nextInt(6);
        dieNum = 'assets/images/dice_$num.png';
      });
      if (counter >= 13) {
        timer.cancel();
        setState(() {
          counter = 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Dice Roller",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  dieNum,
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: onTap, child: const Text("Roll Dice"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
