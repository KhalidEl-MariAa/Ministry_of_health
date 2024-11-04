import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/core/navigation/screen_names.dart';
import 'package:ministry_health/core/styles/app_styles.dart';
import 'package:ministry_health/core/usable/sized_boxes.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/logo_view.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/pass_textfield.dart';
import 'package:ministry_health/features/register_screen/presentation/view_model/cubit/registration_cubit.dart';

class RegForm extends StatelessWidget {
  const RegForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> keey = GlobalKey<FormState>();
    return Form(
      key: keey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 45.h),
        child: BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            
            if(state is RegistrationLoading){
              showDialog(context: context, builder: (context) => Dialog(
                 backgroundColor: AppColors.white,
                 child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoView(),
                    const VerticalSizedBox(height: 10),
                    const CircularProgressIndicator(color: Colors.blue,),
                    const VerticalSizedBox(height: 10),
                    Text("جاري انشاء الحساب...",style: AppStyles.bold25.copyWith(fontSize: 15.sp),),
                    const VerticalSizedBox(height: 10),



                  ],
                 )

              ),);
            }
          },
          child: Column(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text("انشاء حساب", style: AppStyles.bold25)),
              const VerticalSizedBox(height: 15),
              Customtextfield(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك أدخل اسم الطبيب";
                    }
                    return null;
                  },
                  prefixIcon: FontAwesomeIcons.userDoctor,
                  hintText: "اسم الطبيب",
                  borderColor: Colors.blue,
                  obscure: false),
              const VerticalSizedBox(height: 10),
              Customtextfield(
                controller: BlocProvider.of<RegistrationCubit>(context).emailcont,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك أدخل البريد الالكتروني";
                    }
                    return null;
                  },
                  prefixIcon: Icons.email,
                  hintText: "البريد الالكتروني",
                  borderColor: Colors.blue,
                  obscure: false),
              const VerticalSizedBox(height: 10),
              PassTextfield(
                passCont: BlocProvider.of<RegistrationCubit>(context).passcont,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك أدخل كلمة المرور";
                    }
                    return null;
                  },
                  hintText: "كلمة المرور"),
              const VerticalSizedBox(height: 10),
              PassTextfield(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك أدخل كلمة المرور";
                    }
                    return null;
                  },
                  hintText: "تأكيد كلمة المرور"),
              const VerticalSizedBox(height: 15),
              SizedBox(
                width: 0.8.sw,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () async{
                      if (keey.currentState!.validate()) {
                       await BlocProvider.of<RegistrationCubit>(context).registration();
                        Navigator.pushNamed(context, ScreenNames.homeScreen);
                      }
                    },
                    child: Text(
                      "تسجيل الحساب",
                      style: AppStyles.bold25
                          .copyWith(fontSize: 15.sp, color: AppColors.white),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لديك حساب بالفعل؟..",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ScreenNames.loginScreen);
                      },
                      child: Text(
                        "تسجيل الدخول",
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
}
