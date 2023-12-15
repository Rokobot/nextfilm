import 'package:flutter/material.dart';
import 'package:nextfilm/extentions/extentions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _keyValue = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign up'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 0.2,
                    color: Colors.grey,
                  ),
                ),
                TextFormField(
                  key: _keyValue,
                  decoration: InputDecoration().custmDecoration,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
