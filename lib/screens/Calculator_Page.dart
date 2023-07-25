import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  final String title;
  const CalculatorPage({super.key, required this.title});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String btnTxt) {
    if (btnTxt == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (btnTxt == "+" ||
        btnTxt == "-" ||
        btnTxt == "*" ||
        btnTxt == "/") {
      num1 = double.parse(output);
      operand = btnTxt;
      _output = "0";
    } else if (btnTxt == ".") {
      if (_output.contains(".")) {
        // ignore: avoid_print
        print(output); //27:19
      }
    }
  }

  Widget buildButton(String btnText) {
    return Expanded(
      child: SizedBox(
        height: 70.0,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: OutlinedButton(
            child: Text(
              btnText,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonPressed(btnText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            output,
            style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
        Column(
          children: [
            Row(
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ],
            ),
            Row(
              children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*"),
              ],
            ),
            Row(
              children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ],
            ),
            Row(
              children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ],
            ),
            Row(
              children: [
                buildButton("CLEAR"),
                buildButton("="),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
