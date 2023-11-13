// ignore_for_file: inference_failure_on_function_return_type, avoid_multiple_declarations_per_line, lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.controller,
    required this.placeholder,
    this.label,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = true,
    this.suffix,
    this.onTap,
    this.prefix,
    this.validationColor = const Color(0xffF5F5F5),
    this.prefixSizedBoxWidth = 20,
    this.fieldColor = const Color(0xffF5F5F5),
    this.fieldHeight = 53,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String? validationMessage;
  final Function? enterPressed;
  final bool smallVersion;
  final FocusNode? fieldFocusNode;
  final Function? onTap;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final String? label;
  final double prefixSizedBoxWidth;
  final Function(String)? onChanged;
  final Color fieldColor;
  final int? maxLines, maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final Color validationColor;
  final double fieldHeight;

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool? isPassword;
  double fieldHeight = 52;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: widget.fieldHeight,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.fieldColor,
            border: Border.all(
              color: widget.validationColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Row(
              children: <Widget>[
                widget.prefix ?? const SizedBox(),
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    keyboardType: widget.textInputType,
                    focusNode: widget.fieldFocusNode,
                    textInputAction: widget.textInputAction,
                    onChanged: widget.onChanged,
                    maxLines: widget.maxLines,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: FoodlieColors.grey,
                      fontWeight: FontWeight.w400,
                    ),

                    onEditingComplete: () {
                      if (widget.enterPressed != null) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        // ignore: avoid_dynamic_calls
                        widget.enterPressed!();
                      }
                    },
                    // onFieldSub  mitted: (value) {
                    //   if (widget.nextFocusNode != null) {
                    //     widget.nextFocusNode.requestFocus();
                    //   }
                    // },
                    obscureText: isPassword!,
                    readOnly: widget.isReadOnly,
                    // decoration:
                    // InputDecoration.collapsed(hintText: widget.placeholder),
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(top: 10),
                      hintText: widget.placeholder,
                      border: InputBorder.none,

                      hintStyle: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xff534F4F).withOpacity(0.45),
                        fontWeight: FontWeight.w400,
                      ),
                      // suffix:
                    ),
                  ),
                ),
                widget.suffix ??
                    GestureDetector(
                      onTap: () => setState(() {
                        isPassword = !isPassword!;
                      }),
                      child: widget.password
                          ? Container(
                              alignment: Alignment.center,
                              child: isPassword!
                                  ? SvgPicture.asset(AppAssets.visibleIcon)
                                  : SvgPicture.asset(AppAssets.eyeIcon),
                            )
                          : Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                            ),
                    ),
              ],
            ),
          ),
        ),
        if (widget.validationMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: TextBody(
              widget.validationMessage!,
              color: Colors.red,
              fontSize: 10,
            ),
          )
        else
          const SizedBox(),
        if (widget.additionalNote != null) const Gap(5) else const SizedBox(),
        if (widget.additionalNote != null)
          TextBody(widget.additionalNote!)
        else
          const SizedBox(),
      ],
    );
  }
}
