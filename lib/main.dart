import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/screens/home_screen.dart';
import 'package:flutterappnewsapp/screens/onboarding.dart';
import 'package:flutterappnewsapp/screens/test%20screens/self_code.dart';
import 'package:flutterappnewsapp/screens/twitterfeed.dart';

void main()
{

  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen() //HomeScreen(),
    );
  }
}
