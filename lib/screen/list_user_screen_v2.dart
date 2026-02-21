import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_api_practice/model/user_data.dart';

class ListUserScreenV2 extends StatefulWidget {
  const ListUserScreenV2({super.key});
  @override
  State<ListUserScreenV2> createState() => _ListUserScreenV2State();
}

class _ListUserScreenV2State extends State<ListUserScreenV2> {
  var userData = [];
  List<User> listUserV2 = [];
  // final TextEditingController _idSearchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    setState(() {
      listUserV2 = [];
    });
    try {
      var response = await http.get(Uri.parse("https://dummyjson.com/users"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // User user = User.fromJson(data);
        // setState(() {
        //   userData = user;
        // });
        // print('Name : ${user.firstName}');
        List<dynamic> jsonList = data['users'];

        setState(() {
          listUserV2 = jsonList.map((item) => User.fromJson(item)).toList();
        });
        print(jsonList[0]);
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
      appBar: AppBar(title: Text("API Calling")),
      body: Center(
        child: ListView.separated(
          itemCount: listUserV2.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text('ID: ${listUserV2[index].id}'),
              title: Text(
                '${listUserV2[index].firstName} ${listUserV2[index].lastName}',
              ),
              subtitle: Text(listUserV2[index].email),
            );
          },
        ),
        // child: Column(
        //   children: [
        //     // TextFormField(
        //     //   controller: _idSearchController,
        //     //   decoration: InputDecoration(labelText: 'ID'),
        //     // ),
        //     // Text("Name : ${userData?.firstName}"),
        //     // Text("Username : ${userData?.username}"),
        //     // Text("Email : ${userData?.email}"),
        //     ElevatedButton(
        //       onPressed: () {
        //         setState(() {
        //           getUser();
        //         });
        //       },
        //       child: Text("Call API"),
        //     ),
        //     // ListView.separated(
        //     //   itemCount: userData.length,
        //     //   itemBuilder: (context, index) {
        //     //     return Text('$index ${userData[index + 1].firstName}');
        //     //   },
        //     //   separatorBuilder: (context, index) {
        //     //     return const Divider();
        //     //   },
        //     // ),
        //   ],
        // ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          getUser();
        },
        child: Text('refresh'),
      ),
    );
  }
}
