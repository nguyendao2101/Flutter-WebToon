// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled/themes/app_theme.dart';
import 'package:untitled/themes/theme_controller.dart';

import '../../images/image_extension.dart';
import 'login_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  final controller = Get.find<LoginController>();
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final themeData = themeController.themeData;
    return Scaffold(
      backgroundColor: themeData.value.color.lightBackground,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      themeController.changeTheme();
                    },
                    child: Text(
                      "Change Theme",
                      style: themeData.value.text.h14,
                    ),
                  ),
                  const SizedBox(height: 64),
                  Icon(
                    Icons.lock,
                    size: 100,
                    color: themeData.value.color.boldBackground,
                  ),
                  const SizedBox(height: 64),
                  Text(
                    'Welcom back you\'ve been missed!',
                    style: themeData.value.text.h16,
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: controller.formKeyLogin,
                    child: Column(
                      children: [
                        _formEmail(controller),
                        const SizedBox(height: 16),
                        _formPassword(controller),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot password?',
                                style: themeData.value.text.h12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // if (controller.formKeyLogin.currentState
                                  //         ?.validate() ==
                                  //     true) {
                                  //   controller.onlogin();
                                  // }
                                  controller.onlogin();
                                },
                                child: const Text(
                                  'Sign In',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.goToRegister();
                                },
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _textOrContinueWith(themeData),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssest.logoGoogle,
                        height: 72,
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        ImageAssest.logoApple,
                        height: 72,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => (controller.isLoading.value)
                ? Container(
                    color: Colors.black.withOpacity(0.8),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Padding _textOrContinueWith(Rx<AppTheme> themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Or continue with',
              style: themeData.value.text.h13,
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Obx _formPassword(LoginController controller) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
          controller: controller.passwordController,
          obscureText: controller.isObscured.value,
          decoration: InputDecoration(
            labelText: 'Password',
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: 'Password',
            suffixIcon: GestureDetector(
              onTap: () {
                controller.toggleObscureText();
              },
              child: Icon(
                controller.isObscured.value
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
          onChanged: controller.onChangePassword,
          validator: controller.validatorPassword,
        ),
      ),
    );
  }

  Padding _formEmail(LoginController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller.emailController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Email',
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Email',
        ),
        onChanged: controller.onChangeUsername,
        validator: controller.validatorUsername,
      ),
    );
  }
}
