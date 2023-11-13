// ignore_for_file: deprecated_member_use, inference_failure_on_function_invocation

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/route_name.dart';
import 'package:Foodlify/features/account/domain/entities/delivery_address_entities.dart';
import 'package:Foodlify/features/account/presentation/cubit/get_address_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/order_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/order_food_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class NewDeliveryScreen extends StatefulWidget {
  const NewDeliveryScreen({
    super.key,
    required this.params,
  });
  final DeliveryArguement params;
  @override
  State<NewDeliveryScreen> createState() => _NewDeliveryScreenState();
}

class _NewDeliveryScreenState extends State<NewDeliveryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetAddressCubit>().getDeliveryAddress(context);
  }

  @override
  Widget build(BuildContext context) {
    final address = context.read<GetAddressCubit>().deliveryAddresses;
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
          'Delivery',
          fontSize: 17,
          color: FoodlieColors.foodlieBlack,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Container(
                  height: 39,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0xffDCDFE5).withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                          'Order Summary ',
                          fontSize: 13,
                          color: FoodlieColors.textColor2,
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(22),
                PriceItem(
                  title: 'Number of items’ ',
                  amount: '${widget.params.noItem}',
                ),
                const Gap(11),
                PriceItem(
                  title: 'Item amount',
                  amount: '₦${widget.params.foodPrice}',
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBold(
                      'Total',
                      fontSize: 15,
                      color: FoodlieColors.textColor2,
                    ),
                    TextBold(
                      '₦${widget.params.amount}',
                      fontSize: 15,
                      color: FoodlieColors.textColor2,
                    )
                  ],
                ),
                const Gap(21),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.viewAddress);
                  },
                  child: Container(
                    height: 39,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xffDCDFE5).withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBold(
                            'Delivery Address',
                            fontSize: 13,
                            color: FoodlieColors.textColor2,
                          ),
                          Row(
                            children: [
                              TextSemiBold(
                                'Change',
                                fontSize: 10,
                                color: FoodlieColors.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                              const Gap(12),
                              SvgPicture.asset(
                                AppAssets.change,
                                color: FoodlieColors.primaryColor,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(11),
                TextBody(
                  widget.params.deliveryAdressEntity.contact_name,
                  fontSize: 13,
                  color: FoodlieColors.textColor2,
                ),
                const Gap(11),
                TextSemiBold(
                  widget.params.deliveryAdressEntity.address,
                  fontSize: 12,
                  color: FoodlieColors.grey1,
                ),
                const Gap(21),
                /* Container(
                  height: 39,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0xffDCDFE5).withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                          'Delivery Method',
                          fontSize: 13,
                          color: FoodlieColors.textColor2,
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(11),
                TextSemiBold(
                  'Home delivery',
                  fontSize: 13,
                  color: FoodlieColors.textColor2,
                ),
                const Gap(11),
                TextSemiBold(
                  'No. 26 Chicken Street, Zaria Road, Abuja',
                  fontSize: 12,
                  color: FoodlieColors.grey1,
                )*/
              ],
            ),
            Column(
              children: [
                BusyButton(
                  title: 'Proceed to Payment',
                  onTap: () {
                    widget.params.fromCart
                        ? context.read<OrderCartCubit>().orderCart(
                              context,
                              address_id: address?.first.address_id ?? '',
                              cartId: widget.params.cartId,
                            )
                        : context.read<OrderFoodCubit>().orderFood(
                              context,
                              foodId: widget.params.cartId,
                              amountPaid: widget.params.amount,
                              address_id: address?.first.address_id ?? '',
                            );
                  },
                ),
                const Gap(30),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PriceItem extends StatelessWidget {
  const PriceItem({
    super.key,
    required this.title,
    required this.amount,
  });
  final String title;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextBody(
          title,
          fontSize: 13,
          color: FoodlieColors.textColor2,
        ),
        TextBody(
          amount,
          fontSize: 13,
          color: FoodlieColors.textColor2,
        )
      ],
    );
  }
}

class DeliveryArguement {
  DeliveryArguement({
    required this.noItem,
    required this.amount,
    required this.username,
    required this.cartId,
    required this.fromCart,
    required this.foodPrice,
    required this.deliveryAdressEntity,
  });

  final int noItem;
  final num amount;
  final String username;
  final String cartId;
  final bool fromCart;
  final num foodPrice;
  final DeliveryAddressEntity deliveryAdressEntity;
}
