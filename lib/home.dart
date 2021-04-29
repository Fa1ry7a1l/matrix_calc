import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EnterMatrix.dart';
import 'ViewMatrix.dart';

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
  EnterMatrix _enterMatrix;

  @override
  Widget build(BuildContext context) {
    _enterMatrix = new EnterMatrix(int.parse(a), int.parse(b), int.parse(l));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

              _enterMatrix,
              MaterialButton(
                onPressed: ButtonPressed,
                color: Color.fromARGB(255, 159, 159, 237),
                minWidth: 200.0,
                child: Text("Создать матрицу"),
              ), // Добавить функцию генераци
            ],
          ),
        ),
      ),
    );
  }

  Future<void> ButtonPressed() async {
    List<List<TextEditingController>> controllers =
        _enterMatrix.getControllers();
    List<List<int>> matr = [];
    for (int i = 0; i < controllers.length; i++) {
      List<int> r = [];
      for (int j = 0; j < controllers[i].length; j++) {
        r.add(int.parse(
            controllers[i][j].text.replaceAll('.', "").replaceAll(",", "")));
      }
      matr.add(r);
    }
    var a = matrixSolution(matr);
    List<List<List<int>>> matrList = a[0];
    List<List<String>> stringList = a[1];
    //printMatr(matrList.last,int.parse(l));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Show(matrList, stringList)),
    );
  }

  List matrixSolution(List<List<int>> matr) {
    List<List<List<int>>> resMatr = [];
    List<List<String>> resStr = [];
    for (int i = 0; i < int.parse(l) && i < matr.length; i++) {
      if (matr[i][i] == 0) continue;
      List<String> resStr1 = [];
      for (int x = 0; x < matr.length; x++) {
        int k1 = matr[x][i];
        int k2 = matr[i][i];
        var s = "${k2}*C${x + 1} - ${k1}*C${i + 1}".replaceAll("- -", "+ ");
        resStr1.add(s);

        if (x == i || k2 == 0) continue;
        for (int y = 0; y < matr[x].length; y++)
          matr[x][y] = matr[x][y] * k2 - k1 * matr[i][y];
      }

      resStr.add(resStr1);
      resMatr.add(matr);
    }
    List<String> resStr1 = [];
    for (int i = 0; i < matr.length; i++) {
      int min = 1000000000;
      for (int j = 0; j < matr[i].length; j++) {
        if ((matr[i][j]).abs() < min && matr[i][j] != 0)
          min = (matr[i][j]).abs();
      }

      for (int x = min; x >= 2; x--) {
        bool flag = true;
        for (int j = 0; j < matr[i].length; j++) {
          if (matr[i][j] % x != 0) flag = false;
        }
        if (flag) {
          for (int j = 0; j < matr[i].length; j++) {
            matr[i][j] = (matr[i][j] / x).truncate();
          }
          resStr1.add("C${i + 1}/${x}");
          break;
        }
      }
    }
    resMatr.add(matr);
    resStr.add(resStr1);
    return [resMatr, resStr];
  }

  void printMatr(List<List<int>> matr, int l) {
    for (int i = 0; i < matr.length; i++) {
      print(matr[i]);
    }
  }

  _HomeState() {
    a = "3";
    b = "6";
    l = "3";
  }
}
