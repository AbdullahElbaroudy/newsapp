import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/screens/test%20screens/elbaroudy.dart';
import 'package:flutterappnewsapp/shared%20ui/navigation_drawer.dart';

class Abdallah extends StatefulWidget {
  @override
  _AbdallahState createState() => _AbdallahState();
}

class _AbdallahState extends State<Abdallah> with SingleTickerProviderStateMixin {
  TabController _tabcont ;

  @override
  void initState() {
    super.initState();
    _tabcont = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app bar title'),
        bottom: TabBar(
          controller: _tabcont ,
          tabs: [
            Tab(
              text: 'Tab 1',
              icon: Icon(Icons.looks_one),
            ),
            Tab(
              text: 'Tab 2',
              icon: Icon(Icons.looks_one),
            ),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.people),
          Icon(Icons.favorite),
        ],
      ),
      drawer: NavigationDrawer(),
      body: TabBarView(
        controller: _tabcont,
        children: [
        Elbaroudy1(),Elbaroudy2()
      ],),
    );
  }
}
