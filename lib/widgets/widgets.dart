import 'package:flutter/material.dart';
import 'package:nextfilm/screens/auth/sigin_page.dart';

nextScreen(context, name) {
  return Navigator.pushNamed(context, name);
}

replaceNextScreen(context, name) {
  return Navigator.pushReplacementNamed(context, name);
}
