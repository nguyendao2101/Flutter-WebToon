import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fire_base/fire_base_auth.dart';

class RegisterController extends GetxController {
  final _firAuth = FirAuth();

  final formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? confirmPassword;
  String? hoTen;
  String? address;
  String? sex;

  RxBool isObscured = true.obs;
  final showPassword = false.obs;
  final isLoading = false.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }

  void showHidePassword() {
    showPassword.value = !showPassword.value;
  }

  RxBool isEntryPasswordObscured = true.obs;
  void toggleEntryPasswordObscureText() {
    isEntryPasswordObscured.value = !isEntryPasswordObscured.value;
  }

  void onChangeUsername(String valueEmail) {
    email = valueEmail;
    formKey.currentState?.validate();
  }

  void onChangePassword(String valuePassword) {
    password = valuePassword;
    formKey.currentState?.validate();
  }

  void onChangeConfirmPassword(String valueconfirmPassword) {
    confirmPassword = valueconfirmPassword;
    formKey.currentState?.validate();
  }

  void onChangeCheckName(String valuehoTen) {
    hoTen = valuehoTen;
    formKey.currentState?.validate();
  }

  void onChangeCheckAdress(String valueaddress) {
    address = valueaddress;
    formKey.currentState?.validate();
  }

  void onChangeCheckSex(String valuesex) {
    sex = valuesex;
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

  String? validatorUsername(String? email) {
    if ((email ?? '').isEmpty) {
      return 'Email không được để trống';
    } else if ((email ?? '').length < 6) {
      return 'Email không được nhỏ hơn 6 ký tự';
    } else if (!containsSpecialCharacters(email!)) {
      return 'Email cần chứa ký tự đặc biệt';
    } else {
      return null;
    }
  }

  String? validatorPassword(String? value) {
    if ((value ?? '').isEmpty) {
      return 'Password không được để trống';
    } else if ((value ?? '').length < 6) {
      return 'Password không được nhỏ hơn 6 ký tự';
    } else if (value!.contains(' ')) {
      return 'Password không được chứa khoảng trắng';
    } else if (!containsUppercaseLetter(value)) {
      return 'Password cần chứa ít nhất 1 ký tự viết hoa';
    } else if (!containsLowercaseLetter(value)) {
      return 'Password cần chứa ít nhất 1 ký tự viết thường';
    } else if (!containsDigit(value)) {
      return 'Password cần chứa ít nhất 1 chữ số';
    } else if (!containsSpecialCharacters(value)) {
      return 'Password cần chứa ít nhất 1 ký tự đặc biệt';
    } else {
      return null;
    }
  }

  String? validatorConfirmPassword(String? value) {
    if (value != password) {
      return 'Password nhập lại không khớp';
    } else {
      return null;
    }
  }

  String? validatorCheck(String? value) {
    if ((value ?? '').isEmpty) {
      return 'Không được để trống';
    } else {
      return null;
    }
  }

  void signUp(String email, String passWord, String entryPassword, String hoTen,
      String addRess, String sex, Function onSuccess) {
    _firAuth.signUp(
        email, passWord, entryPassword, hoTen, addRess, sex, onSuccess);
  }
}
