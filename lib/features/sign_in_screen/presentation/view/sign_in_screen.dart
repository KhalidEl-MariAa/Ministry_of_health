import 'package:flutter/material.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/logo_view.dart';
import 'package:ministry_health/features/sign_in_screen/presentation/view/widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                LogoView(),
                SignInForm()
              ],
            ),
          )
        ],
      ),
    ));
  }
}