// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fresp/constants/error_handling.dart';
import 'package:fresp/constants/global_variables.dart';
import 'package:fresp/constants/utils.dart';
import 'package:fresp/features/auth/screens/bottom_bar.dart';
import 'package:fresp/features/auth/screens/testscreen.dart';
import 'package:fresp/models/user.dart';
import 'package:fresp/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //signUp user
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name,
      required String number}) async {
    try {
      User user = User(
          id: '',
          email: email,
          name: name,
          password: password,
          number: number,
          token: '');
      http.Response res = await http.post(Uri.parse('$uri/api/v1/user'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json; charset=utf-8'
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

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/v1/user/login'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-type': 'application/json; charset=utf-8'
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

          Navigator.pushNamedAndRemoveUntil(
              context, BottomBarScreen.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get user data
  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(Uri.parse('$uri/api/v1/user/tokenIsValid'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=utf-8',
            'x-auth-token': token!
          });
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        //getUserData
        http.Response userRes = await http.get(Uri.parse('$uri/api/v1/user/'),
            headers: <String, String>{
              'Content-type': 'application/json; charset=utf-8',
              'x-auth-token': token
            });
        var userProvider = Provider.of<UserProvider>(context, listen: false);

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
