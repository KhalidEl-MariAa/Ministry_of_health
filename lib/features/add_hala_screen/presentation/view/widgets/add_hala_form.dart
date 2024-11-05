import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/core/styles/app_styles.dart';
import 'package:ministry_health/core/usable/sized_boxes.dart';
import 'package:ministry_health/features/add_hala_screen/presentation/view_model/cubit/add_hala_cubit.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/logo_view.dart';

class AddHalaForm extends StatelessWidget {
  const AddHalaForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> keey = GlobalKey<FormState>();
     
    return Form(
      key: keey,
      child: BlocConsumer<AddHalaCubit, AddHalaState>(
        listener: (context, state) {
          if(state is AddHalaLoading){
            addHalaLoadingDialog(context);
          }
          else if(state is AddHalaSuccess){
            Navigator.pop(context);
            addHalaSuccessDialog(context);
          }
          else if (state is AddHalaFailure){
            Navigator.pop(context);

           errorDialog(context, state);
          }
        },
        builder:(context, state) { 
         var cubit = AddHalaCubit.get(context);
         return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSizedBox(height: 15),
            Text(
              "الاسم رباعي",
              style: AppStyles.bold25.copyWith(fontSize: 15.sp),
            ),
            Customtextfield(
              controller: cubit.patientNameCont,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "املأ هذا الحفل أولا";
                  }
                  return null;
                },
                prefixIcon: FontAwesomeIcons.pencil,
                hintText: "أدخل الاسم رباعي",
                borderColor: Colors.blue,
                obscure: false),
            const VerticalSizedBox(height: 15),
            Text(
              "الرقم القومي",
              style: AppStyles.bold25.copyWith(fontSize: 15.sp),
            ),
            Customtextfield(
              controller: cubit.patientIDCont,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "املأ هذا الحفل أولا";
                  } else if (p0.length < 14 || p0.length > 14) {
                    return "يجب ان يتكون من 14 رقم";
                  }
                  return null;
                },
                prefixIcon: FontAwesomeIcons.idCard,
                keyboardType: TextInputType.number,
                hintText: "أدخل الرقم القومي",
                borderColor: Colors.blue,
                obscure: false),
            const VerticalSizedBox(height: 15),
            Text(
              "رقم تليفون المريض",
              style: AppStyles.bold25.copyWith(fontSize: 15.sp),
            ),
            Customtextfield(
              controller: cubit.patientPhoneCont,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "املأ هذا الحفل أولا";
                  } else if (p0.length > 11 || p0.length < 11) {
                    return "يحب أن يكون 11 رقم";
                  }
                  return null;
                },
                prefixIcon: FontAwesomeIcons.phone,
                keyboardType: TextInputType.number,
                hintText: "أدخل رقم تليفون المريض",
                borderColor: Colors.blue,
                obscure: false),
            const VerticalSizedBox(height: 15),
            Text(
              "رقم تليفون مدخل البيانات",
              style: AppStyles.bold25.copyWith(fontSize: 15.sp),
            ),
            Customtextfield(
                 controller: cubit.inputPhoneCont,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "املأ هذا الحفل أولا";
                  }
                  return null;
                },
                prefixIcon: FontAwesomeIcons.phone,
                keyboardType: TextInputType.number,
                hintText: "أدخل رقم تليفون مدخل البيانات",
                borderColor: Colors.blue,
                obscure: false),
            const VerticalSizedBox(height: 15),
            Text(
              "اسم المبادرة",
              style: AppStyles.bold25.copyWith(fontSize: 15.sp),
            ),
            Customtextfield(
                 controller: cubit.mobadraNameCont,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "املأ هذا الحفل أولا";
                  }
                  return null;
                },
                prefixIcon: FontAwesomeIcons.pencil,
                hintText: "أدخل اسم المبادرة",
                borderColor: Colors.blue,
                obscure: false),
            const VerticalSizedBox(height: 15),
            Text(
              "اسم مستشفي الاحالة",
              style: AppStyles.bold25.copyWith(fontSize: 15.sp),
            ),
            Customtextfield(
              controller: cubit.hospitalNameCont,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "املأ هذا الحفل أولا";
                  }
                  return null;
                },
                prefixIcon: FontAwesomeIcons.hospital,
                hintText: "أدخل اسم مستشفي الاحالة",
                borderColor: Colors.blue,
                obscure: false),
            const VerticalSizedBox(height: 15),
            Text(
              "نتيجة الاحالة",
              style: AppStyles.bold25.copyWith(fontSize: 15.sp),
            ),
            Customtextfield(
              controller: cubit.resultCont,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "املأ هذا الحفل أولا";
                  }
                  return null;
                },
                prefixIcon: FontAwesomeIcons.fileContract,
                hintText: "أدخل نتيجة الاحالة",
                borderColor: Colors.blue,
                obscure: false),
            const VerticalSizedBox(height: 15),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 0.6.sw,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      if (keey.currentState!.validate()) {
                        cubit.addHala(); 
                      }
                    },
                    child: Text(
                      "اضافة الحالة",
                      style: AppStyles.bold25
                          .copyWith(fontSize: 15.sp, color: AppColors.white),
                    )),
              ),
            ),
            const VerticalSizedBox(height: 15),
          ],
        );}
      ),
    );
  }

  void addHalaLoadingDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => Dialog(
       backgroundColor: AppColors.white,
       child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LogoView(),
          const VerticalSizedBox(height: 10),
          const CircularProgressIndicator(color: Colors.blue,),
          const VerticalSizedBox(height: 10),
          Text("جاري اضافة الحالة...",style: AppStyles.bold25.copyWith(fontSize: 15.sp),),
          const VerticalSizedBox(height: 10),
    
    
    
        ],
       )
    
    ),);
  }


    void addHalaSuccessDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => Dialog(
       backgroundColor: AppColors.white,
       child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LogoView(),
          const VerticalSizedBox(height: 10),
          Icon(FontAwesomeIcons.squareCheck,color: Colors.green,size: 20.sp,),
          const VerticalSizedBox(height: 10),
          Text("تمت اضافة الحالة بحناح",style: AppStyles.bold25.copyWith(fontSize: 15.sp),),
          const VerticalSizedBox(height: 10),
    
    
    
        ],
       )
    
    ),);
  }


  void errorDialog(BuildContext context, AddHalaFailure state) {
    showDialog(context: context, builder: (context) => Dialog(
       backgroundColor: AppColors.white,
       child: Padding(
         padding: EdgeInsets.symmetric(horizontal: 10.w),
         child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LogoView(),
            const VerticalSizedBox(height: 10),
            Text("حدث خطأ",style: AppStyles.bold25.copyWith(fontSize: 20.sp),),
            
            const VerticalSizedBox(height: 10),
            Text(state.errorMsg,style: AppStyles.bold25.copyWith(fontSize: 10.sp),),
            const VerticalSizedBox(height: 10),
         
         
         
          ],
         ),
       )
    
    ),);
  }
}
