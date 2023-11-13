// ignore_for_file: unnecessary_statements

import 'dart:async';
import 'dart:io';

import 'package:Foodlify/core/constant/app_assets.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:Foodlify/core/utils/ui_helper.dart';
import 'package:Foodlify/features/home/presentation/cubit/wallet_cubit.dart';
import 'package:Foodlify/features/wallet/presentation/widgets/bank_transfer_method.dart';
import 'package:Foodlify/features/wallet/presentation/widgets/monify_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final ValueNotifier<bool> _currentIndex = ValueNotifier(false);
  String symbol = '';
  String getCurrency() {
    final format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    symbol = format.currencySymbol;
    return format.currencySymbol;
  }

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(
        seconds: 5,
      ),
      (timer) {
        if (mounted) {
          Future.delayed(Duration.zero, () {
            context.read<WalletCubit>().getWallet(context);
          });
        }
      },
    );
    getCurrency();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final uiHelper = UiHelper(context);
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {
        state.maybeWhen(orElse: () {});
      },
      builder: (context, state) {
        final wallet = context.read<WalletCubit>().wallet;

        final amount = NumberFormat.currency(
          customPattern: '#,###,###',
          locale: 'en_us',
          symbol: '₦',
          decimalDigits: wallet?.balance == 0 || wallet?.balance == null ? 0 : 1,
        ).format(wallet?.balance ?? 0);
        return RefreshIndicator(
          onRefresh: () async {
            await context.read<WalletCubit>().getWallet(context);
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(
                color: FoodlieColors.foodlieBlack,
              ),
              elevation: 0,
              title: const Text(
                'Wallet',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: FoodlieColors.foodlieBlack,
                ),
              ),
            ),
            body: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, index, _) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(
                        23,
                      ),
                      height: 130,
                      width: uiHelper.screenSize.width,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 118,
                              decoration: BoxDecoration(
                                color: const Color(0xffF5F6F8),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 18,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Main Wallet',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      Gap(3),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'Your balance',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    '$symbol$amount',
                                    style: const TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 43,
                              width: 43,
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: FoodlieColors.primaryColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(AppAssets.wallet),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(23),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FoodleTab(
                          text: 'Wallet',
                          isActive: index,
                          onTap: () {
                            _currentIndex.value = true;
                          },
                        ),
                        FoodleTab(
                          text: 'WeQuickPay',
                          isActive: !index,
                          onTap: () {
                            _currentIndex.value = false;
                          },
                        ),
                      ],
                    ),
                    if (index)
                      BankTransferMethod(
                        accountName: '${wallet?.first_name ?? ''} ${wallet?.last_name ?? ''}',
                        bankName: wallet?.bank_name ?? '',
                        accountNumber: wallet?.wallet_id ?? '',
                      )
                    else
                      const MonifyMethod(),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class FoodleTab extends StatelessWidget {
  const FoodleTab({
    super.key,
    required this.text,
    this.onTap,
    this.isActive = false,
  });
  final String text;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final uiHelper = UiHelper(context);
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Gap(5),
            Container(
              height: 3,
              width: uiHelper.screenSize.width / 2,
              color: isActive ? FoodlieColors.primaryColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
