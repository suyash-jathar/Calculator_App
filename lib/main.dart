// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, avoid_unnecessary_containers


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
          // primarySwatch: Colors.red,
          ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstnum = 0;
  int secondnum = 0;
  String texttodisplay = "";
  String res = "";
  String operatortoperform = "";
  void btnclicked(String btnval) {
    if (btnval == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "*" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "*") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget customeButton(String btnval) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          btnclicked(btnval);
        },
        color: Color.fromARGB(162, 158, 158, 158),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(25),
        child: Text(
          "$btnval",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttodisplay",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            )),
            Row(
              children: [
                customeButton("9"),
                customeButton("8"),
                customeButton("7"),
                customeButton("+"),
              ],
            ),
            Row(
              children: [
                customeButton("4"),
                customeButton("5"),
                customeButton("6"),
                customeButton("-"),
              ],
            ),
            Row(
              children: [
                customeButton("1"),
                customeButton("2"),
                customeButton("3"),
                customeButton("*"),
              ],
            ),
            Row(
              children: [
                customeButton("C"),
                customeButton("0"),
                customeButton("="),
                customeButton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
