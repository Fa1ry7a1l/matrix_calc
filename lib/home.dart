import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "A",
                    style: TextStyle(fontSize: 20),
                  ),
                  new DropdownButton<String>(
                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                    items: <String>['1', '2', '3', '4', '5', '6', '7']
                        .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value, style: TextStyle(fontSize: 20.0),),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
