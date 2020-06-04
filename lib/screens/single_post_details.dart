
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
    return Scaffold(
      body: CustomScrollView(
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
                      image: NetworkImage(widget.post.featuredImage) ,//ExactAssetImage("lib/assets/images/x1.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0) {
                return _postDetails();
              } else if (index > 0 && index < 19) {
                return _postComments();
              } else {
                return _makeComment();
              }
            }, childCount: 20),
          ),
        ],
      ),
    );
  }

  Widget _postComments() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.003,
                    ),
                    Text(
                      "data",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("data")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              "sadsadasdsadasjkdflhsi klflsdf hsdfjsdafj asdjkasjkdk ajklasdjkkl;a lasdkl;daslkasdklal; sjkadkjfsdsdf asdasdasda ",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _postDetails() {
    return Container(
      padding: EdgeInsets.only(
        top: 16,
        left: 8,
        right: 8,
        bottom: 8,
      ),
      child: Text(
        "${widget.post.content}${widget.post.content}${widget.post.content}${widget.post.content}",
        style: TextStyle(
          fontSize: 20,
          letterSpacing: 1,
          height: 1.25,
        ),
      ),
      color: Colors.green,
      height: 650,
    );
  }

  Widget _makeComment() {
    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            decoration: InputDecoration(fillColor: Color.fromRGBO(241, 245, 247, 1),filled: true,
                border: InputBorder.none, hintText: 'Enter a search term'),
          ),
        ),
          FlatButton(onPressed: (){}, child: Text("SEND",style: TextStyle(color: Colors.red,letterSpacing: 1.3),)),
      ],
    );
  }
}
