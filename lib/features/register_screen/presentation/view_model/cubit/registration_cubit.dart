
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(context)=>BlocProvider.of<RegistrationCubit>(context);
 TextEditingController emailcont = TextEditingController();
 TextEditingController passcont = TextEditingController();


  Future<void> registration()async{
    emit(RegistrationLoading());
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcont.text,
      password: passcont.text,);
      
    }
    on FirebaseAuthException catch(e){
      emit(RegistrationError(errorMsg: e.message!));
    }
    catch (e){
    emit(RegistrationError(errorMsg: e.toString()));
    }

  }
}
