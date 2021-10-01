import 'package:flutter/material.dart';
import 'package:projectfour/model/user.dart';
import 'package:projectfour/screens/user_details.dart';
import 'package:projectfour/service/user_service.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<User> usersList = [];
  bool isLoading = true;

  getUserList() async {
    usersList = await UserService().getUser();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Padding(
                        padding: EdgeInsets.all(8.0),
                        child:TextButton
                            (onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails(sentUser:usersList[index])),);
                        }
                            , child: Text("${usersList[index].name}"))
                      ),
                      trailing: Icon(Icons.people));
                }));
  }
}
