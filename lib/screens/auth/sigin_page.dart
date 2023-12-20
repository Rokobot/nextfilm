import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextfilm/bloc/bloc/auth_bloc.dart';
import 'package:nextfilm/extentions/extentions.dart';
import 'package:nextfilm/helper/helper.dart';
import 'package:nextfilm/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _keyValue = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
    HelperFunction().getDataFromSF().then((value) {
      setState(() {
        email = value['email'];
        password = value['password'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial) {
                return signinWidget(context);
              }
              if (state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              if (state is AuthSucces) {
                return signinWidget(context);
              }
              if (state is AuthError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  return showSnackbar(context, state.error);
                });
              }
              return signinWidget(context);
            },
          ),
        ),
      ),
    );
  }

  Column signinWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sign in',
          style: TextStyle(fontSize: 42),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                    controller: emailController,
                    decoration:
                        InputDecoration(hintText: 'email').custmDecoration,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration:
                        InputDecoration(hintText: 'password').custmDecoration,
                  ),
                )
              ],
            )),
        MaterialButton(
          color: Colors.green,
          onPressed: () {
            Future(() {
              context.read<AuthBloc>().add(SigninEvent(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim()));
            }).then((value) {
              replaceNextScreen(context, '/HomePage');
            });
          },
          child: Text(
            'sign in',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 21,
        ),
        Text.rich(TextSpan(text: 'no have any account?', children: [
          TextSpan(
              text: 'SignUp',
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () => {replaceNextScreen(context, '/SignUpPage')})
        ])),
      ],
    );
  }
}
