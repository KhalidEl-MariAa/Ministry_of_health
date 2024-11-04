import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  TextEditingController emailcont = TextEditingController();
 TextEditingController passcont = TextEditingController();


  Future<void> signIn()async{
    emit(SignInLoading());
    try{
      
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcont.text,
      password: passcont.text,);
      emit(SignInSuceess());
      
    }
    on FirebaseAuthException catch(e){
      emit(SignInError(errorMsg: e.message!));
    }
    catch (e){
    emit(SignInError(errorMsg: e.toString()));
    }

  }
}
