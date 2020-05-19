import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        index = index+1;
        return _buildSingleCard();
      },
    );
  }



  Card _buildSingleCard() {
    return Card(
          child:Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width *0.4,
                  height: MediaQuery.of(context).size.height *0.15,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                  width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text('The world Global Warning Anual Sumbmite',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                     SizedBox(height: 30,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Text('asdasdasd'),
                         Row(
                           children: <Widget>[
                             Icon(Icons.timer,),
                             Text('15 min')
                           ],
                         ),
                       ],
                     ),
                   ],
                ),
              ),
            ],
          ),

      );
  }
}
