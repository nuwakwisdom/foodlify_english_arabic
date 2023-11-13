import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodlieTextBase extends StatelessWidget {
  const FoodlieTextBase(
    this.text, {
    this.style,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.visible,
    this.maxLines = 1,
    super.key,
  });
  final String? text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    assert(text != null, 'test can not be null');
    return Text(
      text ?? '',
      style: GoogleFonts.inter(
        fontSize: 15,
      ).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

class TextBody extends FoodlieTextBase {
  TextBody(
    String super.text, {
    super.key,
    TextStyle? style,
    Color? color,
    double? fontSize,
    super.textAlign,
    FontWeight fontWeight = FontWeight.w400,
    super.overflow,
    super.maxLines = 2,
    double? height,
  }) : super(
          style: GoogleFonts.inter(
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight,
            height: height,
            color: color,
          ).merge(style),
        );
}

class H1 extends FoodlieTextBase {
  H1(
    String super.text, {
    super.key,
    TextStyle? style,
    double? fontSize,
    FontWeight fontWeight = FontWeight.w900,
    super.textAlign,
    super.overflow,
    super.maxLines = 3,
  }) : super(
          style: GoogleFonts.inter(
            fontSize: fontSize ?? 30,
            fontWeight: fontWeight,
          ).merge(style),
        );
}

class TextBold extends FoodlieTextBase {
  TextBold(
    String super.text, {
    super.key,
    TextStyle? style,
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
    super.textAlign,
    super.overflow,
    super.maxLines = 2,
  }) : super(
          style: GoogleFonts.inter(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ).merge(style),
        );
}

class TextSemiBold extends FoodlieTextBase {
  TextSemiBold(
    String super.text, {
    super.key,
    TextStyle? style,
    double? fontSize,
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
    super.textAlign,
    super.overflow,
    super.maxLines = 2,
  }) : super(
          style: GoogleFonts.inter(
            fontSize: fontSize ?? 14,
            color: color,
            fontWeight: fontWeight,
          ).merge(style),
        );
}

class TextSmall extends FoodlieTextBase {
  TextSmall(
    String super.text, {
    double fontSize = 12,
    super.key,
    TextStyle? style,
    Color? color,
    super.textAlign,
    super.overflow,
    super.maxLines = 2,
    FontStyle? fontStyle,
    FontWeight fontWeight = FontWeight.w300,
  }) : super(
          style: GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          ).merge(style),
        );
}
