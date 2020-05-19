import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/models/page_model.dart';
import 'package:flutterappnewsapp/shared%20ui/navigation_drawer.dart';
import 'package:page_view_indicator/page_view_indicator.dart';


class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  ValueNotifier<int> _pageViewNotifer = ValueNotifier(0) ;

  List<PageModel> pages = [];

  @override
  Widget build(BuildContext context) {
    pages = List<PageModel>();

    pages.add(PageModel('lib/assets/images/x1.jpg', Icons.ac_unit, '_title',
        '_description_description_description_description'));
    pages.add(PageModel('lib/assets/images/x2.jpg', Icons.ac_unit, '_title22',
        '_description22_description22_description22_description22'));
    pages.add(PageModel('lib/assets/images/x3.jpg', Icons.add, '_title',
        '_description_description_description_description_description'));
    pages.add(PageModel('lib/assets/images/x3.jpg', Icons.favorite, '_title',
        '_description_description_description_description_description'));
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Stack(
        children: <Widget>[
          PageView.builder(

            itemBuilder: (BuildContext context, int index) {

              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(pages[index].image),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          pages[index].icon,
                          size: 150,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -50),
                      ),
                      Text(
                        pages[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 70, right: 70, top: 18),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index){
              _pageViewNotifer.value = index ;
            },
          ),
          Transform.translate(
            offset: Offset(0, 0),
            child: Align(
              alignment: Alignment.center,
              child: _packages_pageView(pages.length)
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                width: 400,
                child: RaisedButton(
                  child: Text(
                    'GET START',
                    style: TextStyle(
                      letterSpacing: 5,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red.shade800,
                  onPressed: () {},
                ),
              ),
            ),
          )
        ],
      ),
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
  List<Widget> _drawPageindecators()
  {
    List<Widget> _widget =[];
    print(pages.length);
    int i;
    for( i=0 ;i<pages.length;i++)
      {
        _widget.add(_drowCircle(Colors.red));
      }
    return _widget;
  }
  Widget _drowCircle(Color color)
  {
    return Container(
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class Pageindecator
{
  int _index ;
  Color color ;

  Pageindecator(this._index, this.color);

  Widget _drowCircle(Color color)
{
  return Container(
    width: 20,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.red,
    ),
  );
}

}