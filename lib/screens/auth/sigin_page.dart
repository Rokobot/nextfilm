import 'package:flutter/material.dart';
import 'package:nextfilm/extentions/extentions.dart';
import 'package:nextfilm/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _keyValue = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in',
                style: TextStyle(fontSize: 42),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Divider(
                  height: 0.2,
                  color: Colors.grey,
                ),
              ),
              Form(
                  key: _keyValue,
                  child: Column(
                    children: [
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
                      )
                    ],
                  )),
              MaterialButton(
                color: Colors.green,
                onPressed: () {},
                child: Text(
                  'sign in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              GestureDetector(
                  onTap: () {
                    replaceNextScreen(context, '/SignUpPage');
                  },
                  child: Text('no have any account?'))
            ],
          ),
        ),
      ),
    );
  }
}
