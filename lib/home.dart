import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EnterMatrix.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  String a;
  String b;
  String l;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "A",
                    style: TextStyle(fontSize: 20),
                  ),
                  new DropdownButton<String>(
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                    items: <String>[
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                      '6',
                      '7',
                      '8',
                      '9',
                      '10'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(
                          value,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      );
                    }).toList(),
                    onChanged: (String s) {
                      print(s);
                      a = s;
                      this.setState(() {});
                    },
                    hint: Text(
                      a,
                      style: TextStyle(
                          fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  Text(
                    "B",
                    style: TextStyle(fontSize: 20),
                  ),
                  new DropdownButton<String>(
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                    items: <String>[
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                      '6',
                      '7',
                      '8',
                      '9',
                      '10'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(
                          value,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      );
                    }).toList(),
                    onChanged: (String s) {
                      print(s);
                      b = s;
                      this.setState(() {});
                    },
                    hint: Text(
                      b,
                      style: TextStyle(
                          fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  Text(
                    "L",
                    style: TextStyle(fontSize: 20),
                  ),
                  new DropdownButton<String>(
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                    items: <String>[
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                      '6',
                      '7',
                      '8',
                      '9',
                      '10'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(
                          value,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      );
                    }).toList(),
                    onChanged: (String s) {
                      print(s);
                      l = s;
                      this.setState(() {});
                    },
                    hint: Text(
                      l,
                      style: TextStyle(
                          fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () => {},
                color: Color.fromARGB(255, 159, 159, 237),
                minWidth: 200.0,
                child: Text("Создать матрицу"),
              ), // Добавить функцию генераци
              new EnterMatrix(int.parse(a),int.parse(b),int.parse(l)),
            ],
          ),
        ),
      ),
    );
  }

  _HomeState() {
    a = "1";
    b = "1";
    l = "1";
  }
}
