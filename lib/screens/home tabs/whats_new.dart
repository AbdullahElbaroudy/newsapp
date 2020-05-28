import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/api/posts_api.dart';
import 'package:flutterappnewsapp/models/post_model.dart';
import 'package:flutterappnewsapp/utilites/data_utilies.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    PostsApi postsApi = PostsApi();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(postsApi, context),
          _drawTitleText('Recently updated'),
          _drawRecentlyUpdats(postsApi),
        ],
      ),
    );
  }

  _drawRecentlyUpdats(PostsApi postsApi) {
    return FutureBuilder(
      future: postsApi.featchPostsCategory("11"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return errorConnection();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return errorSnapshot(snapshot.error);
            } else {
              if (snapshot.hasData) {
                List<Post> post = snapshot.data;
                return Column(
                  children: <Widget>[
                    _drawRecentUpdateCard(Colors.red, post[0]),
                    _drawRecentUpdateCard(Colors.green, post[1]),
                  ],
                );
              } else {
                return errorNoData();
              }
            }
            break;
        }
        return Container();
      },
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
      color: Colors.black,
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.25,
      child: Center(
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
    );
  }

  Widget _drawTopStories(PostsApi postsApi, BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FutureBuilder(
          future: postsApi.featchPostsCategory("1"),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return loading();
                break;
              case ConnectionState.waiting:
                return loading();
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  // TODO : handle Error
                  return errorSnapshot(snapshot.error);
                } else {
                  if (snapshot.hasData) {
                    List<Post> posts = List<Post>();
                    posts = snapshot.data;
                    Post post1 = snapshot.data[0];
                    Post post2 = snapshot.data[1];
                    Post post3 = snapshot.data[2];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _drawTitleText('Stories'),
                        _costumCard(post1),
                        _costumCard(post2),
                        _costumCard(post3),
                      ],
                    );
                  } else {
                    //TODO Handle No Data
                    return errorNoData();
                  }
                }
                break;
              case ConnectionState.none:
              // TODO : handle Error
                return errorConnection();
            }
            return Container();
          },
        ),
      ),
    );
  }


  Widget _costumCard(Post post) {
    return Container(
      padding: EdgeInsets.all(MediaQuery
          .of(context)
          .size
          .height * 0.001),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery
              .of(context)
              .size
              .height * 0.009),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.35,
                child: Image.network(
                  post.featuredImage,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .height * 0.005,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.001,
                    ),
                    Text(
                      post.title.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.03),
                    ),
                    Text(
                      post.content,
                      style: TextStyle(
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.02),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          post.id,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.02),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              size: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.028,
                            ),
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.01,
                            ),
                            Text(
                              post.dateWritten,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height *
                                      0.02),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

  Widget _drawRecentUpdateCard(Color color, Post post) {
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 1,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(post.featuredImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: customBoxRecently(post.title, color),
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
                      Text(post.dateWritten),
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
