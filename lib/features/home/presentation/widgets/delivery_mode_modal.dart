// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/account/presentation/cubit/get_address_cubit.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/presentation/cubit/order_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/order_food_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class DeliveryMode extends StatefulWidget {
  const DeliveryMode({
    super.key,
    this.foodEntity,
    required this.directOrder,
    required this.name,
    this.cartId,
  });
  final RestaurantFoodEntity? foodEntity;
  final String? cartId;
  final bool directOrder;
  final String name;
  @override
  State<DeliveryMode> createState() => _DeliveryModeState();
}

class _DeliveryModeState extends State<DeliveryMode> {
  bool delivery = true;
  bool pickup = false;
  bool dineIn = false;
  @override
  void initState() {
    super.initState();
    context.read<GetAddressCubit>().getDeliveryAddress(context);
  }

  @override
  Widget build(BuildContext context) {
    final address = context.read<GetAddressCubit>().deliveryAddresses;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: FoodlieColors.foodlieWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBold(
              'Select Mode',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: const Color(0xff3D3D3D),
            ),
            const Gap(40),
            TextBody(
              'Please select any mode you want to get your order!',
              fontSize: 18,
              color: const Color(0xff3D3D3D).withOpacity(0.3),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DeliveryTypes(
                  img: AppAssets.bike,
                  type: 'Delivery',
                  selected: delivery,
                  onTap: () {
                    setState(() {
                      delivery = true;
                      pickup = false;
                      dineIn = false;
                    });
                  },
                ),
                DeliveryTypes(
                  img: AppAssets.deliveryBag,
                  type: 'Pick Up',
                  selected: pickup,
                  onTap: () {
                    setState(() {
                      delivery = false;
                      pickup = true;
                      dineIn = false;
                    });
                  },
                ),
                DeliveryTypes(
                  img: AppAssets.foodPlate,
                  type: 'Dine-in',
                  selected: dineIn,
                  onTap: () {
                    setState(() {
                      delivery = false;
                      pickup = false;
                      dineIn = true;
                    });
                  },
                )
              ],
            ),
            const Gap(27),
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.addressIcon,
                ),
                const Gap(10),
                Expanded(
                  child: TextBody(
                    address?.first.address ?? '',
                    fontSize: 15,
                    color: FoodlieColors.foodlieBlack,
                  ),
                ),
                const Gap(14),
                GestureDetector(
                  onTap: () {},
                  child: TextBody(
                    'Change',
                    fontSize: 14,
                    color: FoodlieColors.foodliePink,
                  ),
                )
              ],
            ),
            const Gap(20),
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.phoneIcon,
                  color: FoodlieColors.foodlieBlack,
                ),
                const Gap(10),
                Expanded(
                  child: TextBody(
                    address?.first.phone_number ?? '',
                    fontSize: 15,
                    color: FoodlieColors.foodlieBlack,
                  ),
                ),
                const Gap(30),
                GestureDetector(
                  onTap: () {},
                  child: TextBody(
                    'Change',
                    fontSize: 14,
                    color: FoodlieColors.foodliePink,
                  ),
                )
              ],
            ),
            const Gap(41),
            GestureDetector(
              onTap: () async {
                widget.directOrder
                    ? await context.read<OrderFoodCubit>().orderFood(
                          context,
                          foodId: widget.foodEntity?.food_id ?? '',
                          amountPaid: widget.foodEntity?.price ?? 0,
                          address_id: address?.first.address_id ?? '',
                        )
                    : await context.read<OrderCartCubit>().orderCart(
                          context,
                          cartId: widget.cartId ?? '',
                          address_id: address?.first.address_id ?? '',
                        );
              },
              child: Container(
                height: 51,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: FoodlieColors.foodliePink,
                ),
                child: Center(
                  child: TextBold(
                    'Confim',
                    fontSize: 14,
                    color: FoodlieColors.foodlieWhite,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DeliveryTypes extends StatelessWidget {
  const DeliveryTypes({
    super.key,
    required this.img,
    required this.type,
    required this.selected,
    required this.onTap,
  });
  final String img;
  final String type;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 57,
            width: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selected
                  ? FoodlieColors.foodliePink
                  : const Color(0xffC4C4C4),
            ),
            child: Center(
              child: SvgPicture.asset(
                img,
              ),
            ),
          ),
          const Gap(8),
          TextBold(
            type,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color(0XFF3d3d3d),
          ),
          const Gap(6),
          Container(
            height: 2,
            width: 43,
            decoration: BoxDecoration(
              color: selected
                  ? FoodlieColors.foodliePink
                  : FoodlieColors.foodlieWhite,
            ),
          ),
        ],
      ),
    );
  }
}
