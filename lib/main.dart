import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const midterm(),
    );
  }
}

class midterm extends StatefulWidget {
  const midterm({super.key});

  @override
  State<midterm> createState() => _midtermState();
}

class _midtermState extends State<midterm> {
  int _count = 0;
  String _input = '0';

  Widget button({required String num}) {
    if (num == "C") {
      return InkWell(
        onTap: () {
          setState(() {
            _input = '0';
          });
        },
        child: Container(
          margin: EdgeInsets.all(5),
          height: 90,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 214, 226, 231),
          ),
          alignment: Alignment.center,
          child: Text(
            num,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    } else if (num == "XX") {
      return InkWell(
        onTap: () {
          setState(() {
            if (_count == 0) {
              _input = num;
              _count++;
            } else {
              _input = _input.substring(0, _input.length - 1);
            }
          });
        },
        child: Container(
          margin: EdgeInsets.all(5),
          height: 90,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 214, 226, 231),
          ),
          alignment: Alignment.center,
          child: Icon(Icons.backspace_outlined),
        ),
      );
    } else if (num == "0") {
      return InkWell(
        onTap: () {
          setState(() {
            if (_count == 0) {
              _input = num;
              _count++;
            } else {
              _input += num;
            }
          });
        },
        child: Container(
          margin: EdgeInsets.all(5),
          height: 90,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
          alignment: Alignment.center,
          child: Text(
            num,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    } else if (num == "\u003D") {
      return InkWell(
        onTap: () {
          setState(() {
            if (_count == 0) {
              _input = num;
              _count++;
            } else {
              _input = '0';
            }
          });
        },
        child: Container(
          margin: EdgeInsets.all(5),
          height: 90,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          alignment: Alignment.center,
          child: Text(
            num,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    } else if ((num == "\u002B" ||
        num == "\u2212" ||
        num == "\u00D7" ||
        num == "\u00F7")) {
      return InkWell(
        onTap: () {
          setState(() {
            if (_count == 0) {
              _input = num;
              _count++;
            } else {
              _input += num;
            }
          });
        },
        child: Container(
          margin: EdgeInsets.all(5),
          height: 90,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 214, 226, 231),
          ),
          alignment: Alignment.center,
          child: Text(
            num,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          if (_count == 0) {
            _input = num;
            _count++;
          } else {
            _input += num;
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 90,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
        ),
        alignment: Alignment.center,
        child: Text(
          num,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 224, 211, 211)))),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calculate,
                  size: 35,
                  color: Color.fromARGB(255, 7, 140, 71),
                ),
                Container(
                  width: 15,
                ),
                Text(
                  "MY CALCULATOR",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '$_input',
              style: TextStyle(fontSize: 60),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: button(num: "C")),
              Flexible(child: button(num: "XX")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(child: button(num: "7")),
              Flexible(child: button(num: "8")),
              Flexible(child: button(num: "9")),
              Flexible(child: button(num: "\u00F7")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: button(num: "4")),
              Flexible(child: button(num: "5")),
              Flexible(child: button(num: "6")),
              Flexible(child: button(num: "\u00D7")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: button(num: "1")),
              Flexible(child: button(num: "2")),
              Flexible(child: button(num: "3")),
              Flexible(child: button(num: "\u2212")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex: 3, child: button(num: "0")),
              Flexible(child: button(num: "\u002B")),
            ],
          ),
          button(num: "\u003D"),
        ],
      ),
    );
  }
}
