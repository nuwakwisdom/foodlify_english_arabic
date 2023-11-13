import 'package:flutter/material.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class BusyButton extends StatefulWidget {
  const BusyButton({
    super.key,
    required this.title,
    this.active = true,
    required this.onTap,
    this.busy = false,
  });
  final String title;
  final bool active;
  final VoidCallback? onTap;
  final bool busy;
  @override
  State<BusyButton> createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 58,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: widget.active
              ? FoodlifyLinearColors.primayLinear
              : LinearGradient(
                  colors: [
                    const Color(0xffFD654D).withOpacity(0.5),
                    const Color(0xffF38B2A).withOpacity(0.5)
                  ],
                ),
          borderRadius: BorderRadius.circular(100),
          color: widget.active
              ? FoodlieColors.foodliePink
              : FoodlieColors.foodliePink.withOpacity(0.5),
        ),
        child: Center(
          child: widget.busy
              ? const CircularProgressIndicator(
                  color: FoodlieColors.foodlieWhite,
                )
              : TextBold(
                  widget.title,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: FoodlieColors.foodlieWhite,
                ),
        ),
      ),
    );
  }
}
