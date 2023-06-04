import 'package:amazonclone/constants/features/widgets/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      name: '',
      password: '',
      email: '',
      address: '',
      type: '',
      token: '');

  User get user => _user;

  void SetUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
