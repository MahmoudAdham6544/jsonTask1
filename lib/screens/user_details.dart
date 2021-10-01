import 'package:flutter/material.dart';
import 'package:projectfour/model/user.dart';

class UserDetails extends StatefulWidget {
  User sentUser;
  UserDetails({this.sentUser});
  @override
  _UserDetailsState createState() => _UserDetailsState();

  getUser() {
    return sentUser;
  }
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(100,0,0,0),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Full Name : " + "${widget.sentUser.name}"),
              Text("Username : " + "${widget.sentUser.username}"),
              Text("ID : " + "${widget.sentUser.id}"),
              Text("Email : " + "${widget.sentUser.email}"),
              Text("Website : " + "${widget.sentUser.website}"),
              Text("Phone : " + "${widget.sentUser.phone}"),
            ],
          ),
        ),
    );
  }
}
