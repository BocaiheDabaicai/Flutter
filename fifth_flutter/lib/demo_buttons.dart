import 'package:flutter/material.dart';

class DemoButtons extends StatefulWidget{
  const DemoButtons({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DemoButtonsState();
  }
}

class _DemoButtonsState extends State<DemoButtons>{
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('DemoButtons BUILD called');

    return Column(
      mainAxisSize: MainAxisSize.min, // 只需要保证显示组件的最小高度
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _isUnderstood = false;
              });
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isUnderstood = true;
              });
            },
            child: const Text('Yes'),
          ),
        ],
      ),
      if (_isUnderstood) const Text('Awesome!'),
    ],);
  }
}