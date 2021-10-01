import 'package:dio/dio.dart';
import 'package:projectfour/model/user.dart';

class UserService {
  String baseUrl = "http://jsonplaceholder.typicode.com";
  String usersLink = "/users";

  Future<List<User>> getUser() async {
    List<User> usersList = [];
    Response response = await Dio().get('$baseUrl$usersLink');
    var data = response.data;

    data.forEach((element){
      User newUser = User.fromJson(element);
      usersList.add(newUser);
    });
    return usersList;
  }
}
