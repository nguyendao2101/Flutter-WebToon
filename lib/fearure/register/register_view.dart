import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_controller.dart';



class Register extends StatelessWidget {
  const Register({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
   final controller = Get.find<RegisterController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SafeArea(
          child:Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    // child: Image.asset(ImageAssest.techMasterCard),
                  ),

                  // user name
                  TextFormField(
                    controller: controller.user1,
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
                      hintText: 'Username',
                    ),
                    onChanged: controller.onChangeUsername,
                    validator: controller.validatorUsername,
                  ),

                  const SizedBox(height: 20,),


                  //password
                  TextFormField(
                    controller: controller.user2,
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
                    const SizedBox(height: 20,),


                  // entry your password
                  TextFormField(
                    controller: controller.user3,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: false,
                      hintText: 'Entry your Password',
                    ),
                    onChanged: controller.onChangeConfirmPassword,
                    validator: controller.validatorConfirmPassword,
                  ),
                  const SizedBox(height: 20,),


                  // ho ten
                    TextFormField(
                    controller: controller.user4,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: false,
                      hintText: 'Họ tên',
                    ),
                    onChanged: controller.onChangeCheckName,
                    validator: controller.validatorCheck,
                  ),
                  const SizedBox(height: 20,),

                  // dia chi
                  TextFormField(
                    controller: controller.user5,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: false,
                      hintText: 'địa chỉ',
                    ),
                    onChanged: controller.onChangeCheckAdress,
                    validator: controller.validatorCheck,
                  ),
                  const SizedBox(height: 20,),
                  

                  // gioi tinh
                  TextFormField(
                    controller: controller.user6,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: false,
                      hintText: 'Giới tính',
                    ),
                    onChanged: controller.onChangeCheckSex,
                    validator: controller.validatorCheck,
                  ),
                  const SizedBox(height: 20,),

                  ElevatedButton(onPressed: (){
                      Get.back();
                  }, child:const Text('ĐĂNG KÝ'),),

                ],

              ),
            ),
          ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}