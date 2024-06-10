import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:weather_todo/utils/values.dart";

class CustomTextFormField extends StatelessWidget {

  final bool hasPrefixIcon;
  final TextInputType? textInputType;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final bool obscured;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  CustomTextFormField({
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.hasPrefixIcon = false,
    this.obscured = false,
    this.textInputType,
    this.prefixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: TextFormField(
            style: textStyle,
            keyboardType: textInputType,
            decoration: InputDecoration(
              border: Borders.primaryInputBorder,
              enabledBorder: Borders.enabledBorder,
              focusedBorder: Borders.focusdBorder,
              prefixIcon: hasPrefixIcon ? prefixIcon : null,
              hintText: hintText,
              hintStyle: hintTextStyle,
            ),
            obscureText: obscured,
          ),
        ),
      ],
    );
  }

}

