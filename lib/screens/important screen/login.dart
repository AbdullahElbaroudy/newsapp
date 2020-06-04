import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/screens/home_screen.dart';
import 'package:flutterappnewsapp/utilites/data_utilies.dart';
import 'package:flutterappnewsapp/api/authentication_api.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  AuthenticationApi authenticationApi = AuthenticationApi();
  final _forKey = GlobalKey<FormState>();
  bool _errorUserNameOrPassword = false;
  bool isLoading = false;
  TextEditingController _userNameController ;
  TextEditingController _passwordController ;
  String username;
  String password;

  @override
  void initState() {
    _userNameController =TextEditingController();
    _passwordController =TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: (isLoading) ? loading() : _drawLoginForm(),
      ),
    );
  }

  Widget _drawLoginForm() {
     if(_errorUserNameOrPassword){
       return _error();
     }else{
    return Form(
      key: _forKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _userNameController,
            validator: (value) {
              if (value.isEmpty) {
                return "pleas enter your Name";
              }
            },
            decoration: InputDecoration(labelText: "Enter your Name"),
          ),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.01,
          ),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value.isEmpty) {
                return "pleas enter your Password";
              }
            },
            decoration: InputDecoration(labelText: "Enter your Password"),
          ),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: RaisedButton(
              child: Text(
                "data",
                style: TextStyle(),
              ),
              onPressed: () async {
                if (_forKey.currentState.validate()) {
                  setState(() {
                    isLoading =true;
                  });
                  username =_userNameController.text.trim();
                  password =_passwordController.text;
                  var response = await authenticationApi.login(
                      username,password);//"rosella.krajcik@example.com", "password"
                  if (response) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ));
                  } else {
                      print("print from else");
                    setState(() {
                      isLoading =false;
                      _errorUserNameOrPassword = true;
                    });
                  }
                } else {}
              },
            ),
          ),
        ],
      ),
    );
     }
  }
 Widget _error() {
   return Container(
     child: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text("Error User name Or Password",style: TextStyle(fontSize: 22),),
           SizedBox(height: 10,),
           RaisedButton(child: Text("Go Back"),onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return Login();
             }));
           }),
         ],
       ),
     ),
   );
 }
}