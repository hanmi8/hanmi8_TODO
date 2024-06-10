import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:weather_todo/widgets/custom_text_form_field.dart';
import 'package:weather_todo/widgets/custom_button.dart';

import '../customDrawer.dart';
import '../domain/member.dart';
import '../domain/memberProvider.dart';
import '../utils/spaces.dart';
import '../utils/values.dart';

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Sizes.ELEVATION_1,
        backgroundColor: AppColors.blue,
        title: Text(
          '회원가입',
          style: TextStyle( color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // 뒤로 가기 화살표 색상 설정
        ),
      ),
      endDrawer: CustomDrawer(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_36),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100.0),
                  _buildIntroText(context),
                  SpaceH20(),
                  _buildForm(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroText(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ListBody(
      children: <Widget>[
        Text(
          StringConst.SIGN_UP,
          style: textTheme.headlineMedium?.copyWith(
            color: AppColors.blue,
            fontWeight: FontWeight.w900,
          ),
        ),
        SpaceH20(),
        Text(
          StringConst.SIGN_UP_MSG,
          style: textTheme.titleSmall?.copyWith(
            color: AppColors.blackShade,
            fontSize: Sizes.TEXT_SIZE_16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    final TextEditingController email_controller = TextEditingController();
    final TextEditingController nickname_controller = TextEditingController();
    final TextEditingController pw_controller = TextEditingController();
    final memberProvider = Provider.of<MemberProvider>(context);

    return Column(
      children: <Widget>[
        // nickname
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.text,
          hintText: StringConst.HINT_NAME,
          hintTextStyle: Styles.customTextStyle(color: AppColors.grey),
          textStyle: Styles.customTextStyle(color: AppColors.blue),
          prefixIcon: Icon(
            FeatherIcons.user,
            color: AppColors.blackShade,
            size: Sizes.ICON_SIZE_20
          ),
          controller: nickname_controller,
        ),
        SpaceH20(),
        // email
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.text,
          hintText: StringConst.HINT_EMAIL_ADDRESS,
          hintTextStyle: Styles.customTextStyle(color: AppColors.grey),
          textStyle: Styles.customTextStyle(color: AppColors.blue),
          prefixIcon: Icon(
              FeatherIcons.mail,
              color: AppColors.blackShade,
              size: Sizes.ICON_SIZE_22
          ),
          controller: email_controller,
        ),
        SpaceH20(),
        // password
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.text,
          hintText: StringConst.HINT_PASSWORD,
          hintTextStyle: Styles.customTextStyle(color: AppColors.grey),
          textStyle: Styles.customTextStyle(color: AppColors.blue),
          obscured: true,
          prefixIcon: Icon(
              FeatherIcons.key,
              color: AppColors.blackShade,
              size: Sizes.ICON_SIZE_22
          ),
          controller: pw_controller,
        ),
        SpaceH20(),
        CustomButton(
          title: StringConst.SIGN_UP,
          height:64,
          textStyle: textTheme.bodyLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600, fontSize: 20.0,
          ),
          onPressed: () {
            memberProvider.memberInsert(
              Member(
                nickname_controller.text,
                email_controller.text,
                pw_controller.text
              )
            );
            Navigator.pushNamed(context, "/login");
          },
        ),
        SpaceH20(),
        InkWell(
          onTap: () => Navigator.pushNamed(context, "/login"),
          child: Text(
            StringConst.ALREADY_HAVE_AN_ACCOUNT,
            style: textTheme.titleSmall?.copyWith(
              fontSize: Sizes.TEXT_SIZE_14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

}