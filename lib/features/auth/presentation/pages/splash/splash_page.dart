import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onyx/core/storage/local.dart';
import 'package:onyx/core/themes/app_colors.dart';
import 'package:onyx/features/auth/presentation/pages/login/login_page.dart';
import 'package:onyx/features/orders/presentation/pages/orders/orders_page.dart';

import '../../../../../core/assets/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        ()  async {


          if(LocalStorage.box.read("userId") != null && LocalStorage.box.read("userId") != "" ){


            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const OrdersPage()));
          }else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage()));

          }



        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.w),
              child: Assets.images.logoSplash.svg(height: 112.h),
            ).animate().fade().scale(
                duration: const Duration(milliseconds: 700)), // baseline=800ms

            SizedBox(
              height: 120.h,
            ),

            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350.h,
                ),
                Positioned(
                  top: 90,
                  child: Assets.images.bgSplash.svg(fit: BoxFit.contain),
                ),
                Positioned(bottom: 20, child: Assets.images.splashVector.svg())
              ],
            )
          ],
        ),
      ),
    );
  }
}
