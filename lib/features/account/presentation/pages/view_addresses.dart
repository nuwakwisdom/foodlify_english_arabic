// ignore_for_file: use_build_context_synchronously

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/account/presentation/cubit/get_address_cubit.dart';
import 'package:Foodlify/features/account/presentation/cubit/set_default_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ShowAddresses extends StatefulWidget {
  const ShowAddresses({super.key});

  @override
  State<ShowAddresses> createState() => _ShowAddressesState();
}

class _ShowAddressesState extends State<ShowAddresses> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAddressCubit, GetAddressState>(
      builder: (context, state) {
        //  final address = context.read<GetAddressCubit>().deliveryAddresses;

        return Scaffold(
          backgroundColor: FoodlieColors.foodlieWhite,
          appBar: AppBar(
            backgroundColor: FoodlieColors.foodlieWhite,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: FoodlieColors.foodlieBlack,
              ),
            ),
            title: TextBold(
              'Address',
              fontSize: 17,
              color: const Color(0xff363C4F),
              fontWeight: FontWeight.w700,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(30),
                  state.maybeWhen(
                    orElse: () => const SizedBox(),
                    success: (address, defaultAdress) {
                      return Column(
                        children: List.generate(
                          address.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    width: 2,
                                    color: FoodlieColors.primaryColor,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Gap(30),
                                            TextBold(
                                              address[index].contact_name,
                                              fontSize: 19,
                                              color: const Color(0xff000000),
                                            ),
                                            const Gap(6),
                                            TextSemiBold(
                                              address[index].address,
                                              fontSize: 14,
                                              maxLines: 3,
                                              color: const Color(0xff534F4F),
                                            ),
                                            const Gap(6),
                                            TextSemiBold(
                                              address[index].phone_number,
                                              fontSize: 14,
                                              color: const Color(0xff534F4F),
                                            ),
                                            const Gap(20),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await context
                                              .read<SetDefaultAddressCubit>()
                                              .setDefaultAddress(
                                                context,
                                                address_id:
                                                    address[index].address_id,
                                              );
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: address[index].is_default ??
                                                    false
                                                ? Colors.grey
                                                : FoodlieColors.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Center(
                                            child: TextBody(
                                              address[index].is_default ?? false
                                                  ? 'Default'
                                                  : 'Set Default',
                                              color: FoodlieColors.foodlieWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                      /*  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 30,
                                      color: FoodlieColors.primaryColor,
                                    ),
                                  ),*/
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const Gap(40),
                  BusyButton(
                    title: 'Add Address',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.addAddress,
                      );
                    },
                  ),
                  const Gap(30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
