
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_hala_state.dart';

class AddHalaCubit extends Cubit<AddHalaState> {
  AddHalaCubit() : super(AddHalaInitial());

static AddHalaCubit get(context)=> BlocProvider.of<AddHalaCubit>(context);
TextEditingController patientNameCont = TextEditingController();
TextEditingController mobadraNameCont = TextEditingController();
TextEditingController hospitalNameCont = TextEditingController();
TextEditingController patientIDCont = TextEditingController();
TextEditingController resultCont = TextEditingController();
TextEditingController patientPhoneCont = TextEditingController();
TextEditingController inputPhoneCont = TextEditingController();

  void addHala()async {
    emit(AddHalaLoading());
    try{
      await FirebaseFirestore.instance.collection("patients").add({
        "patient_name":patientNameCont.text,
        "Id":patientIDCont.text,
        "patientPhone":patientPhoneCont.text,
        "inputPhone":inputPhoneCont.text,
        "mobadraName":mobadraNameCont.text,
        "hospitalName":hospitalNameCont.text,
        "result":resultCont.text
      });
      emit(AddHalaSuccess());
    }
    catch(e){
     emit(AddHalaFailure(errorMsg: e.toString()));
    }
  }
}
