// ignore_for_file: lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        title: TextSemiBold(
          'Terms and Condition',
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
            horizontal: 40,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(20),
                TextBody(
                  'Welcome to Foodlify, your trusted food delivery service. By using our website, application, or services, you are agreeing to the following terms and conditions.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '1. Acceptance of Terms By accessing or using Foodlify, you agree to be bound by these Terms and Conditions ("T&C"). If you disagree with any part of the terms, then you may not access our service.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '2. Registration To use our service, you may need to register for an account. You must provide accurate information and keep it updated. You are responsible for maintaining the confidentiality of your account and password.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '3. Orders and Payments All prices listed are inclusive of any applicable taxes. We reserve the right to adjust pricing at any time. Payment is due at the time of order. We accept various forms of payment, which are specified at the time of checkout. Refunds or cancellations are subject to our Refund and Cancellation Policy.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '4. Delivery We strive to deliver your order in a timely manner. However, delivery times are estimates and cannot be guaranteed. Ensure that you provide accurate delivery information. We are not responsible for orders delivered to the wrong address provided by the user.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '5. Quality and Food Safety While we partner with reputable restaurants and ensure quality, the responsibility for food quality, safety, and freshness lies with the respective restaurant. Please contact the restaurant directly for concerns regarding your order.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '6. User Conduct Users are expected to behave respectfully to our delivery staff and restaurant partners. Any harassment or inappropriate behavior may result in suspension or banning from the Foodlify platform.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '7. Limitation of Liability To the maximum extent permitted by applicable law, Foodlify shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '8. Changes to T&C We may revise these T&C from time to time. The revised version will be effective at the time we post it unless otherwise noted.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '9. Governing Law These T&C are governed by and construed in accordance with the laws of Nigeria , without regard to its conflict of law principles.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
                const Gap(20),
                TextBody(
                  '10. Contact For any queries regarding these T&C, please contact us at support@foodlify.com.ng.',
                  fontSize: 13,
                  maxLines: 100,
                  color: const Color(0xff676262),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
