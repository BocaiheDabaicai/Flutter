import 'package:first_flutter/dice_roll.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter/text_widget.dart';
import 'package:first_flutter/dice_roll.dart';

const beginAlignment = Alignment.topLeft;
const engAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  GradientContainer.mine({super.key})
    : colors = [Colors.indigo.shade50, Colors.orange.shade50];

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: beginAlignment,
          end: engAlignment,
        ),
      ),
      // child: Center(child: TextWidget('bigbigName')),
      child: Center(
        child:DiceRoller()
      ),
    );
  }
}
