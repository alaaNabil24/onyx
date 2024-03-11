import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onyx/core/themes/app_colors.dart';
import 'package:onyx/core/themes/text_app_style.dart';

import '../../../../core/generated/l10n.dart';
import '../../domain/entities/order_data.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({super.key, required this.data});
  final OrderData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 92,
      decoration: BoxDecoration(

        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [ BoxShadow(
          color: AppColors.greyColor.withOpacity(0.1),

          blurRadius: 10,
          offset: Offset(0, 5), // changes position of shadow
        ),
        ],

      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h,),
                Container(

                  margin: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Text(
                    data.orderNumber ?? "",
                    style: AppTextStyle.s13Secondary(),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    _buildTitleAndValue(
                        S.current.status, data.status ?? "" ,textColor: getColorStatus(data.statusId) ,),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 47,
                      color: AppColors.greyColor,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,

                    child:   _buildTitleAndValue(
                        S.current.price, data.price ?? "",
                        textColor: AppColors.primaryColor),
                    ),

                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      height: 47,
                      color: AppColors.greyColor,                      ),
                    SizedBox(
                      width: 30.w,
                    ),

                    FittedBox(
                        fit: BoxFit.fitWidth,
                        child:       _buildTitleAndValue(S.current.date, data.date ?? "",
                        textColor: AppColors.primaryColor), )

                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration:  BoxDecoration(
                color: getColorStatus(data.statusId) ,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.current.order_details,
                      style: AppTextStyle.s10Primary()
                          .copyWith(color: AppColors.whiteColor, fontSize: 8.sp)),

                  SizedBox(height: 10,),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: AppColors.whiteColor,

                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

_buildTitleAndValue(String? title, String? value, {textColor}) {
  return Column(
    children: [
      Text(
        title ?? "",
        style: AppTextStyle.s10Primary()
            .copyWith(color: AppColors.secondaryTextColor),
      ),

      SizedBox(height: 8.h,),
      Text(
        value ?? "",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.s13Primary().copyWith(


            color: textColor ?? AppColors.greenColor,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}


Color getColorStatus(id){


   switch (id) {
     case "1":
       return AppColors.primaryColor;
     case "2":
       return AppColors.greyColor;
     case "3":
       return AppColors.secondaryColor;
     default:
       return AppColors.greenColor;
   }

}