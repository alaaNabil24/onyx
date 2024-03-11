import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onyx/core/themes/app_colors.dart';
import 'package:onyx/core/themes/text_app_style.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  CustomField(
      {super.key,
      required this.controller,
      this.errorText,
   
      this.max_lines = 1,
      required this.text,
      this.isPassword = false,
      this.suffixIcon,
      this.suffixIcon2,
      this.max_Length,
      this.enable = true});

  final TextEditingController controller;
  
  final int max_lines;
  int? max_Length;
  final bool isPassword, enable;
  Widget? suffixIcon;
  Widget? suffixIcon2;
  String? errorText;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
    textAlign: TextAlign.center,

      enabled: enable,
      obscureText: isPassword,
      controller: controller,
      maxLines: max_lines,
      style: const TextStyle(color: Colors.black),
      validator: (value) {
        if (value!.isEmpty) {
          return errorText;
        }

        return null;
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon2,
        suffix: suffixIcon,
        errorStyle: TextStyle(fontSize: 10.sp),
        filled: true,
        hintStyle: AppTextStyle.s14Primary().copyWith(color: AppColors.blackColor),
        hintText: text,
        fillColor: AppColors.textFormFiledColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
