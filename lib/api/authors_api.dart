import 'package:flutterappnewsapp/models/author.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';
import 'package:flutterappnewsapp/utilites/api_utilites.dart';

class AuthorsApi {
  Future<List<Author>> featchAllAuthors() async {
    List<Author> authors = List<Author>();
    String allUsers = baseApiURL + apiAuthorsURL;
    var response = await Http.get(allUsers);
    if (response.statusCode == 200) {
      var textData = response.body;
      var decodedJsonData = jsonDecode(textData);
      var data = decodedJsonData["data"];
      for (var item in data) {
        authors.add(Author(
          id: item["id"].toString(),
          name: item["name"].toString(),
          avatar: item["avatar"].toString(),
          email: item["email"].toString(),
        ));
      }

      for (Author author in authors) {
        print(author.avatar);
      }
    }
  }
}
