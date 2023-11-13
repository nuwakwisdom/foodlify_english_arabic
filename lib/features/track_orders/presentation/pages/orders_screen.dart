// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/track_orders/presentation/widgets/widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
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
          'Order/History',
          fontSize: 17,
          color: FoodlieColors.foodlieBlack,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(10),
              InputField(
                controller: TextEditingController(),
                placeholder: 'Search.....',
                fieldColor: FoodlieColors.foodlieWhite,
                validationColor: FoodlieColors.grey,
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    AppAssets.searchIcon,
                  ),
                ),
              ),
              const Gap(14),
              Column(
                children: List.generate(
                  4,
                  (index) => const OrdersCard(
                    name: 'Qt Restaurant',
                    img: AppAssets.jellofRice,
                    item: '6 items',
                    day: 'Yesterday',
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              BusyButton(
                title: 'Track order',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrdersCard extends StatelessWidget {
  const OrdersCard({
    super.key,
    required this.name,
    required this.img,
    required this.item,
    required this.day,
  });
  final String name;
  final String img;
  final String item;
  final String day;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const ReceiptDialog();
            },
          );
        },
        child: Container(
          height: 91,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffE1E5E7),
            boxShadow: [
              BoxShadow(
                color: FoodlieColors.foodlieBlack.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                img,
                height: double.infinity,
                width: 124,
                fit: BoxFit.fill,
              ),
              const Gap(5),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSemiBold(
                      name,
                      fontSize: 12.48,
                      color: FoodlieColors.foodlieBlack,
                    ),
                    const Gap(24),
                    TextBody(
                      item,
                      fontSize: 11.3,
                      color: FoodlieColors.grey,
                    ),
                    const Gap(1),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: TextBody(
                          day,
                          fontSize: 10,
                          color: FoodlieColors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
