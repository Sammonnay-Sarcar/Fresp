import 'package:flutter/cupertino.dart';
import 'package:fresp/models/login_credentials.dart';
import 'package:fresp/models/user.dart';

class UserProvider with ChangeNotifier {
  // User _user = User(
  //     id: ' ', name: ' ', password: ' ', number: ' ', token: ' ', email: ' ');
  // User get user => _user;
  LoginCredentials _user = LoginCredentials(email: '', token: '');
  LoginCredentials get user => _user;
  void setUser(String user) {
    // print(user);
    _user = LoginCredentials.fromJson(user);
    notifyListeners();
  }
}
