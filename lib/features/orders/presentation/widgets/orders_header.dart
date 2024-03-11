import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onyx/core/storage/local.dart';
import 'package:onyx/core/themes/app_colors.dart';

import '../../../../core/assets/assets.gen.dart';
import '../../../../core/themes/text_app_style.dart';

class OrdersHeader extends StatelessWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 140.h,
          color: AppColors.secondaryColor,
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Assets.images.icCircle.svg(
            fit: BoxFit.contain,
            height: 140.h,
            color: AppColors.primaryColor,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 17.w,
            ),
            Expanded(
              child: Text(
                LocalStorage.box.read("name"),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.s13Secondary()
                    .copyWith(color: AppColors.whiteColor, fontSize: 25.sp),
              ),
            ),





            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Assets.images.deliveryman.image(width: 155.w, height: 155.h)),

            SizedBox(
              width: 25.w,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25.h),
              width: 24.w,
              height: 24.h,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Assets.images.lang.svg(

                color: AppColors.primaryColor,
              ),
            ),

            SizedBox(
              width: 17.w,
            ),
          ],
        )
      ],
    );
  }
}
