import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nextfilm/extentions/extentions.dart';
import 'package:nextfilm/widgets/widgets.dart';

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
                Text(
                  'Sign up',
                  style: TextStyle(fontSize: 42),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 8, bottom: 10),
                  child: Divider(
                    height: 0.2,
                    color: Colors.grey,
                  ),
                ),
                Form(
                    key: _keyValue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'username')
                                .custmDecoration,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'email')
                                .custmDecoration,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'password')
                                .custmDecoration,
                          ),
                        ),
                      ],
                    )),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    validate();
                  },
                  child: Text(
                    'sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Text.rich(TextSpan(text: 'already have an account?', children: [
                  TextSpan(
                      text: 'SignIn',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => {replaceNextScreen(context, '/SignInPage')})
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  validate() {
    if (_keyValue.currentState!.validate()) {
      return showSnackbar(context, 'succes');
    } else {
      return null;
    }
  }
}
