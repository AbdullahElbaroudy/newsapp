import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _forKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _forKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter your name";
                      }
                    },
                    decoration: InputDecoration(labelText: "enter your Name"),
                  ),
                  TextFormField(
                    validator: (value) {
                      return "please enter your Email";
                    },
                    decoration: InputDecoration(labelText: "Enter your email "),
                  ),
                  TextFormField(
                    validator: (value) {
                      return "please enter your Message";
                    },
                    maxLines: 8,
                    decoration:
                        InputDecoration(labelText: "Enter your message"),
                  ),
                  SizedBox(height: 25,),
                  FlatButton(
                    onPressed: () {
                      if(_forKey.currentState.validate()){

                      }
                    },
                    child: Text("SEND"),color: Colors.blue,
                  ),
                ],
              )),
        ));
  }
}
