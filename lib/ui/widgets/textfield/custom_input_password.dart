import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';

class CustomInputPassword extends StatefulWidget {
  final String title;
  final String? hintText;
  final TextInputType? inputType;
  final TextEditingController controller;
  final bool passwordMode;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool autoValid;
  final Widget? preffixWidget;
  final int? maxLines;

  const CustomInputPassword(
      {Key? key,
      required this.title,
      required this.controller,
      this.inputType,
      this.hintText,
      this.validator,
      this.onChanged,
      this.autoValid = false,
      this.passwordMode = false,
      this.preffixWidget,
      this.maxLines})
      : super(key: key);

  @override
  State<CustomInputPassword> createState() => _CustomInputPasswordState();
}

class _CustomInputPasswordState extends State<CustomInputPassword> {
  bool _passwordInVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: blackTextStyle.copyWith(fontSize: 12.sp, fontWeight: regular),
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: widget.maxLines ?? 1,
          controller: widget.controller,
          // ignore: prefer_if_null_operators
          keyboardType: widget.inputType ?? TextInputType.text,
          autovalidateMode:
              widget.autoValid ? AutovalidateMode.onUserInteraction : null,
          obscureText: widget.passwordMode ? _passwordInVisible : false,
          validator: widget.validator,
          onChanged: widget.onChanged,
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: regular),
          decoration: InputDecoration(
            fillColor: greyColor.withOpacity(0.1),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            hintText: widget.hintText == null ? "" : widget.hintText!,
            hintStyle:
                greyTextStyle.copyWith(fontSize: 16.sp, fontWeight: regular),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: greyColor.withOpacity(0.1), width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: greyColor.withOpacity(0.1), width: 0),
            ),
            prefix: widget.preffixWidget ?? const SizedBox(),
            suffixIcon: widget.passwordMode
                ? IconButton(
                    icon: Icon(
                      _passwordInVisible
                          ? Icons.visibility_off
                          : Icons
                              .visibility, //change icon based on boolean value
                      color: green1Color,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordInVisible =
                            !_passwordInVisible; //change boolean value
                      });
                    },
                  )
                : const SizedBox(),
            errorStyle: const TextStyle(
              fontSize: 10.0,
            ),
            errorMaxLines: 4,
          ),
        )
      ],
    );
  }
}
