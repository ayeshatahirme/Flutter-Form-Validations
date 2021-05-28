import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _checked = false;
  String _username = '';
  String _email = '';
  String _mobile_no = '';
  String _password = '';
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form'),
      ),
      body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back),
              Text(
                'Register',
                style: TextStyle(
                  height: 2,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                'Signup to experience new ways',
                style: TextStyle(
                  height: 2,
                  fontSize: 16,
                  color: Colors.grey,
                  ),
                ),
              SizedBox(
                height: 15,
              ),
              //User Name
              ListTile(
                title: TextFormField(
                  onChanged: (value) {
                    _username = value;
                  },
                  validator: (value){
                    int len = value.length;
                    if(len == 0){
                      return 'This field cannot be empty.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.red,),
                    labelText: 'User Name',
                    labelStyle: TextStyle(
                    ),
                  ),
                ),
              ),
              //Email
              ListTile(
                title: TextFormField(
                  validator: (value) => !value.contains('@')? 'Enter a valid email': null,
                  onSaved: (value) => _email = value,
                  onChanged: (value) {
                    _email = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Email',
                  ),
                ),
              ),
              //Phone No
              ListTile(
                title: TextFormField(
                  validator: (value){
                    int len = value.length;
                    if(len == 0){
                      return 'This field cannot be empty.';
                    }
                     else if(len < 11){
                      return 'Invalid Mobile no';
                    }
                    else if(len > 11){
                      return 'Invalid Mobile no';
                    }
                    return null;
                  },
                  onSaved: (value) => _mobile_no = value,
                  onChanged: (value) {
                    _mobile_no = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Mobile No',
                  ),
                ),
              ),
              //Password
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be empty';
                    }
                    else if (value.length < 5){
                      return 'Enter a strong password';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                  obscureText: _obscureText,
                  onChanged: (value) {
                    _password = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        ),
                      ),
                  ),
                  onPressed: () {
                    if(this._formKey.currentState.validate() && _checked != true){
                      showDialog(
                      context: context, 
                      builder: (ctx) => AlertDialog(
                        title: Text('Please accept the term and conditions.'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: (){
                              Navigator.of(ctx).pop();
                              }, 
                            child: Text('Ok'),
                            ),
                        ],
                      )
                      );
                    }
                    else if(this._formKey.currentState.validate() && _checked == true) {
                      this._formKey.currentState.save();

                      showDialog(
                      context: context, 
                      builder: (ctx) => AlertDialog(
                        title: Text('Registered Successfully!'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: (){
                              Navigator.of(ctx).pop();
                            }, 
                            child: Text('Ok'),
                            ),
                        ],
                      )
                      );
                    }
                  }
                )
              ),
              SizedBox(
                height: 10,
              ),
               Column(
                 children: [
                   Row(
                     children: [
                      Checkbox(
                        value: _checked,
                        onChanged: (value) {
                          this.setState(() {
                            _checked = value;
                          });
                        },
                        ),
                        Text(
                          'I accept the ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            ),
                          ),
                          Text(
                          'Term & Conditions',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            ),
                          ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                   )
                 ],
               )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
