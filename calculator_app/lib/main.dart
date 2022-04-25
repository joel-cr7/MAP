import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";


  buttonPressed(String buttonText){
    if(buttonText=="C"){
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    // if user clicks any operand
    else if(buttonText=="+" || buttonText=="-" || buttonText=="*" || buttonText=="/"){
      num1 = int.parse(output);
      operand = buttonText;
      _output = "0";
    }
    // if user click "="
    else if(buttonText=="="){
      num2 = int.parse(output);
      if(operand=="+"){
        _output = (num1+num2).toString();
      }else if(operand=="-"){
        _output = (num1-num2).toString();
      }else if(operand=="/"){
        _output = (num1/num2).toString();
      }else if(operand=="*"){
        _output = (num1*num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    // if user clicks first numerical button
    else{
      if(_output[0]=="0"){
        _output = "";
      }
      _output = _output + buttonText;
    }
    print(_output);
    // change the state of output variable to display on screen
    setState(() {
      output = _output;
    });
  }

  Widget buildButton(String buttonText){
    return Expanded(
      child: OutlineButton(
        padding: const EdgeInsets.all(24),
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(buttonText,
          style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 12
            ),
            child: Text(output,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          const Expanded(child: Divider()),

          Column(
            children: [
              Row(
                children: [
                  buildButton("C"),
                  buildButton("="),
                  buildButton("-"),
                  buildButton("+"),
                ],
              ),Row(
                children: [
                  buildButton("*"),
                  buildButton("/"),
                  buildButton("0"),
                  buildButton("1"),
                ],
              ),Row(
                children: [
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("4"),
                  buildButton("5"),
                ],
              ),Row(
                children: [
                  buildButton("6"),
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                ],
              )
            ],
          )
        ],
      )
    );
  }
}
