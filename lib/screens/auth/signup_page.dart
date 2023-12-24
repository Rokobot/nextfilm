import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextfilm/bloc/bloc/auth_bloc.dart';
import 'package:nextfilm/const/consts.dart';
import 'package:nextfilm/extentions/extentions.dart';
import 'package:nextfilm/helper/helper.dart';
import 'package:nextfilm/widgets/methods.dart';
import 'package:rive/rive.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _visibilty = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      backgroundColor: backgroudnColor,
      body: SafeArea(
        child: Center(
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
    );
  }

  signupWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        RiveAnimation.asset('assets/background_rive.riv', fit: BoxFit.fitHeight,),
    Container(color: Colors.black.withOpacity(0.5),),
    BackdropFilter(filter: ImageFilter.blur(sigmaY: 50, sigmaX: 50), child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('Nextfilm', style: TextStyle(color: Colors.red, fontSize: 60),),
      Container(
      decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.6),
      borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Form(
      key: _keyValue,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
      controller: usernameController,
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
      controller: emailController,
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
      controller: passwordController,
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
      context.read<AuthBloc>().add(SignupEvent(
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      context: context
      ));
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
      ])),
      SizedBox(
      height: 10,
      ),
      ],
      ),
      ),
      ],
      ),
    ))
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
