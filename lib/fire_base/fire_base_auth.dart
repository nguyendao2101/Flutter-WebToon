import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

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
      // print("err: " + err.toString());
      _onSignUpErr(err.code, err.onRegisterError);
    });
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      onSuccess();
    }).catchError((err) {
      // print("err: " + err.toString());
      onSignInError("Sign-In fail, please try again");
    });
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
