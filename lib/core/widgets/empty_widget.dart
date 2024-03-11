import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onyx/core/themes/app_colors.dart';
import 'package:onyx/core/themes/text_app_style.dart';

import '../assets/assets.gen.dart';
import '../generated/l10n.dart';



class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


      Assets.images.empty.svg(),


      SizedBox(height: 46.h,),

      Text(S.current.no_orders , style: AppTextStyle.s20Primary().copyWith(color: AppColors.blackColor),)

      
    ],);
  }
}