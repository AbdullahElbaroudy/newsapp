import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/screens/home_screen.dart';
import 'utilites/app_theme.dart';

void main()
 {
  //SharedPreferences preferences = await SharedPreferences.getInstance();
 // bool seen = preferences.getBool('seen');
  runApp(NewsApp(HomeScreen()));
//  if (seen == null || seen == false){
//    preferences.setBool('seen',true);
//    runApp(NewsApp(OnBoarding()));
//  }else{
//    runApp(NewsApp(HomeScreen()));
//  }

}

class NewsApp extends StatelessWidget {
  Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: _screen //HomeScreen(),
    );
  }
}
