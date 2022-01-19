import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/repository/basket_repo/basket_repo.dart';
import 'package:udemy_flutter/screens/my_basket/model/add_order_model.dart';
import 'package:udemy_flutter/screens/my_basket/model/basket_model.dart';
import 'package:udemy_flutter/screens/my_basket/basket_cubit/states.dart';

import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';

class BasketCubit extends Cubit<BasketStates> {
  BasketCubit() : super(BasketInitialState());

  static BasketCubit get(context) => BlocProvider.of(context);

  //add order to my basket
  final basketRepo = BasketRepo();

  //get orders to basket
  BasketModel? myBag;

  Future<void> addToBasketOrders(int productId) async {
    emit(AddToBasketLoadingState());
    try {
      myBag = await basketRepo.addToBasketOrders(productId);
      emit(AddToBasketSuccessState());
      getMyBasketData();
    } catch (error) {
      print(error.toString());
      emit(AddToBasketErrorState());
    }
  }

  Future<void> getMyBasketData() async {
    emit(ShopGetOrderLoadingState());
    try {
      myBag = await basketRepo.getMyBasketData();
      emit(ShopGetOrderSuccessState(myBag!));
    } catch (error) {
      print(error.toString());
      emit(ShopGetOrderErrorState());
    }
  }

  //update quantity of orders in basket
  Future<void> updateBasketOrderData(
      {required int productId, required quantity}) async {
    emit(BasketUpdateQuantityLoadingState());
    try {
      myBag = await basketRepo.updateBasketOrderData(productId, quantity);
      emit(BasketUpdateQuantitySuccessState(myBag!));
      getMyBasketData();
    } catch (error) {
      print(error.toString());
      emit(BasketUpdateQuantityErrorState());
    }
  }

  //delete orders from basket
  Future<void> deleteOrderFromBasketData({required int productId}) async {
    emit(DeleteFromBasketLoadingState());

    try {
      basketRepo.deleteOrderFromBasketData(productId);
      emit(DeleteFromBasketSuccessState());
      getMyBasketData();
    } catch (error) {
      print(error.toString());
      emit(DeleteFromBasketErrorState());
    }
  }

//complete make order and add to get it

  AddOrderModel? makeOrders;

  void makeOrderData(addressId, paymentMethod, usePoints, discount, vat) {
    emit(MakeOrderLoadingState());
    DioHelper.postData(url: ADD_ORDER, token: token, data: {
      'address_id': addressId,
      'payment_method': paymentMethod,
      'discount': discount,
      'use_points': usePoints,
      'vat': vat,
    }).then((value) {
      makeOrders = AddOrderModel.fromJson(value.data);
      emit(MakeOrderSuccessState(myBag!));
    }).catchError((error) {
      print(error.toString());
      emit(MakeOrderErrorState());
    });
  }
}
