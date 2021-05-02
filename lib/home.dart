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
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
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
    //printMatr(matrList.last, int.parse(l));
    //print(stringList);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Show(matrList, stringList, int.parse(l))),
    );
  }

  ///Решение СЛУ---------------------------------------------------------------------
  List matrixSolution(List<List<int>> matr) {
    List<List<List<int>>> resMatr = [];
    List<List<String>> resStr = [];
    resMatr.add(clone(matr));
    List<bool> checked = [];
    for (int i = 0; i < matr.length; i++) {
      checked.add(true);
    }
    for (int i = 0; i < int.parse(l) && i < matr[0].length; i++) {
      int pos = nextRow(matr, i, checked);
      if (pos == -1) continue;
      List<String> resStr1 = [];
      for (int x = 0; x < matr.length; x++) {
        int k1 = matr[x][i];
        int k2 = matr[pos][i];
        var s = "${k2}*C${x + 1} - ${k1}*C${pos + 1}"
            .replaceAll("- -", "+ ")
            .replaceAll(" - ", " -  ");
        resStr1.add(s);

        if (x == pos) continue;
        print(pos);
        for (int y = 0; y < matr[x].length; y++)
          matr[x][y] = matr[x][y] * k2 - k1 * matr[pos][y];
      }

      resStr.add(resStr1);
      resMatr.add(clone(matr));
    }

    ///Сокращение---------------------------------------
    List<String> resStr2 = [];

    for (int i = 0; i < matr.length; i++) {
      int min = 1000000000;
      for (int j = 0; j < matr[i].length; j++) {
        if ((matr[i][j]).abs() < min && matr[i][j] != 0)
          min = (matr[i][j]).abs();
      }

      if (min == 1000000000) continue;

      for (int x = min; x >= 2; x--) {
        bool flag = true;
        for (int j = 0; j < matr[i].length; j++) {
          if (matr[i][j] % x != 0) flag = false;
        }
        if (flag) {
          for (int j = 0; j < matr[i].length; j++) {
            matr[i][j] = (matr[i][j] / x).truncate();
          }
          resStr2.add("C${i + 1}/${x}");
          break;
        }
      }
    }
    if (!resStr2.isEmpty) resMatr.add(clone(matr));

    resStr.add(resStr2);

    return [resMatr, resStr];
  }

  void printMatr(List<List<int>> matr, int l) {
    for (int i = 0; i < matr.length; i++) {
      print(matr[i]);
    }
  }

  List<List<int>> clone(List<List<int>> a) {
    List<List<int>> res = [];
    for (int i = 0; i < a.length; i++) {
      res.add(new List<int>.from(a[i]));
    }
    return res;
  }

  int nextRow(List<List<int>> matr, int column, List<bool> checked) {
    if (matr.length > 0) {
      if (matr.length == checked.length) {
        for (int i = 0; i < matr.length; i++) {
          if (matr[i][column] != 0 && checked[i]) {
            checked[i] = false;
            return i;
          }
        }
      }
    }
    return -1;
  }

  _HomeState() {
    a = "3";
    b = "3";
    l = "3";
  }
}
