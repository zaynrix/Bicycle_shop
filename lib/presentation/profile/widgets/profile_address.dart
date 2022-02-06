import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/address/address_cubit/states.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProfileAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: (state is GetAddressSuccess),
            builder: (BuildContext context) {
              var cubit = AddressCubit.get(context).addressModel!.data!.data!;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: CustomCard(
                    widget: Column(
                      children: [
                        CustomText(
                          text: 'My Addresses' + ' (${cubit.length})',
                          textColor: Colors.grey,
                          fontSize: 20.0,
                        ),
                        (cubit.length > 0)
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 20.0),
                                child: Container(
                                  height: cubit.length > 1 ? 120.0 : 60.0,
                                  child: ListView.separated(
                                    itemCount: cubit.length,
                                    itemBuilder: (context, index) =>
                                        TextFormField(
                                      readOnly: true,
                                      onTap: () => navigateWithArgument(
                                          context,
                                          RouteConstant.updateAddressRoute,
                                          index),
                                      decoration: InputDecoration(
                                        fillColor: Colors.grey[100],
                                        filled: true,
                                        contentPadding: EdgeInsets.all(10),
                                        hintText:
                                            'City : ' + '${cubit[index].city}',
                                        hintStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: grey),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    separatorBuilder: (context, _) =>
                                        SizedBox(height: 10.0),
                                  ),
                                ),
                              )
                            : SizedBox(height: 10.0),
                        CustomButton(
                          onPressed: () => navigateTo(
                              context, RouteConstant.addAddressRoute),
                          text: 'Add new address',
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              );
            },
            fallback: (BuildContext context) {
              return Center(child: CustomLoading());
            },
          );
        });
  }
}
