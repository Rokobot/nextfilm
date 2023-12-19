import 'package:flutter/material.dart';

//Custom Decoration of input border
extension customDecoration on InputDecoration {
  static final customEnabled = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.blue));

  static final customError = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red));

  static final customFocused = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.green));

  InputDecoration get custmDecoration {
    return this.copyWith(
        enabledBorder: customEnabled,
        errorBorder: customError,
        focusedBorder: customFocused);
  }
}
