import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fire_base/fire_base_auth.dart';
import 'package:untitled/router/router.dart';

class RegisterController extends GetxController {
  var _firAuth = FirAuth();

  late TextEditingController email = TextEditingController();
  late TextEditingController passWord = TextEditingController();
  late TextEditingController entryPassword = TextEditingController();
  late TextEditingController hoTen = TextEditingController();
  late TextEditingController addRess = TextEditingController();
  late TextEditingController sex = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void onChangeUsername(username) {
    formKey.currentState?.validate();
  }

  void onChangePassword(password) {
    formKey.currentState?.validate();
  }

  void onChangeConfirmPassword(confirmPassword) {
    formKey.currentState?.validate();
  }

  void onChangeCheckName(check) {
    formKey.currentState?.validate();
  }

  void onChangeCheckAdress(check) {
    formKey.currentState?.validate();
  }

  void onChangeCheckSex(check) {
    formKey.currentState?.validate();
  }

  bool containsSpecialCharacters(String text) {
    final allowedSpecialCharacters = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
    return allowedSpecialCharacters.hasMatch(text);
  }

  bool containsUppercaseLetter(String text) {
    return RegExp(r'[A-Z]').hasMatch(text);
  }

  bool containsLowercaseLetter(String text) {
    return RegExp(r'[a-z]').hasMatch(text);
  }

  bool containsDigit(String text) {
    return RegExp(r'\d').hasMatch(text);
  }

  String? validatorUsername(username) {
    if ((username ?? '').isEmpty) {
      return 'Username không được để trống';
    } else if ((username ?? '').length < 6) {
      return 'Username không được nhỏ hơn 6 ký tự';
    } else if (containsSpecialCharacters(username!)) {
      return 'Mật khẩu khong chứa ký tự đặc biệt';
    } else {
      return null;
    }
  }

  String? validatorPassword(password) {
    if ((password ?? '').isEmpty) {
      return 'Username không được để trống';
    } else if ((password ?? '').length < 6) {
      return 'Username không được nhỏ hơn 6 ký tự';
    } else if (password.contains(' ')) {
      return 'Password không được chứa khoảng trắng';
    } else if (!containsUppercaseLetter(password)) {
      return 'Password cần chứa ít nhất 1 ký tự viết hoa';
    } else if (!containsLowercaseLetter(password)) {
      return 'Password cần chứa ít nhất 1 ký tự viết thường';
    } else if (!containsDigit(password)) {
      return 'Password cần chứa ít nhất 1 chữ số';
    } else if (!containsSpecialCharacters(password)) {
      return 'Password cần chứa ít nhất 1 ký tự đặc biệt';
    } else {
      return null;
    }
  }

  String? validatorConfirmPassword(confirmPassword) {
    if (confirmPassword != passWord.text) {
      return 'Password nhập lại không khớp';
    } else {
      return null;
    }
  }

  String? validatorCheck(check) {
    if ((check ?? '').isEmpty) {
      return 'Không được để trống';
    } else {
      return null;
    }
  }

  void signUp(String userName, String passWord, String entryPassword,
      String hoTen, String addRess, String sex, Function onSuccess) {
    _firAuth.signUp(
        userName, passWord, entryPassword, hoTen, addRess, sex, onSuccess);
  }

  goToLogin() {
    Get.toNamed(AppRouterName.login);
  }
}
