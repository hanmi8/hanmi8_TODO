part of 'values.dart';

class Styles {
  static TextStyle customTextStyle ({
    Color color = AppColors.blackShade,
    FontWeight fontWeight = FontWeight.w300,
    double fontSize = Sizes.TEXT_SIZE_18,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize, color: color,
      fontWeight: fontWeight, fontStyle: fontStyle,
    );
  }
}
