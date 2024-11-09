import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ControlPage(),
    );
  }
}

class ControlPage extends StatelessWidget {
  final String url = 'http://192.168.86.41:5000/';
  final String apiKey = 'you_know_the_name';

  void sendRequest(String endpoint) async {
    final response = await http.post(
      Uri.parse(url + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'key': key}),
    );

    if (response.statusCode == 200) {
      print('Success: ${response.body}');
    } else {
      print('Failed: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PC Control')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => sendRequest('shutdown'),
              child: Text('Shut Down PC'),
            ),
            ElevatedButton(
              onPressed: () => sendRequest('startup'),
              child: Text('Start Up PC'),
            ),
          ],
        ),
      ),
    );
  }
}
