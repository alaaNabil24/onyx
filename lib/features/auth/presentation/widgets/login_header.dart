import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onyx/core/assets/assets.gen.dart';
import 'package:onyx/core/themes/app_colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

      SizedBox(width: 26.w,),



Assets.images.logoSplash.svg(

matchTextDirection: true,

width: 170,
height: 74,
),


      SizedBox(width: 60.w,),
      Stack(
        alignment: AlignmentDirectional.centerEnd,
        fit: StackFit.passthrough,
        children: [

          Assets.images.icCircle.svg(





            fit: BoxFit.cover,
            matchTextDirection: true,
            color: AppColors.secondaryColor,



          ),


          Row(
            children: [
              GestureDetector(
                onTap: (){


                },
                child: Assets.images.lang.svg(



                ),
              ),

              const  SizedBox(width: 16,),
            ],
          )

        ],)
    ],);
  }
}