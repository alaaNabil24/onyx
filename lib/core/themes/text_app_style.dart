import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle =
      TextStyle(letterSpacing: _defaultLetterSpacing, fontFamily: 'Co');
  static TextStyle s18BoldAppPrimary() => _baseTextStyle.merge(TextStyle(
      fontSize: 18.sp,
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.w700));
  static TextStyle s11Secondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: AppColors.secondaryTextColor,
      ));
  static TextStyle s20Error() => _baseTextStyle.merge(TextStyle(
        fontSize: 20.sp,
        color: Colors.red,
      ));

  static TextStyle s13Secondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 13.sp,
        color: AppColors.secondaryTextColor,
      ));

  static TextStyle s17Secondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 17.sp,
        color: AppColors.secondaryTextColor,
      ));
  static TextStyle s15Secondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 15.sp,
        color: AppColors.secondaryTextColor,
      ));

  static TextStyle s17Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 17.sp,
        color: AppColors.primaryTextColor,
      ));
  static TextStyle s11Primary({double hei = 1.75}) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: AppColors.primaryTextColor,
        height: hei,
      ));

  static TextStyle s13White() => _baseTextStyle.merge(TextStyle(
        fontSize: 13.sp,
        color: Colors.white,
      ));
  static TextStyle s11White() => _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: Colors.white,
      ));
  static TextStyle s11Black() => _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: Colors.black,
      ));
  static TextStyle s15White() => _baseTextStyle.merge(TextStyle(
        fontSize: 15.sp,
        color: Colors.white,
      ));
  static TextStyle s17White() => _baseTextStyle.merge(TextStyle(
        fontSize: 17.sp,
        color: Colors.white,
      ));
  static TextStyle s15Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 15.sp,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s19Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 19.sp,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s20Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 20.sp,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s13Primary(
          {TextDecoration decoration = TextDecoration.none}) =>
      _baseTextStyle.merge(TextStyle(
          fontSize: 13.sp,
          color: AppColors.primaryTextColor,
          decoration: decoration));
  static TextStyle s10Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 10.sp,
        color: AppColors.primaryTextColor,
      ));
  static TextStyle s16Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 16.sp,
        color: AppColors.primaryTextColor,
      ));
  static TextStyle s14Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 14.sp,
        color: AppColors.primaryTextColor,
      ));
}
