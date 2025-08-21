// ignore_for_file: prefer_if_elements_to_conditional_expressions, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/currency_text_input_formater_utils.dart';

class CustomInputText extends StatefulWidget {
  final String? title;
  final String? hintText;
  final TextInputType? inputType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool autoValid;
  final Widget? preffixWidget;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final Color? backgorundColor;
  final bool? isReadOnly;
  final TextStyle? hintStyle;
  final bool isCurrency;
  const CustomInputText({
    Key? key,
    required this.title,
    required this.controller,
    this.inputType,
    this.hintText,
    this.validator,
    this.onChanged,
    this.autoValid = false,
    this.preffixWidget,
    this.maxLines,
    this.contentPadding,
    this.borderRadius,
    this.backgorundColor,
    this.isReadOnly,
    this.hintStyle,
    this.isCurrency = false,
  }) : super(key: key);

  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Text(
                widget.title!,
                style: greyTextStyle.copyWith(
                    fontSize: 12.sp, fontWeight: regular),
              )
            : const SizedBox(),
        SizedBox(height: widget.title != null ? 8 : 0),
        TextFormField(
          maxLines: widget.maxLines ?? 1,
          controller: widget.controller,
          readOnly: widget.isReadOnly == true ? true : false,
          inputFormatters: widget.isCurrency
              ? [
                  CurrencyTextInputFormatter(
                    locale: 'id_ID',
                    decimalDigits: 0,
                    symbol: '',
                  )
                ]
              : [],
          // ignore: prefer_if_null_operators
          keyboardType: widget.inputType ?? TextInputType.text,
          autovalidateMode:
              widget.autoValid ? AutovalidateMode.onUserInteraction : null,
          validator: widget.validator,
          onChanged: widget.onChanged,
          style: blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: regular),
          decoration: InputDecoration(
            fillColor: widget.backgorundColor ?? greyColor.withOpacity(0.1),
            filled: true,
            contentPadding: widget.contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
            hintText: widget.hintText == null ? "" : widget.hintText!,
            hintStyle: widget.hintStyle ??
                greyTextStyle.copyWith(fontSize: 16.sp, fontWeight: regular),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: greyColor.withOpacity(0.1), width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: greyColor.withOpacity(0.1), width: 0),
            ),
            prefixIcon: widget.isCurrency
                ? IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Rp",
                            style: blackTextStyle.copyWith(
                                fontSize: 16.sp, fontWeight: regular),
                          ),
                          Container(
                            height: 20,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: VerticalDivider(
                              color: blue2Color,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : widget.preffixWidget,
            errorStyle: TextStyle(
              fontSize: 10.sp,
            ),
            errorMaxLines: 4,
          ),
        )
      ],
    );
  }
}
