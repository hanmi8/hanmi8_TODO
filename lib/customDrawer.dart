import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_todo/utils/values.dart';

import 'domain/memberProvider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memberProvider = Provider.of<MemberProvider>(context);
    return Drawer(
      child: ListView(padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppColors.blue),
            child: Center(
              child: Text(
                  "HAN'S TODO",
                  style: TextStyle(color: Colors.yellowAccent, fontWeight:FontWeight.w900, fontSize: 32)
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () => Navigator.pushNamed(context, "/home"),
          ),
          memberProvider.nowLoginedMember == null
            ? ListTile(
                title: const Text('로그인'),
                onTap: () => Navigator.pushNamed(context, "/login"),
              )
            : ListTile(
                title: const Text('로그아웃'),
                onTap: () {
                  memberProvider.logout();
                  Navigator.pushNamed(context, "/home");
                },
          ),
          ListTile(
            title: const Text('회원가입'),
            onTap: () => Navigator.pushNamed(context, "/signup"),
          ),
          ListTile(
            title: const Text('Todo List'),
            onTap: () {
              if(memberProvider.nowLoginedMember == null ){
                Navigator.pushNamed(context, "/login");
              } else {
                Navigator.pushNamed(context, "/todo");
              }
            },
          ),
          ListTile(
            title: const Text('날씨'),
            onTap: () => Navigator.pushNamed(context, "/weather"),
          ),
        ],
      ),
    );
  }
}