import 'package:mobx/mobx.dart';

part 'user_signup.g.dart';

class UserCreadentialOb = _UserCreadentialOb with _$UserCreadentialOb;

abstract class _UserCreadentialOb with Store {
  @observable
  bool isPasswordRember = false;

  @observable
  bool isRemberLogin = false;

  @action
  void changeUserLoginInfo(bool chekedValue) => isRemberLogin = chekedValue;

  @action
  void changeRember(bool checked_value) => isPasswordRember = checked_value;
}

class UserCreadential {
  String user_email;
  String user_password;
  bool? is_remember_password = false;

  UserCreadential(
    this.user_email,
    this.user_password, {
    this.is_remember_password,
  });
}

class Validate {
  static validate(String value) {
    if (value.length < 8) {
      return 'password must be more than 8 character';
    } else if (value.length > 16) {
      return 'password must be  less than 16 character';
    } else if (value.isEmpty) {
      return 'Please enter password';
    }
  }
}
