import 'package:flutter/material.dart';
import 'package:flutterappnewsapp/models/post_model.dart';

class SinglePostDetails extends StatefulWidget {
  final Post post;

  SinglePostDetails(this.post);

  @override
  _SinglePostDetailsState createState() => _SinglePostDetailsState();
}

class _SinglePostDetailsState extends State<SinglePostDetails> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.post.title),
            collapseMode: CollapseMode.parallax,
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.post.featuredImage),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  height: 50,
                ),
                Container(height: 50,
                  color: Colors.lightGreenAccent,
                )
              ],
            );
          },childCount: 20),
        ),
      ],
    );
  }
}
