import 'package:flutter/material.dart';
import 'package:teachapp/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'globals.dart';

void main() async {
  var url = Uri.parse('http://198.58.104.224:5000/');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var raws = response.body.split('<h1>')[1].split('</h1>')[0].split('---');
    var res = raws[0];
    res = res.replaceAll('&#34;', '\"');
    events = convert.jsonDecode(res);

    var sources = raws[1].replaceAll('&#34;', '\"');
    resources = convert.jsonDecode(sources);
    print(resources);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        cardColor: Colors.green,
      ),
      home: Home(),
    );
  }
}
