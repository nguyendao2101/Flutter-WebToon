import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/router/router.dart';

//1
class FirAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String passWord, String entryPassword, String hoTen,
      String addRess, String sex, Function onSuccess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: passWord)
        .then((user) {
      //
      _createUser(user.user!.uid, hoTen, addRess, sex, onSuccess);
    }).catchError((err) {
      if (err is FirebaseAuthException) {
        if (err.code == 'week-password') {
          Get.dialog(AlertDialog(
            title: const Text('Error'),
            content: const Text('Mat khau qua don gian'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'),
              )
            ],
          ));
        } else if (err.code == 'email-already-in-use') {
          Get.dialog(AlertDialog(
            title: const Text('Error'),
            content: const Text('Email nay da ton tai'),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('OK'))
            ],
          ));
        }
      }
      // print("err: " + err.toString());
      _onSignUpErr(err.code, err.onRegisterError);
    });
  }

  static Future<void> signInWithEmailAndPassword(
      String email, String passWord) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passWord);
      if (credential.user != null) {
        Get.toNamed(AppRouterName.bottomnav);
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        Get.dialog(AlertDialog(
          title: const Text('Error'),
          content: const Text('No user found for that email'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            )
          ],
        ));
      } else if (err.code == 'wrong-password') {
        Get.dialog(AlertDialog(
          title: const Text('Error'),
          content: const Text('Wrong password provided for that user'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'))
          ],
        ));
      } else {
        Get.dialog(AlertDialog(
          title: const Text('Erro'),
          content: Text(err.message ?? "Something went wrong..."),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'))
          ],
        ));
      }
    }
  }

  _createUser(String userId, String hoTen, String addRess, String sex,
      Function onSuccess) {
    var user = {'HoTen': hoTen, 'AddRess': addRess, 'Sex': sex};
    // ignore: deprecated_member_use
    var ref = FirebaseDatabase.instance.reference().child('users');
    ref.child(userId).set(user).then((user) {
      //success
      onSuccess();
    }).catchError((err) {
      // todo
    });
  }

  void _onSignUpErr(String code, Function(String) onRegisterError) {
    // print(code);
    switch (code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onRegisterError("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onRegisterError("Email has existed");
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError("The password is not strong enough");
        break;
      default:
        onRegisterError("SignUp fail, please try again");
        break;
    }
  }

  Future<void> signOut() async {
    // print("signOut");
    return _firebaseAuth.signOut();
  }
}
