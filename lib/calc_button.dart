import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class CalcButton extends StatefulWidget {
  const CalcButton({Key? key}) : super(key: key);

  @override
  _CalcButtonState createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {
  @override
  Widget build(BuildContext context) {
    double _currentValue = 0;
    var calc = SimpleCalculator(
      value: _currentValue,
      hideExpression: false,
      hideSurroundingBorder: false,
      onChanged: (key, value, expression) {
        setState(() {
          _currentValue = value ?? 0;
        });
      },
      onTappedDisplay: (value, details) {},
      theme: const CalculatorThemeData(
        borderColor: Colors.white,
        borderWidth: 2,
        displayColor: Colors.black,
        displayStyle: const TextStyle(fontSize: 80, color: Colors.yellow),
        expressionColor: Colors.black,
        expressionStyle: const TextStyle(fontSize: 20, color: Colors.white),
        operatorColor: Colors.pink,
        operatorStyle: const TextStyle(fontSize: 30, color: Colors.white),
        commandColor: Colors.orange,
        commandStyle: const TextStyle(fontSize: 30, color: Colors.white),
        numColor: Colors.black,
        numStyle: const TextStyle(fontSize: 50, color: Colors.white),
      ),
    );
    return OutlinedButton(
      child: Text(_currentValue.toString()),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: calc);
            });
      },
    );
  }
}
