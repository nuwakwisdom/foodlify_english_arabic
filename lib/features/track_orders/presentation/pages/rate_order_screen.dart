// ignore_for_file: inference_failure_on_function_invocation, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/auth/presentation/widgets/sucees_dialog.dart';

class RateOrders extends StatefulWidget {
  const RateOrders({super.key});

  @override
  State<RateOrders> createState() => _RateOrdersState();
}

class _RateOrdersState extends State<RateOrders> {
  int currentStar = 0;
  bool hiFoodlieActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                TextBold(
                  'You\nreceived the\norder!',
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  maxLines: 4,
                ),
                const Gap(20),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  allowHalfRating: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: FoodlieColors.primaryColor,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const Gap(40),
                Container(
                  height: 297,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xff646464).withOpacity(0.2),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 23,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(25),
                          TextBody(
                            'Hi Foodlie............',
                            fontSize: 14,
                            color: hiFoodlieActive
                                ? FoodlieColors.foodlieBlack
                                : FoodlieColors.grey1,
                          ),
                          const Gap(10),
                          TextField(
                            controller: TextEditingController(),
                            onTap: () {
                              setState(() {
                                hiFoodlieActive = true;
                              });
                            },
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: FoodlieColors.foodlieBlack,
                            ),
                            maxLines: 400,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(30),
                BusyButton(
                  title: 'Send',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessDialog(
                          title:
                              'Thank you for taking the time to\nreview  review. I hope you found it\nhelpful and informative.',
                          onTap: () {},
                          successType: 'Sent ',
                        );
                      },
                    );
                  },
                ),
                const Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
