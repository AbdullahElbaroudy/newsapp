import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/models/tab_model.dart';
import 'package:flutterappnewsapp/screens/home%20tabs/favorites.dart';
import 'package:flutterappnewsapp/screens/home%20tabs/popular.dart';
import 'package:flutterappnewsapp/screens/home%20tabs/whats_new.dart';
import 'package:flutterappnewsapp/shared%20ui/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopUpMenue { Help, Setings, Contact, About }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<TabModel> tabs;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 2, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    tabs = List<TabModel>();
    tabs.add(TabModel('Whats New', 'Describstion 11', Colors.red));
    tabs.add(TabModel('Popular', 'Describstion 22', Colors.red));
    tabs.add(TabModel('Favorites', 'Describstion 33', Colors.red));
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        bottom: TabBar(
          indicatorColor: Colors.red,
          controller: _tabController,
          labelPadding: EdgeInsets.only(top: 0),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.whatshot),
              text: tabs[0].title,
            ),
            Tab(
              icon: Icon(Icons.people),
              text: tabs[1].title,
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: tabs[2].title,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          _popUp(context),
        ],
        title: Text('Explore'),
      ),
      body: Center(
        child: TabBarView(
          children: [
            WhatsNew(),
            Popular(),
            Favorites(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _popUp(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopUpMenue>(
            child: Text('Help'),
            value: PopUpMenue.Help,
          ),
          PopupMenuItem<PopUpMenue>(
            child: Text('Seteings'),
            value: PopUpMenue.Setings,
          ),
        ];
      },
    );
  }

  Widget _popOutMenue(BuildContext context) {
    return PopupMenuButton<PopUpMenue>(
      onSelected: (PopUpMenue exploreMenue) {},
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopUpMenue>(
            child: Text('asddasdsa'),
            value: PopUpMenue.Help,
          ),
          PopupMenuItem<PopUpMenue>(
            child: Text('asddasdsa'),
            value: PopUpMenue.Help,
          ),
          PopupMenuItem<PopUpMenue>(
            child: Text('asddasdsa'),
            value: PopUpMenue.Help,
          ),
        ];
      },
    );
  }
}
