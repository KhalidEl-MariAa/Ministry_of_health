import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/core/navigation/screen_names.dart';
import 'package:ministry_health/core/styles/app_styles.dart';
import 'package:ministry_health/core/usable/sized_boxes.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/pass_textfield.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 45.h),
      child: Column(
        children: [
          Align(
                    alignment: Alignment.bottomRight,
                    child: Text("تسجيل الدخول",style:AppStyles.bold25 )),
                    const VerticalSizedBox(height: 15),
                     
                      
                    const Customtextfield(
                      prefixIcon: Icons.email,
                      hintText: "البريد الالكتروني", borderColor:Colors.blue, obscure: false),
                              const VerticalSizedBox(height: 10),
                     const PassTextfield(hintText: "كلمة المرور"),
                       
                       
                   const VerticalSizedBox(height: 15),
                      SizedBox(
                        width: 0.8.sw,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue
                          ),
                          onPressed: () {
                          Navigator.pushNamed(context, ScreenNames.homeScreen);
                          
                        }, child: Text("تسجيل الدخول",style: AppStyles.bold25.copyWith(fontSize: 15.sp,color: AppColors.white),) ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("ليس لديك حساب..",style: TextStyle(color: AppColors.black,fontWeight: FontWeight.w400,fontSize: 12.sp),),
                          GestureDetector(
                            onTap:() {
                              Navigator.pushNamed(context, ScreenNames.regScreen);
                            },
                            child: Text("انشاء حساب",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 12.sp),))
                        ],
                      )
        ],
      ),
    );
  }
}