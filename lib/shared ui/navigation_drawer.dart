import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/models/navigation_model.dart';
import 'package:flutterappnewsapp/screens/home_screen.dart';
import 'package:flutterappnewsapp/screens/twitterfeed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    List<NavigationModel> navigator = [
      NavigationModel("Explore", ()=> HomeScreen() ),
      NavigationModel("TwetterFeed", ()=> TwetterFeed() ),
    ];
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
