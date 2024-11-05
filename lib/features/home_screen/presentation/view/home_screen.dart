import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/core/navigation/screen_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
        Navigator.pushNamed(context, ScreenNames.addHalaScreen);
      },
      child: Icon(Icons.add,color: AppColors.white,size: 25.sp,),
      ),
    ));
  }
}