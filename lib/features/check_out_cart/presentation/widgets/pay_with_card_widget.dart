import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PayWithCardWidget extends StatefulWidget {
  const PayWithCardWidget({super.key});

  @override
  State<PayWithCardWidget> createState() => _PayWithCardWidgetState();
}

class _PayWithCardWidgetState extends State<PayWithCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(34),
          TextBody(
            'Card details',
            fontSize: 12,
            color: const Color(0xff3D3D3D),
          ),
          const Gap(10),
          InputField(
            controller: TextEditingController(),
            fieldColor: Colors.transparent,
            validationColor: const Color(0xffDFE2E5),
            placeholder: 'Card Number',
          ),
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBody(
                      'Exp date',
                      fontSize: 12,
                      color: const Color(0xff3D3D3D),
                    ),
                    const Gap(10),
                    InputField(
                      controller: TextEditingController(),
                      placeholder: 'DD/MM',
                      fieldColor: Colors.transparent,
                      validationColor: const Color(0xffDFE2E5),
                    )
                  ],
                ),
              ),
              const Gap(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBody(
                      'CVV',
                      fontSize: 12,
                      color: const Color(0xff3D3D3D),
                    ),
                    const Gap(10),
                    InputField(
                      controller: TextEditingController(),
                      placeholder: 'Enter CVV',
                      fieldColor: Colors.transparent,
                      validationColor: const Color(0xffDFE2E5),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Gap(43),
          BusyButton(
            title: 'Proceed to Payment',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RouteName.orderPickedPage,
              );
            },
          )
        ],
      ),
    );
  }
}
