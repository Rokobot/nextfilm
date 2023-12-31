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
  bool _visibility = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroudnColor,
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
      },
    );
  }

  signinWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        RiveAnimation.asset('assets/background_rive.riv', fit: BoxFit.fitHeight,),
        Container(color: Colors.black.withOpacity(0.2),),Container(color: Colors.black.withOpacity(0.5),),
        BackdropFilter(filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50), child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
                                obscureText: _visibility,
                                controller: passwordController,
                                decoration:
                                InputDecoration(hintText: 'password', suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _visibility =! _visibility;
                                    });
                                  },
                                  icon: _visibility ? Icon(Icons.visibility_off) :  Icon(Icons.visibility),
                                )).custmDecoration,
                              ),
                            )
                          ],
                        )),
                    ElevatedButton(
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.green),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
    ),
                      onPressed: () {
                        context.read<AuthBloc>().add(SigninEvent(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            context: context
                        ));
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
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),),

      ],
    );
  }
}
