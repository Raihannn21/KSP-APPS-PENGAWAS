import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class CustomInputOutline extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? hintText;
  final TextInputType? inputType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool autoValid;
  final Widget? preffixWidget;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final bool isReadOnly;
  const CustomInputOutline({
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
    this.isReadOnly = false,
    this.titleStyle,
  }) : super(key: key);

  @override
  State<CustomInputOutline> createState() => _CustomInputOutlineState();
}

class _CustomInputOutlineState extends State<CustomInputOutline> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: widget.titleStyle ??
              blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
        ),
        const SizedBox(height: 10),
        TextFormField(
          readOnly: widget.isReadOnly,
          maxLines: widget.maxLines ?? 1,
          controller: widget.controller,
          // ignore: prefer_if_null_operators
          keyboardType: widget.inputType ?? TextInputType.text,
          autovalidateMode:
              widget.autoValid ? AutovalidateMode.onUserInteraction : null,
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            hintText: widget.hintText == null ? "" : widget.hintText!,
            hintStyle:
                primaryTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: greyColor.withOpacity(0.5), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: greyColor.withOpacity(0.5), width: 1),
            ),
            prefix: widget.preffixWidget,
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
