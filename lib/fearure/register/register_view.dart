import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/router/router.dart';
import 'package:untitled/themes/theme_controller.dart';

import '../login/login_view.dart';
import 'register_controller.dart';

class Register extends StatelessWidget {
  const Register({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    final textEditingControllers = TextEditingControllers();

    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;
    return Obx(
      () => Scaffold(
        backgroundColor: themeData.value.color.lightBackground,
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     TextButton(
                    //       onPressed: () {
                    //         themeController.changeTheme();
                    //       },
                    //       child: Text(
                    //         "Change Theme",
                    //         style: themeData.value.text.h14,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 92, 73, 73)),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    // email
                    _formEmail(textEditingControllers, controller),

                    const SizedBox(
                      height: 16,
                    ),

                    //password
                    _formPassword(textEditingControllers, controller),

                    const SizedBox(
                      height: 16,
                    ),
                    //entry your password
                    _formEntryPassword(textEditingControllers, controller),

                    const SizedBox(
                      height: 16,
                    ),

                    // ho ten
                    _formHoTen(textEditingControllers, controller),
                    const SizedBox(
                      height: 16,
                    ),

                    // dia chi va gioi tinh
                    _formAdressAndSex(textEditingControllers, controller),
                    const SizedBox(
                      height: 32,
                    ),
                    //button signup
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState?.validate() ==
                            true) {
                          controller.signUp(
                            textEditingControllers.email.text,
                            textEditingControllers.passWord.text,
                            textEditingControllers.entryPassword.text,
                            textEditingControllers.hoTen.text,
                            textEditingControllers.addRess.text,
                            textEditingControllers.sex.text,
                            () {
                              // Navigator.pushAndRemoveUntil(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const MyHomePage(
                              //       title: '',
                              //     ),
                              //   ),
                              //   (Route<dynamic> route) => false,
                              // );
                              Get.offAllNamed(AppRouterName.login);
                            },
                          );
                        }
                      },
                      child: const Text('Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black)),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Get.to(MyHomePage(title: ''));
                    //   },
                    //   child: const Text('Sign Up2',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(color: Colors.black)),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _formAdressAndSex(TextEditingControllers textEditingControllers,
      RegisterController controller) {
    return Row(
      children: [
        //gioi tinh
        Expanded(
          child: TextFormField(
            controller: textEditingControllers.sex,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Sex',
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: 'Sex',
            ),
            onChanged: controller.onChangeCheckSex,
            validator: controller.validatorCheck,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // dia chi
        Expanded(
          child: TextFormField(
            controller: textEditingControllers.addRess,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Address',
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: 'Address',
            ),
            onChanged: controller.onChangeCheckAdress,
            validator: controller.validatorCheck,
          ),
        ),
      ],
    );
  }

  TextFormField _formHoTen(TextEditingControllers textEditingControllers,
      RegisterController controller) {
    return TextFormField(
      controller: textEditingControllers.hoTen,
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Full Name',
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Full Name',
      ),
      onChanged: controller.onChangeCheckName,
      validator: controller.validatorCheck,
    );
  }

  Obx _formEntryPassword(TextEditingControllers textEditingControllers,
      RegisterController controller) {
    return Obx(
      () => TextFormField(
        controller: textEditingControllers.entryPassword,
        obscureText: controller.isEntryPasswordObscured.value,
        decoration: InputDecoration(
          labelText: 'Entry your Password',
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Entry your Password',
          suffixIcon: GestureDetector(
            onTap: () {
              controller.toggleEntryPasswordObscureText();
            },
            child: Icon(controller.isEntryPasswordObscured.value
                ? Icons.visibility_off
                : Icons.visibility),
          ),
        ),
        onChanged: controller.onChangeConfirmPassword,
        validator: controller.validatorConfirmPassword,
      ),
    );
  }

  Obx _formPassword(TextEditingControllers textEditingControllers,
      RegisterController controller) {
    return Obx(
      () => TextFormField(
        controller: textEditingControllers.passWord,
        obscureText: controller.isObscured
            .value, // Sử dụng giá trị từ controller để ẩn hoặc hiện mật khẩu
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
              controller
                  .toggleObscureText(); // Khi người dùng nhấn vào biểu tượng, toggleObscureText được gọi để thay đổi trạng thái ẩn/hiện mật khẩu
            },
            child: Icon(controller.isObscured.value
                ? Icons.visibility_off
                : Icons.visibility),
          ),
        ),
        onChanged: controller.onChangePassword,
        validator: controller.validatorPassword,
      ),
    );
  }

  TextFormField _formEmail(TextEditingControllers textEditingControllers,
      RegisterController controller) {
    return TextFormField(
      controller: textEditingControllers.email,
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
        suffixIcon: const Icon(Icons.email),
      ),
      onChanged: controller.onChangeUsername,
      validator: controller.validatorUsername,
    );
  }
}

class TextEditingControllers {
  final TextEditingController email = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  final TextEditingController entryPassword = TextEditingController();
  final TextEditingController hoTen = TextEditingController();
  final TextEditingController addRess = TextEditingController();
  final TextEditingController sex = TextEditingController();
}
