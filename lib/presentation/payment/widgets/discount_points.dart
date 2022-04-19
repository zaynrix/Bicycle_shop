import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/card_item.dart';


class DiscountPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);


    return CardItem(
      title: "Do you want to use discount points?",
      labels: paymentCubit.labelText,
      selectedIndex: paymentCubit.discountTabTextIndexSelected,
      selectedLabelIndex: (int index) {
        paymentCubit.changeDiscount(index);
        // paymentCubit.estimateOrdersData(
        // );
      },
    );
  }
}
