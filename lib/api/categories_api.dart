import 'dart:convert';

import 'package:flutterappnewsapp/models/category_model.dart';
import 'package:http/http.dart' as Http;
import 'package:flutterappnewsapp/utilites/api_utilites.dart';

class CategoriesApi {

  Future<Category> featchCategoryWithID (String sId) async {
    Category category = Category();
    String categoryWithIdURL = baseApiURL +apiCategoryWithId + sId ;
    var response = await Http.get(categoryWithIdURL);
    if(response.statusCode == 200){
      var decodeResponse = jsonDecode(response.body);
      var data =decodeResponse["data"];
      category.id = data["id"].toString();
      category.title = data["title"].toString() ;
      print(category.id);
      print(category.title);
    }//end if
    return category;
  }

  Future<Category> featchCategoryTopStories () async {

        Category category = Category();
        String categoryTopStoriesURL = baseApiURL +apiCategoryTopStories ;
        var response = await Http.get(categoryTopStoriesURL);
        if(response.statusCode == 200){
          var decodeResponse = jsonDecode(response.body);
          var data =decodeResponse["data"];
          category.id = data["id"].toString();
          category.title = data["title"].toString() ;
          print(category.id);
          print(category.title);
        }//end if
        return category;
      }

  Future<Category> featchCategoryRecentlyUpdate () async {
    Category category = Category();
    String categoryRecentlyUpdateURL = baseApiURL +apiCategoryRecentlyUpdate ;
    var response = await Http.get(categoryRecentlyUpdateURL);
    if(response.statusCode == 200){
      var decodeResponse = jsonDecode(response.body);
      var data =decodeResponse["data"];
      category.id = data["id"].toString() ;
      category.title = data["title"].toString() ;
      print(category.id);
      print(category.title);
    }//end if
    return category;

     }

  Future<List<Category>> featchAllCategories() async {
    List<Category> categories = List<Category>();
    //String whatsNewsCategoryURL = baseApiURL + apiCategoryRecentlyUpdate;
    String allCategoriesURL = baseApiURL + apiCategories;
    var response = await Http.get(allCategoriesURL);
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      var data = decodedJson["data"];
      for (var item in data) {
        categories.add(Category(
          id: item["id"].toString(),
          title: item["title"].toString(),
        ));
      }
        for (Category category in categories) {
            print(category.id);
            print(category.title);
        }

      }
    return categories ;
    }
  }

