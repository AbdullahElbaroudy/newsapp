import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return _drawPostContaier();
      },
    );
  }

  Container _drawPostContaier() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.only(top: 20,right: 20 ,left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Michael Adams',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Timing',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.32,
                  ),
                  Icon(
                    Icons.turned_in_not,
                    size: 45,
                  ),
                ],
              ),
              // second Row
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.black,
                    height: MediaQuery.of(context).size.width * 0.33,
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Tech tens: Old phones are Save ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text('We also take about future you can set it down afer it set up',style: TextStyle(fontSize: 24,)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35,),
              Divider(thickness: 3,),
            ],
          ),
        ),
      );
  }
}
