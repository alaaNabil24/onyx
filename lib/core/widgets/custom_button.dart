import 'package:flutter/material.dart';
import 'package:onyx/core/themes/app_colors.dart';

// todo :  Default Button in app
// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  String? text;
  // ignore: prefer_typing_uninitialized_variables
  var textColor;
  VoidCallback? onTap;
  // ignore: non_constant_identifier_names
  double? border_radius;
  // ignore: prefer_typing_uninitialized_variables
  var textSize;


  Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(border_radius ?? 5.0),
                    side: BorderSide(color: AppColors.primaryColor),
                  ))),
          child: childWidget ??
              Text(
                text!,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: textSize ?? 18,
                ),
              )),
    );
  }

  // ignore: use_key_in_widget_constructors
  DefaultButton(
      {this.text,
        this.onTap,
        this.border_radius,
        this.textSize,

        this.textColor,
        this.childWidget});
}