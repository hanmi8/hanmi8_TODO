import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import 'member.dart';

Logger log = Logger();

class MemberProvider with ChangeNotifier {
  Map<String, Member> _members = {}; // 회원가입 정보 저장
  Member? _nowLoginedMember; // 현재 로그인 회원 정보

  Member? get nowLoginedMember => _nowLoginedMember;

  // 신규 회원 가입
  void memberInsert(Member NewMember) {
    _members[NewMember.email] = NewMember;
    log.i('전체회원정보 >>>>>>>> ' + _members.toString());
  }

  bool login(String email, String pw) {
    if(_members.containsKey(email) && _members[email]?.password == pw) {
      _nowLoginedMember = _members[email];
    }
    log.i("로그인 결과 >>>>>>> " + _nowLoginedMember.toString());

    return _nowLoginedMember != null;
  }

  void logout() {
    _nowLoginedMember = null;
    log.i("로그아웃 결과 >>>>>>> " + _nowLoginedMember.toString());
  }
}