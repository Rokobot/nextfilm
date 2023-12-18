import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  String username;
  String email;
  String password;

  HelperFunction(
      {required this.username, required this.email, required this.password});

  //Saving data
  saveDataFromSf() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString('username', username);
    sf.setString('email', email);
    sf.setString('password', password);
  }

  //Get data
  Future<bool> getDataFromSf() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    username = sf.getString('username')!;
    email = sf.getString('email')!;
    password = sf.getString('password')!;
    return username.isNotEmpty || email.isNotEmpty || password.isNotEmpty
        ? true
        : false;
  }
}
