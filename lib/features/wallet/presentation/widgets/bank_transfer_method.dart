import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/core/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class BankTransferMethod extends StatefulWidget {
  const BankTransferMethod({
    super.key,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
  });
  final String bankName;
  final String accountNumber;
  final String accountName;
  @override
  State<BankTransferMethod> createState() => _BankTransferMethodState();
}

class _BankTransferMethodState extends State<BankTransferMethod> {
  @override
  Widget build(BuildContext context) {
    final uiHelper = UiHelper(context);
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: uiHelper.getMappedWidth(50),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(60),
              detailCard(
                title: 'Account Name',
                value: widget.bankName,
              ),
              const Gap(10),
              _divider(),
              const Gap(16),
              detailCard(
                title: 'Bank Name',
                value: widget.accountName,
              ),
              const Gap(10),
              _divider(),
              const Gap(16),
              detailCard(
                title: 'Account Number',
                value: widget.accountNumber,
              ),
              const Gap(40),
              const SizedBox(
                width: 265,
                child: Text(
                  'This works like a regular bank account. your payment will be credited to your Foodlify Wallet instantly',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF979899),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Gap(60),
              GestureDetector(
                onTap: () async {
                  await Share.share(
                    'Account Name: Julius \nBank Name: Opay \nAccount Number: 555555',
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Color(0xFFFD654D),
                    ),
                    Gap(20),
                    Text(
                      'Share My Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFD654D),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }

  Divider _divider() {
    return Divider(
      height: 0.5,
      color: FoodlieColors.primaryColor.withOpacity(0.2),
    );
  }

  Widget detailCard({
    required String title,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBold(
              title,
              fontWeight: FontWeight.w500,
              color: FoodlieColors.grey1,
              fontSize: 14,
            ),
            const Gap(5),
            TextBold(
              value,
              fontWeight: FontWeight.w800,
              fontSize: 14,
            ),
          ],
        ),
        GestureDetector(
          onTap: () async {
            await Clipboard.setData(
              ClipboardData(
                text: value,
              ),
            );
            FlushbarNotification.showSuccessMessage(
              context,
              message: 'Copied $title succssfully',
            );
          },
          child: Icon(Icons.copy),
        ),
      ],
    );
  }
}
