import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onyx/features/orders/presentation/cubit/orders_cubit.dart';

import '../../../../core/widgets/empty_widget.dart';
import 'order_card_widget.dart';

class NewOrdersList extends StatelessWidget {
  const NewOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<OrdersCubit>().listOrderNew.isEmpty? EmptyWidget(): ListView.separated(
physics: BouncingScrollPhysics(),

        shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (c, i) => OrderCardWidget(
              data: context.read<OrdersCubit>().listOrderNew[i],
            ),
        separatorBuilder: (c, i) => const SizedBox(
              height: 16,
            ),
        itemCount: context.read<OrdersCubit>().listOrderNew.length);
  }
}
