import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/core/navigation/screen_names.dart';
import 'package:ministry_health/core/styles/app_styles.dart';
import 'package:ministry_health/core/usable/sized_boxes.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/logo_view.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/pass_textfield.dart';
import 'package:ministry_health/features/sign_in_screen/presentation/view_model/cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> keey = GlobalKey();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 45.h),
      child: Form(
        key: keey,
        child: BlocListener<SignInCubit, SignInState>(
          listener: (context, state) {
             if(state is SignInLoading){
              signInLoadingDialog(context);
            }
            else if (state is SignInError){
              Navigator.pop(context);
              errorDialog(context, state);
            }
            else if (state is SignInSuceess){
              Navigator.pop(context);
            Navigator.pushNamed(context, ScreenNames.homeScreen);

            }
          },
          child: Column(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text("تسجيل الدخول", style: AppStyles.bold25)),
              const VerticalSizedBox(height: 15),
               Customtextfield(
                 validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك أدخل البريد الالكتروني";
                    }
                    return null;
                  },
                controller: BlocProvider.of<SignInCubit>(context).emailcont,
                  prefixIcon: Icons.email,
                  hintText: "البريد الالكتروني",
                  borderColor: Colors.blue,
                  obscure: false),
              const VerticalSizedBox(height: 10),
                  PassTextfield(
                     validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك أدخل كلمة السر";
                    }
                    return null;
                  },
                passCont:  BlocProvider.of<SignInCubit>(context).passcont,
                hintText: "كلمة المرور"),
              const VerticalSizedBox(height: 15),
              SizedBox(
                width: 0.8.sw,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      if(keey.currentState!.validate()){
                         BlocProvider.of<SignInCubit>(context).signIn();
                      }
                      // Navigator.pushNamed(context, ScreenNames.homeScreen);
                    },
                    child: Text(
                      "تسجيل الدخول",
                      style: AppStyles.bold25
                          .copyWith(fontSize: 15.sp, color: AppColors.white),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ليس لديك حساب..",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ScreenNames.regScreen);
                      },
                      child: Text(
                        "انشاء حساب",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }



  void signInLoadingDialog(BuildContext context) {
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
          Text("جاري تسجيل الدخول...",style: AppStyles.bold25.copyWith(fontSize: 15.sp),),
          const VerticalSizedBox(height: 10),
    
    
    
        ],
       )
    
    ),);
  }

  void errorDialog(BuildContext context, SignInError state) {
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
