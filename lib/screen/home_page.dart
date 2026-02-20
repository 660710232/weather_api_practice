import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_api_practice/model/user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? userData;
  final TextEditingController _idSearchController = TextEditingController();
  void fetchUser() async {
    try {
      var response = await http.get(Uri.parse("https://dummyjson.com/users/${_idSearchController.text}"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        User user = User.fromJson(data);

        setState(() {
          userData = user;
        });
        print('Name : ${user.firstName}');
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Weather")),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: _idSearchController ,
              decoration: InputDecoration(
                labelText: 'ID'
              ),
            ),
            Text("Name : ${userData?.firstName}"),
            Text("Username : ${userData?.username}"),
            Text("Email : ${userData?.email}"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fetchUser();
                });
              },
              child: Text("Call API"),
            ),
          ],
        ),
      ),
    );
  }
}
