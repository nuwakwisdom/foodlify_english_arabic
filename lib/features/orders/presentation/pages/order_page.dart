// ignore_for_file: avoid_redundant_argument_values, deprecated_member_use

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_orders_cubit.dart';
import 'package:Foodlify/features/orders/presentation/widgets/close_orders.dart';
import 'package:Foodlify/features/orders/presentation/widgets/open_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool openOrders = true;
  bool closedOrders = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<GetOrdersCubit>().getOrders(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        centerTitle: true,
        leading: null,
        title: TextSemiBold(
          'Order History',
          fontSize: 14,
          color: const Color(0xff363C4F),
        ),
      ),
      body: Column(
        children: [
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                const Gap(10),
                InputField(
                  controller: TextEditingController(),
                  placeholder: 'Search',
                  prefix: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.searchIcon,
                    ),
                  ),
                ),
                const Gap(15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchItemContainer(
                      icon: AppAssets.fork,
                      title: 'Restaurant',
                    ),
                    Gap(20),
                    SearchItemContainer(
                      icon: AppAssets.calenderIcon,
                      title: 'Date',
                    ),
                    Gap(20),
                    SearchItemContainer(
                      icon: AppAssets.knifeIcon,
                      title: 'Food',
                    ),
                  ],
                ),
                const Gap(20),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      openOrders = true;
                      closedOrders = false;
                    });
                  },
                  child: Column(
                    children: [
                      TextBody(
                        'Open Orders',
                        color: openOrders
                            ? FoodlieColors.primaryColor
                            : FoodlieColors.grey1,
                        fontSize: 14,
                      ),
                      const Gap(5),
                      Container(
                        height: 3,
                        width: double.infinity,
                        color: openOrders
                            ? FoodlieColors.primaryColor
                            : FoodlieColors.grey1,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      openOrders = false;
                      closedOrders = true;
                    });
                  },
                  child: Column(
                    children: [
                      TextBody(
                        'Closed Orders',
                        color: closedOrders
                            ? FoodlieColors.primaryColor
                            : FoodlieColors.grey1,
                        fontSize: 14,
                      ),
                      const Gap(5),
                      Container(
                        height: 3,
                        width: double.infinity,
                        color: closedOrders
                            ? FoodlieColors.primaryColor
                            : FoodlieColors.grey1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const Gap(20),
          if (openOrders)
            const Expanded(
              child: OpenOrderWidget(),
            )
          else
            const Expanded(child: ClosedOrdersWidget())
        ],
      ),
    );
  }
}

class SearchItemContainer extends StatelessWidget {
  const SearchItemContainer({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xffF5F6F8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 16,
              width: 16,
            ),
            const Gap(5),
            TextSemiBold(
              title,
              fontSize: 10,
              color: FoodlieColors.grey1,
            )
          ],
        ),
      ),
    );
  }
}
