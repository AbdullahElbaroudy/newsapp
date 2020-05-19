import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/shared%20ui/navigation_drawer.dart';

class TwetterFeed extends StatefulWidget {
  @override
  _TwetterFeedState createState() => _TwetterFeedState();
}

class _TwetterFeedState extends State<TwetterFeed> {
  String stringText =
      "Text normal string  , Hello from normal string text without me you dont able to contiue thanks for use";
  String _textLargRondom = "hello  from the large rondom text , thanks for all";
  Text _textBoldForTitle = Text(
    'Text Bold',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
  Text _textNormal = Text(
    'Text normal , Hello from normal text without me you dont able to contiue thanks for use',
    style: TextStyle(fontSize: 20),
  );
  Text _textShort = Text(
    'Text normal  short thanks for use',
    style: TextStyle(fontSize: 16),
  );
  Text _textVeryShort = Text(
    '@Short Text ',
    style: TextStyle(fontSize: 16),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Twitter Feed',
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: _twitterCard(),
          );
        },
      ),
    );
  }

  Widget _twitterCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _cardHeader(),
            SizedBox(height: 20,),
            _cardBody(),
            SizedBox(height: 20,),
            Divider(thickness: 1,),
            _cardFoter(),
          ],
        ),
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 30,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  _textBoldForTitle,
                  SizedBox(
                    width: 10,
                  ),
                  _textVeryShort
                ],
              ),
              _textShort,
            ],
          ),
        ),
      ],
    );
  }

  Widget _cardBody() {
    return Text(
      stringText,
      style: TextStyle(fontSize: 20, height: 1.5),
    );
  }

  Widget _cardFoter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.repeat,size: 35,),
            Text('data'),
          ],
        ),
        ButtonBar(
          children: <Widget>[
            Icon(Icons.favorite,size: 35,),
            Icon(Icons.turned_in_not,size: 35,),
          ],
        ),
      ],
    );
  }
}
