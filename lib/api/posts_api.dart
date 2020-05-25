import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:flutterappnewsapp/models/post_model.dart';
import 'package:flutterappnewsapp/utilites/api_utilites.dart';

class PostsApi {
  Future<List<Post>> featchAllPosts() async {
    List<Post> posts = List<Post>();
    String allPostsURL = baseApiURL + apiPostsURL;
    var response = await Http.get(allPostsURL);
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      var data = decodedJson["data"];
      for (var item in data) {
        posts.add(
            Post(
          title: item["title"].toString(),
          id: item["id"].toString(),
          categoryId: item["categoryId"].toString(),
          content: item["content"].toString(),
          createdAt: item["createdAt"].toString(),
          dateWritten: item["dateWritten"].toString(),
          featuredImage: item["featuredImage"].toString(),
          updatedAt: item["updatedAt"].toString(),
          userId: item["userId"].toString(),
          voteDown: item["voteDown"].toString(),
          voteUp: item["voteUp"].toString(),
        ));
      }

      for(Post post in posts){
        print(post.id);
      }
    }
    return posts;
  }
}
