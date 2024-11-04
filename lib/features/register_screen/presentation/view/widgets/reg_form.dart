import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/core/styles/app_styles.dart';
import 'package:ministry_health/core/usable/sized_boxes.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/pass_textfield.dart';

class RegForm extends StatelessWidget {
  const RegForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 45.h),
      child: Column(
        children: [
          Align(
                    alignment: Alignment.bottomRight,
                    child: Text("انشاء حساب",style:AppStyles.bold25 )),
                    const VerticalSizedBox(height: 15),
                     const Customtextfield(
                      prefixIcon: FontAwesomeIcons.userDoctor,
                      hintText: "اسم الطبيب", borderColor:Colors.blue, obscure: false),
                      const VerticalSizedBox(height: 10),
                      
                    const Customtextfield(
                      prefixIcon: Icons.email,
                      hintText: "البريد الالكتروني", borderColor:Colors.blue, obscure: false),
                              const VerticalSizedBox(height: 10),
                     const PassTextfield(hintText: "كلمة المرور"),
                       
                       const VerticalSizedBox(height: 10),
                      const PassTextfield(hintText: "تأكيد كلمة المرور"),
                   const VerticalSizedBox(height: 15),
                      SizedBox(
                        width: 0.8.sw,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue
                          ),
                          onPressed: () {
                          
                        }, child: Text("تسجيل الحساب",style: AppStyles.bold25.copyWith(fontSize: 15.sp,color: AppColors.white),) ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("لديك حساب بالفعل؟..",style: TextStyle(color: AppColors.black,fontWeight: FontWeight.w400,fontSize: 12.sp),),
                          Text("تسجيل الدخول",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 12.sp),)
                        ],
                      )
        ],
      ),
    );
  }
}