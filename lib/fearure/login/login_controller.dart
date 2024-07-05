import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fire_base/fire_base_auth.dart';
import '../../home/home_gruments.dart';
import '../../router/router.dart';

class LoginController extends GetxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController user3 = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool isObscured = true.obs;

  final showPassword = false.obs;
  final isLoading = false.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }

  void showHidePassword() {
    showPassword.value = !showPassword.value;
  }

  void onChangeUsername(email) {
    formKey.currentState?.validate();
  }

  void onChangePassword(password) {
    formKey.currentState?.validate();
  }

  bool containsSpecialCharacters(String text) {
    final allowedSpecialCharacters = RegExp(r'[!#\$%^&*(),?":{}|<>]');
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

  String? validatorUsername(email) {
    if ((email ?? '').isEmpty) {
      return 'Email không được để trống';
    } else if ((email ?? '').length < 6) {
      return 'Email không được nhỏ hơn 6 ký tự';
    } else if (containsSpecialCharacters(email!)) {
      return 'Email không đúng định dạng';
    } else {
      return null;
    }
  }

  String? validatorPassword(password) {
    if ((password ?? '').isEmpty) {
      return 'Password không được để trống';
    } else if ((password ?? '').length < 6) {
      return 'Password không được nhỏ hơn 6 ký tự';
    } else {
      return null;
    }
  }

  onlogin() {
    FirAuth.signInWithEmailAndPassword(
        emailController.text, passwordController.text);
  }

  goToRegister() {
    return Get.toNamed(AppRouterName.register);
  }

  goToBottonNav() {
    return Get.toNamed(AppRouterName.bottomnav);
  }

  onSubmitLogin() async {
    return Get.toNamed(AppRouterName.home,
        arguments: HomeAgrument(
            username: emailController.text, password: passwordController.text));
  }

  // ignore: unused_element
  Future<dynamic> _showErrorLoginDialog() {
    return Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Đã có lỗi xảy ra, vui lòng nhập lại',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Đóng'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
