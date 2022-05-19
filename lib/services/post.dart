import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Post {
  final String API_URL = "https://accosoi.com/wp-json/wp/v2/posts?_embed&per_page=35";
  final String API_pop = "https://accosoi.com/wp-json/wp/v2/posts?_embed&categories=373";

  Future<List> getAllPost() async {
    String fileName = "CacheData.json";
    var cacheDir = await getTemporaryDirectory();

    if (await File(cacheDir.path + "/" + fileName).exists()) {
      print("Loading from cache");
      //TOD0: Reading from the json File
      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();
      var response = json.decode(jsonData);
      return response;
    }
    else {
      print("Loading from API");
      var response = await http.get(Uri.parse(API_URL), headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        var res = json.decode(jsonResponse);
        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + "/" + fileName);
        file.writeAsString(jsonResponse, flush: true, mode: FileMode.write);

        return res;
      }
    }
    return Future.value();
  }

  Future<void> deleteCacheContents() async {
    final cacheDir = await getTemporaryDirectory();
    String fileName = "CacheData.json";
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      cacheDir.delete(recursive: true);
      print( "Deleted the CacheJson file!!");
    }
  }

  Future<List> getPupPost() async {
    String fileName = "Cachepost.json";
    var cachePostDir = await getTemporaryDirectory();

    if (await File(cachePostDir.path + "/" + fileName).exists()) {
      print("Loading from cache");
      //TOD0: Reading from the json File
      var jsonData = File(cachePostDir.path + "/" + fileName).readAsStringSync();
      var response = json.decode(jsonData);
      return response;
    }
    else {
      print("Loading from API");
      var response = await http.get(Uri.parse(API_pop), headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        var res = json.decode(jsonResponse);
        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + "/" + fileName);
        file.writeAsString(jsonResponse, flush: true, mode: FileMode.write);

        return res;
      }
    }
    return Future.value();
  }

  Future<void> deleteCachePupPost() async {
    final cacheDir = await getTemporaryDirectory();
    String fileName = "Cachepost.json";
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      cacheDir.delete(recursive: true);
      print( "Deleted the CacheJson file!!");
    }
  }
}
