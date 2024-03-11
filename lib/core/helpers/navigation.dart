import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:page_transition/page_transition.dart';

@injectable
class NavigationApp {
  navigateTo(context, widget) {
       return   Navigator.push(context,
      PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 300),
          child:  widget),);
  }

  navigateToFinish(context, widget) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );
  }
}


