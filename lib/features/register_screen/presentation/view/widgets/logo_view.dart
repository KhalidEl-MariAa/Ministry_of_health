import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 170.h,
                  width: 200..w,
            decoration:const BoxDecoration(
              
              image: DecorationImage(image: AssetImage("assets/images/Logo-health-removebg-preview.png"),fit: BoxFit.fill)
            ) ,
                );
  }
}