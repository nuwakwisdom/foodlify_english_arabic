// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        title: TextSemiBold(
          'Transaction Details',
          fontSize: 14,
          color: const Color(0xff363C4F),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.foodlieBlack,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                const Gap(20),
                Align(
                  child: Image.asset(
                    AppAssets.newColoredLogo,
                    height: 52,
                    width: 52,
                  ),
                ),
                const Gap(50),
                Container(
                  height: 274,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF5F6F8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DetailsItems(
                          title: 'Restaurant:',
                          subTitle: 'QTT Restaurant',
                        ),
                        Gap(20),
                        DetailsItems(
                          title: 'Ref ID:',
                          subTitle: '#1234567890',
                        ),
                        Gap(20),
                        DetailsItems(
                          title: 'Date:',
                          subTitle: '04.07.2023',
                        ),
                        Gap(20),
                        DetailsItems(
                          title: 'Time:',
                          subTitle: '11:28',
                        ),
                        Gap(20),
                        DetailsItems(
                          title: 'Status:',
                          subTitle: 'Successful',
                        ),
                        Gap(20),
                        DetailsItems(
                          title: 'Note:',
                          subTitle:
                              'Got 2 shawarma to be delivered to St. Pauls Joint, Opp. My Crip',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsItems extends StatelessWidget {
  const DetailsItems({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextSemiBold(
          title,
          fontSize: 13,
          color: const Color(0xff676262),
        ),
        const Gap(21),
        Expanded(
          child: TextBold(
            subTitle,
            fontSize: 13,
            color: const Color(0xff676262),
            maxLines: 6,
          ),
        ),
      ],
    );
  }
}
