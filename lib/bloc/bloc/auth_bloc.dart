import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextfilm/helper/helper.dart';
import 'package:nextfilm/services/auth_firebase_service.dart';
import 'package:nextfilm/widgets/methods.dart';

import '../../const/consts.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SigninEvent>(SigninMethod);
    on<SignupEvent>(SignupMethod);
    on<SignOutEvent>(SignoutMethd);
  }

  //To sign up firebase-firestore
  SignupMethod(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if (event.username.isNotEmpty &&
        event.email.isNotEmpty &&
        event.password.isNotEmpty) {
      await AuthFirebaseService(
              username: event.username,
              email: event.email,
              password: event.password)
          .signupUser()
          .then((value) {
        if (value == true) {
          HelperFunction().saveDataFromSf(event.username, event.email, event.password);
          replaceNextScreen(event.context, '/HomePage');
          emit(AuthSucces());
        } else {
          emit(AuthError(error: value.toString()));
        }
      });
    } else {
      emit(AuthError(error: 'Check out your information'));
    }
  }

  //To sign in firebase-firestore
  SigninMethod(SigninEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if (event.email.isNotEmpty || event.password.isNotEmpty) {
      await AuthFirebaseService(
              email: event.email, password: event.password, username: '')
          .siginUser()
          .then((value) {
        if (value == true) {
          replaceNextScreen(event.context, '/HomePage');
          emit(AuthSucces());
        } else {
          emit(AuthError(error: value.toString()));
        }
      });
    } else {
      emit(AuthError(error: 'Check out your information'));
    }
  }


  //Signout fom the app
  SignoutMethd(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await AuthFirebaseService(email: '', password: '', username: '')
        .getSignOut()
        .then((value) {
      if (value == true) {
        return showDialog(context: event.context, builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: backgroudnColor.withOpacity(0.9),
            title: Text('signout', style: TextStyle(color: Colors.white),),
            content: Text('are you sure signout ?', style: TextStyle(color: Colors.white),),
            actions: [
              ElevatedButton(onPressed: (){
                removeUntilScreen(context, '/SignInPage', '/HomePage');
                emit(AuthSignOut());
              }, child: Text('yes',style: TextStyle(color: Colors.white),), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0),),),),),
              ElevatedButton(onPressed: (){
                Navigator.pop(event.context);
              }, child: Text('no',style: TextStyle(color: Colors.white),), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0),),),),),
            ],
          );
        });

      } else {
        emit(AuthError(error: value));
      }
    });
  }
}
