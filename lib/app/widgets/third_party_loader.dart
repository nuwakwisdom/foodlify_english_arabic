import 'package:flutter/material.dart';
import 'package:Foodlify/app/widgets/custom_circular_progress_indicator.dart';

class ThirdPartyLoader extends StatelessWidget {
  const ThirdPartyLoader({
    super.key,
    this.color,
    this.size,
    this.strokeWidth,
  });

  final Color? color;
  final double? size, strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 20,
      width: size ?? 20,
      child: CustomCircularProgressIndicator(
        color: color,
      ),
    );
  }
}
