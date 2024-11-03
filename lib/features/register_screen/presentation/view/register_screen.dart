import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/core/styles/app_styles.dart';
import 'package:ministry_health/core/usable/sized_boxes.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/logo_view.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoView(),
                VerticalSizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text("انشاء حساب",style:AppStyles.bold25 )),
                  VerticalSizedBox(height: 10),
                   Customtextfield(
                    prefixIcon: FontAwesomeIcons.userDoctor,
                    hintText: "اسم الطبيب", borderColor:Colors.blue, obscure: false),
                    VerticalSizedBox(height: 10),
                    
                  Customtextfield(
                    prefixIcon: Icons.email,
                    hintText: "البريد الالكتروني", borderColor:Colors.blue, obscure: false),
                            VerticalSizedBox(height: 10),
                   Customtextfield(
                    prefixIcon: Icons.password,
                    hintText: "كلمة المرور", borderColor:Colors.blue, obscure: true),
                     
                     VerticalSizedBox(height: 10),
                     Customtextfield(
                    prefixIcon: Icons.password,
                    hintText: "تأكيد كلمة المرور", borderColor:Colors.blue, obscure: true)
                
              ],
            ),
          )
        ],
      ),
    ));
  }
}