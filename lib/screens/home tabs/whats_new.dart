import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _drawTitleText('Recently updated'),
          _drawRecentUpdateCard(Colors.deepOrange),
          _drawRecentUpdateCard(Colors.green),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _titleStyle = TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
    TextStyle _describtionStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'asdasdsadasdsadasd',
                style: _titleStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'asdsadsdasdsadasdasdadasdasdasdasdsadasdsadasd',
                style: _describtionStyle,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('lib/assets/images/Black background.PNG'),
              fit: BoxFit.cover)),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _drawTitleText('Stories'),
            _costumCard(),
            _costumCard(),
            _costumCard(),
            _costumCard(),
          ],
        ),
      ),
    );
  }

  Column _costumCard() {
    return Column(
      children: <Widget>[
        Card(
          child: Container(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 6, top: 10, bottom: 10, right: 10),
                  child: Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'sdfsdfsdfsdfdsfsfdsfds',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawTitleText(String titleText) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        titleText,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _drawRecentUpdateCard(Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image(
                        image: ExactAssetImage('lib/assets/images/x1.jpg'),
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: customBoxRecently('SPORT', color),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Text here text here ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                      ),
                      Text('15 min'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container customBoxRecently(String text, Color color) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
      height: 30,
      width: 100,
      child: Center(
        child: Text(
          text,
          style: TextStyle(letterSpacing: 5, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
