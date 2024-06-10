import 'package:flutter/material.dart';
import 'package:weather_todo/utils/values.dart';
import 'package:weather_todo/widgets/custom_button.dart';
import 'package:weather_todo/widgets/logo.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 200),
            Logo("HAN'S TODO", 150, 150),
            SizedBox(height: 50),
            CustomButton(
              title: '시작하기',
              height: 56,
              textStyle: TextStyle( color: AppColors.white, fontWeight: FontWeight.w600),
              onPressed: () => Navigator.pushNamed(context, "/login"),
            ),
          ],
        ),
      ),
    );
  }

}


