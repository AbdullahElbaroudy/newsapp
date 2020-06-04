import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/models/navigation_model.dart';
import 'package:flutterappnewsapp/screens/home_screen.dart';
import 'package:flutterappnewsapp/screens/important%20screen/login.dart';
import 'package:flutterappnewsapp/screens/twitterfeed.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  SharedPreferences sharedPreferences;
  static bool isLoggedIn = false; // static type is important here

  List<NavigationModel> navigator = [
    NavigationModel("Explore", () => HomeScreen()),
    NavigationModel("TwetterFeed", () => TwetterFeed()),
  ];

  _checkToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.get('token');
    setState(() {
      if ( token == null) {
        isLoggedIn = false;
      } else {
        isLoggedIn = true;
      }
    });
  }

  _logOut() {
    if(sharedPreferences != null){
      sharedPreferences.remove('token');
    }
    print(" token =  >>>>>>> ${sharedPreferences.get('token')}");
    return HomeScreen();
  }

  @override
  void initState() {
    (isLoggedIn)
        ? navigator.add(
            NavigationModel("Log Out", () => _logOut()),
          )
        : navigator.add(
            NavigationModel("Register", () => Login()),
          );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(this.mounted){_checkToken();
   }
    return Drawer(
      child: ListView.builder(
          itemCount: navigator.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(navigator[index].navTitle),
              leading: Icon(Icons.build),
              trailing: FlatButton.icon(
                color: Colors.deepOrange,
                label: Text('lable'),
                icon: Icon(Icons.build),
                onPressed: () {},
              ),
              subtitle: Text('Sub Title'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return navigator[index].navId();
                }));
              },
            );
          }),
    );
  }
}
