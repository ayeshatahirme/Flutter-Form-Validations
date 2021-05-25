import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String value = "";
  String result = "";

  final numCon = new TextEditingController();

  isPrime(String number) {
    var tempNum = int.parse(number);

    if (tempNum == 0 || tempNum == 1) {
      result = "$number is neither composite nor prime";
    } else {
      for (int i = 2; i <= tempNum / 2; i++) {
        if (tempNum % i == 0) {
          result = "$number is composite number";
          break;
        }
        else{
          result = "$number is prime number";
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text('Check Prime/Composiite Number'),
        centerTitle: true,
      ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextField(
                    controller: numCon,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(),
                        hintText: 'Enter Number'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          value = numCon.text;
                        });
                        isPrime(value);
                      },
                      style: ElevatedButton.styleFrom(elevation: 8),
                      child: Text('Check'),
                      
                    ),
                  ),
                  Text(
                    result,
                    style: new TextStyle(
                    fontSize: 25.0,
                    color: Colors.red,
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}