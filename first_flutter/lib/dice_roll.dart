import 'dart:math';
import 'package:flutter/material.dart';

// 不必每次都去新生成一个对象
final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// _ 表示类是私有的
class _DiceRollerState extends State<DiceRoller> {

  var number = randomizer.nextInt(6) + 1;

  void rollDice() {
    setState(() {
      number = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/dice-$number.png', width: 200),
        SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(15),
            foregroundColor: Colors.black54,
            textStyle: TextStyle(fontSize: 28),
          ),
          child: Text('摇骰子'),
        ),
      ],
    );
  }
}
