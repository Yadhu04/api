import 'package:api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  late List<UserModel> intialList;
  List<UserModel>? searchedList;

  fetchData() async {
    String uri = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      List<UserModel> model = userModelFromJson(response.body);
      intialList = model;
      searchedList = intialList;
    } else {
      print('error : ${response.statusCode}');
    }
    notifyListeners();
  }

  searchFunction(String query) {
    late List<UserModel> resultList = [];
    if (query.isEmpty) {
      resultList = intialList;
    } else {
      resultList = intialList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    searchedList = resultList;
    notifyListeners();
  }
}
