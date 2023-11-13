// ignore_for_file: inference_failure_on_function_invocation, lines_longer_than_80_chars, inference_failure_on_function_return_type, always_declare_return_types, unnecessary_statements, use_build_context_synchronously, unawaited_futures

import 'dart:io';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/account/domain/entities/delivery_address_entities.dart';
import 'package:Foodlify/features/account/presentation/cubit/get_address_cubit.dart';
import 'package:Foodlify/features/home/domain/entities/food_list_entities.dart';
import 'package:Foodlify/features/home/presentation/cubit/add_cart_food_count_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/reduce_cart_food_count_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/remove_food_from_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/pages/new_delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class CartProceed extends StatefulWidget {
  const CartProceed({super.key});

  @override
  State<CartProceed> createState() => _CartProceedState();
}

class _CartProceedState extends State<CartProceed> {
  List<FoodListEnntities>? carts;
  // ignore: type_annotate_public_apis

  String symbol = '';
  String getCurrency() {
    final format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    symbol = format.currencySymbol;
    return format.currencySymbol;
  }

  Future<void> getData() async {
    await context.read<GetCartCubit>().getCarts(context);
    context.read<GetAddressCubit>().getDeliveryAddress(context);
    context.read<GetAddressCubit>().getDefaultAdreess(context);
    getCurrency();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, getData);
  }

  DeliveryAddressEntity newDefaultAddress = const DeliveryAddressEntity(
    address: '',
    address_id: '',
    contact_name: '',
    phone_number: '',
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        num? total;
        state.maybeWhen(
          orElse: () {},
          error: (e) {},
          success: (cart) {},
        );
        final cart = context.read<GetCartCubit>().carts;
        final defautlAddress =
            context.read<GetAddressCubit>().defaultDelliveryAddress;
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
              'Cart',
              fontSize: 17,
              color: FoodlieColors.foodlieBlack,
              fontWeight: FontWeight.w500,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<GetAddressCubit, GetAddressState>(
                      builder: (context, state) {
                    return Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xffDCDFE5).withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextSemiBold(
                                  'Deliver to',
                                  fontSize: 10,
                                  color: FoodlieColors.grey,
                                ),
                                const Gap(5),
                                state.maybeWhen(
                                  orElse: () => const SizedBox(),
                                  success: (address, defaulltAddress) {
                                    newDefaultAddress = defaulltAddress;
                                    return TextBold(
                                      defaulltAddress.address,
                                      fontSize: 10,
                                      color: FoodlieColors.grey1,
                                    );
                                  },
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                defautlAddress?.address == null
                                    ? Navigator.pushNamed(
                                        context,
                                        RouteName.addAddress,
                                      )
                                    : Navigator.pushNamed(
                                        context,
                                        RouteName.viewAddress,
                                      );
                              },
                              child: Row(
                                children: [
                                  TextBold(
                                    defautlAddress?.address == null
                                        ? 'Add Address'
                                        : 'Change',
                                    fontSize: 10,
                                    color: FoodlieColors.primaryColor,
                                  ),
                                  const Gap(10),
                                  SvgPicture.asset(
                                    AppAssets.change,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  const Gap(15),
                  Column(
                    children:
                        List.generate(cart?.cart_foods.length ?? 0, (index) {
                      final amount = NumberFormat.currency(
                        customPattern: '#,###,###',
                        locale: 'en_us',
                        symbol: '₦',
                        decimalDigits: 2,
                      ).format(cart?.cart_foods[index].food.price ?? '');

                      final qty = cart?.cart_foods[index].quantity ?? 0;

                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 25,
                        ),
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (e) async {
                                  await context
                                      .read<RemoveFoodFromCartCubit>()
                                      .removeFoodFromCart(
                                        context,
                                        foodId: cart?.cart_foods[index].food
                                                .food_id ??
                                            '',
                                      );
                                  context
                                      .read<GetCartCubit>()
                                      .getCarts(context);
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FoodlieColors.foodlieWhite,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 8,
                                  color: Color(0xffDCDFE5),
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            height: 100,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 75,
                                    width: 76,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffD9D9D9),
                                    ),
                                    child: Center(
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor:
                                            FoodlieColors.foodlieWhite,
                                        backgroundImage: NetworkImage(
                                          cart?.cart_foods[index].food.image ??
                                              '',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(35),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextBold(
                                          cart?.cart_foods[index].food.title ??
                                              '',
                                          fontSize: 13,
                                          color: FoodlieColors.textColor,
                                        ),
                                        const Gap(3),
                                        TextBold(
                                          cart?.cart_foods[index].food
                                                  .restaurant ??
                                              '',
                                          fontSize: 13,
                                          color: FoodlieColors.primaryColor,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextBody(
                                              '$symbol$amount',
                                              fontSize: 15,
                                              color: FoodlieColors.textColor,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 83,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: FoodlieColors
                                                      .primaryColor,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        qty == 1
                                                            ? null
                                                            : context
                                                                .read<
                                                                    ReduceCartFoodCountCubit>()
                                                                .reduceCartFoodCount(
                                                                  context,
                                                                  foodId: cart
                                                                          ?.cart_foods[
                                                                              index]
                                                                          .food
                                                                          .food_id ??
                                                                      '',
                                                                  quantity: 1,
                                                                );
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        size: 20,
                                                        color: FoodlieColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    TextSemiBold(
                                                      '$qty',
                                                      fontSize: 16,
                                                      color: FoodlieColors
                                                          .primaryColor,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                AddCartFoodCountCubit>()
                                                            .addCartFoodCount(
                                                              context,
                                                              foodId: cart
                                                                      ?.cart_foods[
                                                                          index]
                                                                      .food
                                                                      .food_id ??
                                                                  '',
                                                              quantity: 1,
                                                            );
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 20,
                                                        color: FoodlieColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const Gap(34),
                  TextSemiBold(
                    'Payment Summary',
                    fontSize: 16,
                    color: FoodlieColors.textColor,
                  ),
                  const Gap(28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBody(
                        'Food Price',
                        fontSize: 13,
                        color: FoodlieColors.textColor2,
                      ),
                      TextBody(
                        '$symbol${cart?.total_food_price ?? 0}',
                        fontSize: 13,
                        color: FoodlieColors.textColor2,
                      )
                    ],
                  ),
                  const Gap(18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSemiBold(
                        'Delivery fee',
                        fontSize: 13,
                        color: FoodlieColors.textColor2,
                      ),
                      TextSemiBold(
                        '$symbol${cart?.delivery ?? 0}',
                        fontSize: 13,
                        color: FoodlieColors.textColor2,
                      )
                    ],
                  ),
                  /*  const Gap(19),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBold(
                              'Total',
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: FoodlieColors.grey,
                            ),
                            TextBold(
                              'N1,830',
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: FoodlieColors.grey,
                            ),
                          ],
                        ),*/
                  const Gap(42),
                  /*  BusyButton(
                          title: 'Proceed to Pay',
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return const CheckOutModal();
                              },
                            );
                          },
                        ),*/
                  const Gap(160),
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            height: 140,
            decoration: const BoxDecoration(
              color: FoodlieColors.foodlieWhite,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.caseIcon,
                    ),
                    const Gap(6),
                    TextSemiBold(
                      'Go to Wallet',
                      fontSize: 13,
                      color: FoodlieColors.primaryColor,
                    )
                  ],
                ),
                const Gap(27),
                Container(
                  height: 3,
                  color: const Color(0xffDCDFE5),
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBody(
                            'Total',
                            fontSize: 12,
                            color: FoodlieColors.grey,
                          ),
                          const Gap(2),
                          TextSemiBold(
                            '$symbol${cart?.total_cart_price ?? 0}',
                            fontSize: 20,
                            color: FoodlieColors.foodlieBlack,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          /*showModalBottomSheet(
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return const KitchenTimerPopUp();
                              });*/
                          Navigator.pushNamed(
                            context,
                            RouteName.newDeliveryScreen,
                            arguments: DeliveryArguement(
                              deliveryAdressEntity: newDefaultAddress,
                              foodPrice: cart?.total_food_price ?? 0,
                              noItem: cart?.cart_foods.length ?? 0,
                              cartId: cart?.cart_id ?? '',
                              amount: cart?.total_cart_price ?? 0,
                              fromCart: true,
                              username: context
                                      .read<GetUserCubit>()
                                      .users
                                      ?.first_name ??
                                  '',
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 142,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: FoodlieColors.primaryColor,
                          ),
                          child: Center(
                            child: TextSemiBold(
                              'Checkout',
                              fontSize: 14,
                              color: FoodlieColors.foodlieWhite,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
