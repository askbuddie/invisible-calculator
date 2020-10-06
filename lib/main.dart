import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calc> {
  Widget button(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        highlightedBorderColor: Colors.green,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            //layout starts here

            Column(children: [
              Row(children: [
                button("/"),
                button("7"),
                button("8"),
                button("9"),
              ]),
              Row(children: [
                button("X"),
                button("4"),
                button("5"),
                button("6"),
              ]),
              Row(children: [
                button("-"),
                button("1"),
                button("2"),
                button("3"),
              ]),
              Row(
                children: [
                  button("+"),
                  button("0"),
                  button("."),
                  button("C"),
                ],
              ),
              Row(
                children: [
                  button("%"),
                  button("AC"),
                  button("="),
                ],
              )
            ])
          ],
        ),
      ),
    );
  }

  buttonPressed(String buttonText) {
//main logic function of app
    if (buttonText == "AC" || buttonText == "C") {
      solution = "0";
      x = 0.0;
      y = 0.0;
      operator = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X" ||
        buttonText == "%") {
      x = double.parse(output);

      operator = buttonText;

      solution = "0";
    } else if (buttonText == ".") {
      if (solution.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        solution = solution + buttonText;
      }
    } else if (buttonText == "=") {
      y = double.parse(output);

      if (operator == "+") {
        solution = (x + y).toString();
      }
      if (operator == "-") {
        solution = (x - y).toString();
      }
      if (operator == "X") {
        solution = (x * y).toString();
      }
      if (operator == "/") {
        solution = (x / y).toString();
      }
      if (operator == "%") {
        solution = (x % y).toString();
      }

      x = 0.0;
      y = 0.0;
      operator = "";
    } else {
      solution = solution + buttonText;
    }

    print(solution);

    setState(() {
      output = double.parse(solution).toStringAsFixed(2);
    });
  }

//init..
  String output = "0";
  String solution = "0";
  double x = 0.0;
  double y = 0.0;
  String operator = "";
}
