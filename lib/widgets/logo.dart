import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final String title;
  final double width;
  final double height;

  const Logo([this.title='', this.width=140, this.height=140]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "images/fc-logo1.svg",
          height: height, width: width
        ),
        SizedBox(height: 20),
        Text(
          title, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        )
      ],
    );
  }


}