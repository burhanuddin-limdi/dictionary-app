import 'dart:async';

import 'package:dictionary/definition.model.dart';
import 'package:dictionary/home_page.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class FetchService {
  Future<List<Definition>?> getData() async {
    var client = http.Client();
    var uri = 'https://api.dictionaryapi.dev/api/v2/entries/en/$search';
    var url = Uri.parse(uri);
    var res = await client.get(url);
    if (res.statusCode == 200) {
      var json = res.body;
      return definitionFromJson(json);
    }
    return null;
  }
}
