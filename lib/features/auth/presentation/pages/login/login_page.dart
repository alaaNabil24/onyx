import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onyx/core/assets/assets.gen.dart';
import 'package:onyx/features/auth/presentation/widgets/login_body.dart';

import '../../widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginHeader(),
               SizedBox(
              height: 130.h,
            ),
            LoginBody(),
            SizedBox(
              height: 37.h,
            ),
            Assets.images.loginCar.svg()
          ],
        ),
      ),
    );
  }
}
