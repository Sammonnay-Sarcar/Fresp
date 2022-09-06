import 'package:flutter/cupertino.dart';
import 'package:fresp/constants/error_handling.dart';
import 'package:fresp/constants/global_variables.dart';
import 'package:fresp/constants/utils.dart';
import 'package:fresp/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //signUp user
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(id: '', name: '', password: '', number: '', token: '');
      http.Response res = await http.post(Uri.parse('$uri/api/v1/user/'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json: charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account created! login with the same credentials');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
