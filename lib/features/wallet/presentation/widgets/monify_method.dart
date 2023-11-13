// ignore_for_file: lines_longer_than_80_chars

import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/core/utils/ui_helper.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:Foodlify/features/wallet/presentation/bloc/wallet_top_up_cubit.dart';
import 'package:Foodlify/features/wallet/presentation/bloc/wallet_top_up_state.dart';
import 'package:Foodlify/features/wallet/presentation/widgets/web_view_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MonifyMethod extends StatefulWidget {
  const MonifyMethod({super.key});

  @override
  State<MonifyMethod> createState() => _MonifyMethodState();
}

class _MonifyMethodState extends State<MonifyMethod> {
  final ValueNotifier<int?> _currentIndex = ValueNotifier(null);
  final amountTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final uiHelper = UiHelper(context);
    return BlocProvider(
      create: (context) => WalletTopUpCubit(
        homeRepository: sl<HomeRepository>(),
      ),
      child: Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: uiHelper.getMappedWidth(50),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(60),
                const Text(
                  'Amount to top up',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const Gap(20),
                const Text(
                  'Amount',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap(7),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: amountTextEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Input amount',
                      fillColor: Color(0xFFFFE8D2),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {});
                      _currentIndex.value = null;
                    },
                  ),
                ),
                const Gap(20),
                ValueListenableBuilder(
                  valueListenable: _currentIndex,
                  builder: (context, currentIndex, value) {
                    return Flexible(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return _AmountCard(
                            amount: '${1 + index}000',
                            onTap: () {
                              amountTextEditingController.text = '${1 + index}000';
                              _currentIndex.value = index;
                              setState(() {});
                            },
                            isActive: currentIndex == index,
                          );
                        },
                      ),
                    );
                  },
                ),
                const Gap(40),
                BlocConsumer<WalletTopUpCubit, WalletTopUpState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      error: (message) => FlushbarNotification.showErrorMessage(
                        context,
                        message: message,
                      ),
                      checkOut: (url) {
                        showDialog<void>(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: WebViewPopup(
                                url: url,
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return ValueListenableBuilder(
                      valueListenable: _currentIndex,
                      builder: (context, currentIndex, child) {
                        return BusyButton(
                          title: 'Fund Wallet',
                          busy: state.maybeWhen(
                            orElse: () => false,
                            loading: () => true,
                          ),
                          onTap: amountTextEditingController.text.isEmpty
                              ? null
                              : () {
                                  context.read<WalletTopUpCubit>().init(
                                        amount: double.parse(amountTextEditingController.text.trim()),
                                      );
                                },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AmountCard extends StatelessWidget {
  const _AmountCard({
    required this.amount,
    this.onTap,
    this.isActive = false,
  });

  final String amount;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isActive ? FoodlieColors.primaryColor : const Color(0xFFFFE8D2),
        ),
        child: Center(
          child: Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: isActive ? Colors.white : FoodlieColors.foodlieBlack,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
