import 'package:flutter/material.dart';
import 'package:Foodlify/core/constant/constant.dart';

class OrderReceipt extends StatefulWidget {
  const OrderReceipt({super.key});

  @override
  State<OrderReceipt> createState() => _OrderReceiptState();
}

class _OrderReceiptState extends State<OrderReceipt> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
    );
  }
}
