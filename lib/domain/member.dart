class Member {
  late String _nickname;
  late String _email;
  late String _password;

  Member(this._nickname, this._email, this._password);
  String get nickname => _nickname;
  String get email => _email;
  String get password => _password;

  @override
  String toString() {
    return 'Member{nickname: $nickname, email: $email, password: $password}';
  }
}