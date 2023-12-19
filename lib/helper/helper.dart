import 'dart:collection';

import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  //Saving data
  saveDataFromSf(String username, String email, String password) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString('username', username);
    sf.setString('email', email);
    sf.setString('password', password);
  }

  //Get user data
  Future<Map> getDataFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    final HashMap<String, dynamic> map = HashMap();
    map.addAll({
      'username': sf.getString('username'),
      'email': sf.getString('email'),
      'password': sf.getString('password')
    });
    return map;
  }

  //Check user data
  Future<bool> checkDataFromSf() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String username = sf.getString('username')!;
    String email = sf.getString('email')!;
    String password = sf.getString('password')!;
    return username.isNotEmpty && email.isNotEmpty && password.isNotEmpty
        ? true
        : false;
  }
}
