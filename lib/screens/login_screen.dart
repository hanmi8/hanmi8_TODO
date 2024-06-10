import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_todo/widgets/custom_text_form_field.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weather_todo/customDrawer.dart';


import '../domain/member.dart';
import '../domain/memberProvider.dart';
import '../utils/spaces.dart';
import '../utils/values.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() { super.initState(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Sizes.ELEVATION_1,
        backgroundColor: AppColors.blue,
        title: Text(
          '로그인',
          style: TextStyle( color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // 뒤로 가기 화살표 색상 설정
        ),
      ),
      endDrawer: CustomDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_36),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            _buildIntroText(context),
            SpaceH8(),
            _buildForm(context),
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
            StringConst.HELLO,
            style: textTheme.headlineMedium?.copyWith(color: AppColors.blue)
        ),
        SpaceH4(),
        Text(
            StringConst.WELCOME,
            style: textTheme.headlineMedium?.copyWith(color: AppColors.blue)
        ),
        SpaceH4(),
        Text(
            StringConst.SIGN_IN_MSG,
            style: textTheme.headlineMedium?.copyWith(color: AppColors.blue)
        ),
        SpaceH80(),
        Text(
            StringConst.SIGN_IN,
            style: textTheme.headlineMedium?.copyWith(color: AppColors.blue)
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var iconTheme = Theme.of(context).iconTheme;

    final TextEditingController nickname_controller = TextEditingController();
    final TextEditingController email_controller = TextEditingController();
    final TextEditingController pw_controller = TextEditingController();

    final memberProvider = Provider.of<MemberProvider>(context);

    return Column(
      children: <Widget>[
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.emailAddress,
          hintText: StringConst.HINT_EMAIL_ADDRESS,
          hintTextStyle: Styles.customTextStyle(color: AppColors.grey),
          textStyle: Styles.customTextStyle(color: AppColors.blue),
          prefixIcon: Icon(
            FeatherIcons.mail, color: iconTheme.color, size: Sizes.ICON_SIZE_20,
          ),
          controller: email_controller,
        ),
        SpaceH20(),
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.text,
          hintText: StringConst.HINT_PASSWORD,
          hintTextStyle: Styles.customTextStyle(color: AppColors.grey),
          textStyle: Styles.customTextStyle(color: AppColors.blue),
          obscured: true,
          prefixIcon: Icon(
            FeatherIcons.key, color: iconTheme.color, size: Sizes.ICON_SIZE_20,
          ),
          controller: pw_controller,
        ),
        SpaceH20(),
        CustomButton(
          title: StringConst.SIGN_IN,
          textStyle: textTheme.bodyLarge?.copyWith(
            color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 20.0
          ),
          height: 64,
          // onPressed: () => Navigator.pushNamed(context, "/todo"),
          // onPressed: () {
          //   memberProvider.memberInsert(
          //     Member(
          //       nickname_controller.text,
          //       email_controller.text,
          //       pw_controller.text,
          //     ),
          //   );
          //   Navigator.pushNamed(context, "/login");
          onPressed: () {
            if (memberProvider.login(email_controller.text, pw_controller.text)) {
              Navigator.pushNamed(context, "/todo");
            } else {
              confirmDialog(context);
            }
          },
        ),
        SpaceH20(),
        InkWell(
          onTap: () => Navigator.pushNamed(context, "/signup"),
          child: Text(
            StringConst.DONT_HAVE_AN_ACCOUNT,
            textAlign: TextAlign.center,
            style: textTheme.titleSmall?.copyWith(
              fontSize: Sizes.TEXT_SIZE_14,
              color: AppColors.blackShade, fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
  void confirmDialog(context) {
    showDialog(context: context, builder: (context) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpaceH20(),
            const Text("ALERT", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18.0)),
            SpaceH20(),
            const Text("아이디 또는 비밀번호를 확인하세요."),
            SpaceH20(),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            SpaceH8(),
          ],
        ),
      );
    });
  }

}