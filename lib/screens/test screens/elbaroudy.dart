import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/models/page_model.dart';
import 'package:page_view_indicator/page_view_indicator.dart';


class Elbaroudy1 extends StatefulWidget {
  @override
  _Elbaroudy1State createState() => _Elbaroudy1State();
}

class _Elbaroudy1State extends State<Elbaroudy1> {

  List<PageModel> pages_elbaroudy;
  ValueNotifier<int> _pageViewNotifer;

  @override
  Widget build(BuildContext context) {
    pages_elbaroudy = List<PageModel>();

    pages_elbaroudy.add(PageModel('lib/assets/images/x1.jpg',Icons.add,'titlesss','Description'));
    pages_elbaroudy.add(PageModel('lib/assets/images/x2.jpg',Icons.add,'titlesss','Description'));
    pages_elbaroudy.add(PageModel('lib/assets/images/x3.jpg',Icons.add,'titlesss','Description'));

    return
       PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(
                  pages_elbaroudy[index].image
                ),
                  fit: BoxFit.fill
                )
              ) ,
            );
          },
        itemCount: pages_elbaroudy.length,
        onPageChanged: (index){
          _pageViewNotifer.value = index ;
        },
      );
  }

  Widget _packages_pageView(int length)
  {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifer ,
      length: length, // length >> mean that how many circle do you need
      normalBuilder: (animationController, index) => Circle(
        size: 14.0,
        color: Colors.black87,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 25.0,
          color: Colors.black45,
        ),
      ),
    );
  }
}











class Elbaroudy2 extends StatefulWidget {
  @override
  _Elbaroudy2State createState() => _Elbaroudy2State();
}

class _Elbaroudy2State extends State<Elbaroudy2> {
  ValueNotifier<int> _pageViewNotifer = ValueNotifier(0) ;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemBuilder: (BuildContext context, int index)
        {
          return Stack(
            children: <Widget>[
              Container(color: Colors.red),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: ExactAssetImage('lib/assets/images/x1.jpg'))),),
                  ),
              Column(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.build,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Center(
                      child: Text(
                        'Elbaroudy',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 35
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.topCenter,
                child: _packages_pageView(2) ,
              )
          ]
          );
        },
      itemCount: 2,
      onPageChanged: (index){
        _pageViewNotifer.value =index;
      },
    );

  }

  Widget _packages_pageView(int length)
  {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifer ,
      length: length, // length >> mean that how many circle do you need
      normalBuilder: (animationController, index) => Circle(
        size: 14.0,
        color: Colors.black87,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 25.0,
          color: Colors.black45,
        ),
      ),
    );
  }
}
