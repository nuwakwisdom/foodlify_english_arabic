import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_orders_cubit.dart';
import 'package:Foodlify/features/orders/presentation/pages/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OpenOrderWidget extends StatefulWidget {
  const OpenOrderWidget({super.key});

  @override
  State<OpenOrderWidget> createState() => _OpenOrderWidgetState();
}

class _OpenOrderWidgetState extends State<OpenOrderWidget> {
  @override
  Widget build(BuildContext context) {
    final orders = context.read<GetOrdersCubit>().orders;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(orders?.length ?? 0, (index) {
            final orderDate = DateFormat('dd-MM-yyyy').format(
              DateTime.parse(orders?[index].order_at ?? ''),
            );

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.orderDetails,
                    arguments: OrderDetailsArguement(
                      ordersDetails: orders![index],
                    ),
                  );
                },
                child: Container(
                  height: 142,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: FoodlieColors.foodlieWhite,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 1),
                        color: Color(0xffDCDFE5),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 89,
                          width: 82,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 82,
                                  width: 82,
                                  decoration: BoxDecoration(
                                    color: FoodlieColors.foodlieWhite,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                        color: FoodlieColors.foodlieBlack
                                            .withOpacity(0.15),
                                      )
                                    ],
                                  ),
                                  child: Center(
                                      child: ClipOval(
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), //
                                      child: Image.network(
                                          orders?[index].food.image ?? ''),
                                    ),
                                  )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 17.5,
                                  width: 17.5,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: FoodlieColors.primaryColor,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppAssets.loveIcon,
                                      height: 8,
                                      width: 8,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Gap(45),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextSemiBold(
                                orders?[index].food.title ?? '',
                                fontSize: 13,
                                color: FoodlieColors.textColor,
                              ),
                              const Gap(5),
                              TextBody(
                                'Order #${orders?[index].order_id ?? ''}',
                                fontSize: 10,
                                color: const Color(0xff757575),
                              ),
                              const Gap(5),
                              TextBody(
                                '1 items',
                                fontSize: 15,
                                color: FoodlieColors.textColor,
                              ),
                              const Gap(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 23,
                                      width: 59,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            orders?[index].status == 'PENDING'
                                                ? const Color(0xff979899)
                                                : FoodlieColors.green,
                                      ),
                                      child: Center(
                                        child: TextSemiBold(
                                          orders?[index].status ?? '',
                                          fontSize: 10,
                                          color: FoodlieColors.foodlieWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 28,
                                    width: 81,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: FoodlieColors.primaryColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.ordersIcon,
                                          color: FoodlieColors.foodlieWhite,
                                          height: 20,
                                          width: 20,
                                        ),
                                        const Gap(5),
                                        TextSemiBold(
                                          'Re-order',
                                          fontSize: 10,
                                          color: FoodlieColors.foodlieWhite,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(13),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextBody(
                                  orderDate,
                                  fontSize: 10,
                                  color: const Color(0xff757575),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
