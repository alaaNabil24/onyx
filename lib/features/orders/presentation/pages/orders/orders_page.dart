import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onyx/core/di/injector.dart';
import 'package:onyx/core/themes/app_colors.dart';
import 'package:onyx/core/widgets/loading_widget.dart';
import 'package:onyx/features/orders/presentation/cubit/orders_cubit.dart';

import '../../../../../core/generated/l10n.dart';
import '../../widgets/new_orders_list.dart';
import '../../widgets/orders_header.dart';
import '../../widgets/other_orders_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        backgroundColor: AppColors.whiteColor,
        body: BlocProvider(
          create: (context) =>
          OrdersCubit(getIt())
            ..init(),
          child: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              return Column(
                children: [

                  OrdersHeader(),
                  SizedBox(height: 16.h,),
                  Container(
                    height: 36.h,
                    margin: EdgeInsets.symmetric(horizontal: 77.w),

                    decoration: BoxDecoration(
                      boxShadow: [ BoxShadow(
                        color: AppColors.greyColor.withOpacity(0.6),

                        blurRadius: 10,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                      ],
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TabBar(

                      unselectedLabelColor: AppColors.primaryColor,
                      labelColor: AppColors.whiteColor,
                      indicatorColor: AppColors.primaryColor,
                      indicatorWeight: 1,

                      indicator: BoxDecoration(
                        boxShadow: const [ BoxShadow(
                          color: Color(0xff00000029),

                          spreadRadius: 6,
                          blurRadius: 6,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                        ],
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      tabs: [
                        Tab(
                          text: S.current.newe,
                        ),
                        Tab(
                          text: S.current.others,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h,),
                  Expanded(
                    child:    state is OrdersSussState ?TabBarView(
                      children: <Widget>[
                        NewOrdersList(),
                        OtherOrdersList()
                      ],
                    ) :const Center(child: LoadingWidget()),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
  

