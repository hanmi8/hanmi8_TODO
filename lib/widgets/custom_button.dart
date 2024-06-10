import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/spaces.dart';
import '../utils/values.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double height;
  final double elevation;
  final double borderRadius;
  final String? title;
  final Color color;
  final BorderSide borderSide;
  final TextStyle? textStyle;
  final Widget? icon;
  final bool hasIcon;

  CustomButton({
    this.title,
    this.onPressed,
    this.height = Sizes.HEIGHT_50,
    this.elevation = Sizes.ELEVATION_1,
    this.borderRadius = Sizes.RADIUS_24,
    this.color = AppColors.blue,
    this.borderSide = Borders.defaultPrimaryBorder,
    this.textStyle,
    this.icon,
    this.hasIcon = false,
  }) : assert((hasIcon == true && icon != null) || (hasIcon == false && icon == null));

  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius), side: borderSide,
      ),
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hasIcon ? icon! : Container(), hasIcon ? SpaceW8() : Container(),
          title != null ? Text( title!, style: textStyle) : Container()
        ],
      ),
    );
  }
}