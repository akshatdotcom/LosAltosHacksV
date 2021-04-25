//import 'package:flutter/material.dart';
//import 'package:teachapp/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  var url = Uri.parse('http://198.58.104.224:5000/');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var res = response.body.split('[')[1].split('])</h1>')[0];
    res = res.replaceAll('&#39;', '\'');
    print('Response: $res');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  //runApp(MyApp());
}
/*
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
}*/