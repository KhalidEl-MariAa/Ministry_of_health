import 'package:flutter/material.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/core/usable/sized_boxes.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/logo_view.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/reg_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoView(),
                // VerticalSizedBox(height: 25),
                RegForm(),
                //  VerticalSizedBox(height: 15),
                
              ],
            ),
          )
        ],
      ),
    ));
  }
}