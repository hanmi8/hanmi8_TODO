import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_todo/domain/memberProvider.dart';
import 'package:weather_todo/screens/home_screen.dart';
import 'package:weather_todo/screens/login_screen.dart';
import 'package:weather_todo/screens/signup_screen.dart';
import 'package:weather_todo/screens/splash_screen.dart';
import 'package:weather_todo/screens/todoList_screen.dart';
import 'package:weather_todo/screens/weather_screen.dart';


void main() {
  // runApp(const MyApp());
  runApp(ChangeNotifierProvider(
    create: (context) => MemberProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HAN'S TODO",
      theme: ThemeData(
        fontFamily: 'NotoSansCJK',
      ),
      initialRoute: "/intro",
      routes: {
        "/intro": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignUpScreen(),
        // "/home": (context) => HomePage(),
        "/todo": (context) => TodoListScreen(),
        "/home": (context) => HomePage(),
        "/weather": (context) => WeatherScreen(),
      },
      home: WeatherScreen(),
    );
  }
}


