import 'dart:convert';

import 'package:flutter_wordpress_api_get_post/widgets/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var data = [];
  List<Posts> results = [];
  String urlList = 'https://accosoi.com/wp-json/wc/v3/posts';
  var client = http.Client();
  Future<List<Posts>> fetchPosts(String query) async {
    var url = Uri.parse(urlList);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => Posts.fromJson(e)).toList();
        results = results.where((element) => element.title.toLowerCase().contains((query.toLowerCase()))).toList();
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}