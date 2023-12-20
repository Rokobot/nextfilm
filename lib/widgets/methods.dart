import 'package:flutter/material.dart';

nextScreen(context, name) {
  return Navigator.pushNamed(context, name);
}

replaceNextScreen(context, name) {
  return Navigator.pushReplacementNamed(context, name);
}

showSnackbar(context, message) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}
