import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextfilm/bloc/bloc/auth_bloc.dart';
import 'package:nextfilm/const/consts.dart';
import 'package:nextfilm/extentions/extentions.dart';
import 'package:nextfilm/helper/helper.dart';
import 'package:nextfilm/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _visibilty = false;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _visibilty;
  }

  final _keyValue = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthInitial) {
                  return signupWidget(context);
                }
                if (state is AuthSucces) {
                  return signupWidget(context);
                }
                if (state is AuthError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    return showSnackbar(context, state.error);
                  });
                }
                if (state is AuthLoading) {
                  return Center(
                    child: BackdropFilter(
                      child: CircularProgressIndicator(color: Colors.red),
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                    ),
                  );
                }
                return signupWidget(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Column signupWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sign up',
          style: TextStyle(fontSize: 42),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 10),
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
                    controller: username,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'username is invalid';
                      }
                    },
                    decoration:
                        InputDecoration(hintText: 'username').custmDecoration,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: email,
                    validator: (value) {
                      return value!.isEmpty ||
                              !RegExp(emailModel).hasMatch(value)
                          ? 'Enter valid mail'
                          : null;
                    },
                    decoration:
                        InputDecoration(hintText: 'email').custmDecoration,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: password,
                    obscureText: _visibilty,
                    validator: (value) {
                      if (value.toString().length < 6) {
                        return 'Enter password then 6 character';
                      }
                    },
                    decoration: InputDecoration(
                            hintText: 'password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _visibilty = !_visibilty;
                                  });
                                },
                                icon: Icon(_visibilty
                                    ? Icons.visibility_off
                                    : Icons.visibility)))
                        .custmDecoration,
                  ),
                ),
              ],
            )),
        MaterialButton(
          color: Colors.green,
          onPressed: () {
            validate();
            Future(() {
              context.read<AuthBloc>().add(SignupEvent(
                  username: username.text.trim(),
                  email: email.text.trim(),
                  password: password.text.trim()));
            }).then((_) {
              HelperFunction().saveDataFromSf(username.text.trim(),
                  email.text.trim(), password.text.trim());
              replaceNextScreen(context, '/HomePage');
            });
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
                ..onTap = () => {replaceNextScreen(context, '/SignInPage')})
        ]))
      ],
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
