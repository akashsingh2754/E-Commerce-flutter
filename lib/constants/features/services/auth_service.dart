import 'dart:convert';

import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/constants/error_handling.dart';
import 'package:amazonclone/constants/features/home/screen/home_screen.dart';
import 'package:amazonclone/constants/features/widgets/models/user.dart';
import 'package:amazonclone/constants/global_variables.dart';
import 'package:amazonclone/constants/utils.dart';
import 'package:amazonclone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: "",
          name: name,
          password: password,
          email: email,
          address: "",
          type: "",
          token: "");
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onsucess: () {
            showSnackBar(
                context, "Account created! Login with same credentials");
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
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onsucess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            // ignore: use_build_context_synchronously
            Provider.of<UserProvider>(context, listen: false).SetUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routename, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //  get userdata
  // ignore: non_constant_identifier_names
  void GetUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        // user has used application for first  timee token will be an empty string
        prefs.setString('x-auth-token', '');
      }
      // after that we check whetther the token is valid or not for that we create an api in auth.js
      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        // get user data we need to create an api in auth.js
        // ignore: unused_local_variable
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );
        // ignore: unused_label

        // ignore: use_build_context_synchronously
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.SetUser(userRes.body);
      }

      // http.Response res = await http.post(
      //   Uri.parse('$uri/api/signin'),
      //   body: jsonEncode({'email': email, 'password': password}),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //   },
      // );

      // ignore: use_build_context_synchronously
      // httpErrorHandle(
      //     response: res,
      //     context: context,
      //     onsucess: () async {
      //       SharedPreferences prefs = await SharedPreferences.getInstance();
      //       // ignore: use_build_context_synchronously
      //       Provider.of<UserProvider>(context, listen: false).SetUser(res.body);
      //       await prefs.setString(
      //           'x-auth-token', jsonDecode(res.body)['token']);
      //       // ignore: use_build_context_synchronously
      //       Navigator.pushNamedAndRemoveUntil(
      //           context, HomeScreen.routename, (route) => false);
      //     });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

  // ignore: non_constant_identifier_names

