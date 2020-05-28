import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/api/posts_api.dart';
import 'package:flutterappnewsapp/models/post_model.dart';
import 'package:flutterappnewsapp/utilites/data_utilies.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsApi postsApi = PostsApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsApi.featchPostsCategory("1"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return errorConnection();
            ///////////////////////
            break;
          case ConnectionState.waiting:
            return loading();
            ////////////////////////
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return errorSnapshot(snapshot.error);
              //////////////////
            } else {
              if (snapshot.hasData) {
                List<Post> posts = List<Post>();
                posts = snapshot.data;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return _buildSingleCard(posts[index]);
                  },
                );
              } else {
                return errorNoData();
                ///////////
              }
            }
            break;
        }

        return Container();
      },
    );
  }

  Card _buildSingleCard(Post post) {
    return Card(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                  post.featuredImage,
                ),fit: BoxFit.cover
              )),
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
                Text(
                  '${post.title}The world Global Warning Anual Sumbmite',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(post.title,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          size: MediaQuery.of(context).size.width*0.05 ,
                        ),
                        Text(post.dateWritten,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035),)
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
