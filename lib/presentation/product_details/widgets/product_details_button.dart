import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/change_quantity_product.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class ProductDetailsButton extends StatelessWidget {
  final int productId;

  const ProductDetailsButton({required this.productId});

  @override
  Widget build(BuildContext context) {
    final basketCubit = BlocProvider.of<BasketCubit>(context);
    return BlocConsumer<BasketCubit, BasketStates>(
      listener: (context, state) {
        if (state is AddToBasketSuccess) {
          showToast(
            message: 'product added to basket successfully',
            state: ToastStates.success,
          );
        } else if (state is AddToBasketError) {
          showToast(
            message: 'something wrong try again later',
            state: ToastStates.error,
          );
        }
      },
      builder: (context, state) {
        return Positioned(
          bottom: 8.0,
          right: 8.0,
          left: 0.0,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ChangeQuantityProduct(),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    text: 'Add to basket',
                    onPressed: () {
                      basketCubit.addToBasketOrders(productId);
                      //todo does not work
                      // basketCubit.updateBasketOrderData(
                      //   productId: productId,
                      //   quantity: productDetailsCubit.changeQuantity,
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
