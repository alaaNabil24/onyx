

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/empty_widget.dart';
import '../cubit/orders_cubit.dart';
import 'order_card_widget.dart';

class OtherOrdersList extends StatelessWidget {
  const OtherOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<OrdersCubit>().listOrderOther.isEmpty? EmptyWidget(): ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),

        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (c, i) => OrderCardWidget(
          data: context.read<OrdersCubit>().listOrderOther[i],
        ),
        separatorBuilder: (c, i) => const SizedBox(
          height: 16,
        ),
        itemCount: context.read<OrdersCubit>().listOrderOther.length);
  }
}
