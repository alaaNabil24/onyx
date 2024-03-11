import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onyx/core/di/injector.dart';
import 'package:onyx/core/themes/app_colors.dart';
import 'package:onyx/core/themes/text_app_style.dart';
import 'package:onyx/core/widgets/custom_button.dart';
import 'package:onyx/core/widgets/custom_feild.dart';
import 'package:onyx/core/widgets/loading_widget.dart';
import 'package:onyx/features/auth/presentation/cubit/auth/auth_cubit.dart';

import '../../../../core/generated/l10n.dart';
import '../../../../core/helpers/navigation.dart';
import '../../../orders/presentation/pages/orders/orders_page.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final singInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            NavigationApp().navigateToFinish(context, const OrdersPage());
          } else if (state is LoginErrorState) {
            Fluttertoast.showToast(
                msg: state.error ?? "error",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: singInFormKey,
              child: Column(
                children: [
                  Text(
                    S.current.welcome,
                    style: AppTextStyle.s20Primary()
                        .copyWith(fontSize: 29.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    S.current.log_back,
                    style: AppTextStyle.s20Primary()
                        .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  CustomField(
                    errorText: S.current.enter + " " + S.current.user_id,
                    controller: cubit.userIdController,
                    text: S.current.user_id,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomField(
                    isPassword: true,
                    errorText: S.current.enter + " " + S.current.password,
                    controller: cubit.passwordController,
                    text: S.current.password,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Text(
                        S.current.show_more,
                        style: AppTextStyle.s14Primary(),
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is LoginLoadingState
                      ? const LoadingWidget()
                      : DefaultButton(
                          textColor: AppColors.whiteColor,
                          text: S.current.login,
                          border_radius: 22.0,
                          onTap: () {
                            if (singInFormKey.currentState!.validate()) {
                              cubit.login(cubit.userIdController.text,
                                  cubit.passwordController.text);
                            }
                          },
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
