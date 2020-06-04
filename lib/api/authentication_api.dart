import 'dart:convert';
import 'package:flutterappnewsapp/utilites/api_utilites.dart';
import 'package:http/http.dart' as Http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationApi {

  Future<bool> login(String email, String password) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    Map<String, String> body = {"email": email, "password": password};
    String url = baseApiURL + apiGetToken;
    var response = await Http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      if (response.body == 'not found') {
        print("bas ya 7abiby ");
        return false;
      }
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];
      //dont miss that token has space "token "
      var token = data['token '];
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token);
      print(" string token ${token}");
      return true;
    } else {
      print(response.body);
      return false;
    }
    return false;
  }
}
