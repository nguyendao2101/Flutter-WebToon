import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/themes/theme_controller.dart';
import '../../images/image_extension.dart';
import 'login_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    //  final controller = Get.put(LoginController());
    final controller = Get.find<LoginController>();

    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;
    return Obx(
      () => Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text(title),
        // ),
        // backgroundColor: Colors.grey[300],
        backgroundColor: themeData.value.color.lightBackground,
        body: Stack(
          children: [
            SafeArea(
              child: Form(
                key: controller.formKey,
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
                          )),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        // child: Image.asset(ImageAssest.techMasterCard),
                      ),
                      // logo
                      const SizedBox(
                        height: 50,
                      ),
                      Icon(
                        Icons.lock,
                        size: 100,
                        color: themeData.value.color.boldBackground,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // welcom back, you've been missed!
                      Text(
                        'Welcom back you\'ve been missed!',
                        //   style:
                        //       TextStyle(color: Color(0xFF616161), fontSize: 16),
                        style: themeData.value.text.h16,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // user name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: controller.email,
                          obscureText: false,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Email',
                          ),
                          onChanged: controller.onChangeUsername,
                          validator: controller.validatorUsername,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //password
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
                            controller: controller.password,
                            obscureText: controller.isObscured.value,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.toggleObscureText();
                                },
                                child: Icon(controller.isObscured.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            onChanged: controller.onChangePassword,
                            validator: controller.validatorPassword,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //forgot password?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot password?',
                              // style: TextStyle(color: Color(0xFF757575)),
                              style: themeData.value.text.h12,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      // button login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.goToBottonNav();
                              },
                              child: const Text(
                                'Sign In',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          //Button Register
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.goToRegister();
                              },
                              child: const Text(
                                'Register',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                // style: TextStyle(color: Color(0xFF616161)),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // google + apple logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // google
                          Image.asset(
                            ImageAssest.logoGoogle,
                            height: 72,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
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
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
