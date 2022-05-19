import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class HealthFitnessApi {
  String baseUrl = "https://accosoi.com/wp-json/wp/v2/posts?_embed&categories=14&per_page=50";
  var data = [];
  Future<List> getAllPage() async {
    String fileName = "CacheFitnessHealth.json";
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
      var response = await http.get(Uri.parse(baseUrl), headers: {"Accept": "application/json"});

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
    String fileName = "CacheFitnessHealth.json";
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      cacheDir.delete(recursive: true);
      print( "Deleted the CacheJson file!!");
    }
  }
}
