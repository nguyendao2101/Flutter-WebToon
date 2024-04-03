import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/themes/theme_controller.dart';

import '../login/login_view.dart';
import 'register_controller.dart';

class Register extends StatelessWidget {
  const Register({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();

    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;
    return Obx(
      () => Scaffold(
        backgroundColor: themeData.value.color.lightBackground,
        body: SafeArea(
          child: Form(
            // key: controller.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              themeController.changeTheme();
                            },
                            child: Text(
                              "Change Theme",
                              style: themeData.value.text.h14,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    // user name
                    TextFormField(
                      controller: controller.email,
                      obscureText: false,
                      decoration: InputDecoration(
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

                    const SizedBox(
                      height: 20,
                    ),

                    //password
                    TextFormField(
                      controller: controller.passWord,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Password',
                      ),
                      onChanged: controller.onChangePassword,
                      validator: controller.validatorPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // entry your password
                    TextFormField(
                      controller: controller.entryPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Entry your Password',
                      ),
                      onChanged: controller.onChangeConfirmPassword,
                      validator: controller.validatorConfirmPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // ho ten
                    TextFormField(
                      controller: controller.hoTen,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Họ tên',
                      ),
                      onChanged: controller.onChangeCheckName,
                      // validator: controller.validatorCheck,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // dia chi
                    TextFormField(
                      controller: controller.addRess,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Địa chỉ',
                      ),
                      onChanged: controller.onChangeCheckAdress,
                      // validator: controller.validatorCheck,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // gioi tinh
                    TextFormField(
                      controller: controller.sex,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Giới tính',
                      ),
                      onChanged: controller.onChangeCheckSex,
                      validator: controller.validatorCheck,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        // controller.signUp(
                        //     controller.userName.text,
                        //     controller.passWord.text,
                        //     controller.entryPassword.text,
                        //     controller.hoTen.text,
                        //     controller.addRess.text,
                        //     controller.sex.text, () {
                        //   Get.toNamed(AppRouterName.login);
                        //   ;
                        // });

                        controller.signUp(
                            "nguyendao2101@gmail.com",
                            "nguyendao21",
                            "nguyendao21",
                            "nguyen hoang",
                            "ha noi",
                            "nam", () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                      title: '',
                                    )),
                            (Route<dynamic> route) =>
                                false, // Xóa tất cả các màn hình đã xếp chồng
                          );
                          ;
                        });
                      },
                      child: const Text('Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
