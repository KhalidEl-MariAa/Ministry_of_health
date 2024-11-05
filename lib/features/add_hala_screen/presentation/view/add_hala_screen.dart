import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ministry_health/core/colors/colors.dart';
import 'package:ministry_health/core/styles/app_styles.dart';
import 'package:ministry_health/features/add_hala_screen/presentation/view/widgets/add_hala_form.dart';

class AddHalaScreen extends StatelessWidget {
  const AddHalaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("اضافة حالة",style: AppStyles.bold25.copyWith(fontSize: 20.sp,color: AppColors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child:const AddHalaForm()
            ),
          )
        ],
      ),
    ));
  }
}