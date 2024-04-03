import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String passWord, String entryPassword,
      String hoTen, String addRess, String sex, Function onSuccess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: passWord)
        .then((user) {
      //
      _createUser(user.user!.uid, hoTen, addRess, sex, onSuccess);
      print(user);
    }).catchError((err) {
      //TODO
    });
  }

  _createUser(String userId, String hoTen, String addRess, String sex,
      Function onSuccess) {
    var user = {'HoTen': hoTen, 'AddRess': addRess, 'Sex': sex};
    var ref = FirebaseDatabase.instance.reference().child('users');
    ref.child(userId).set(user).then((user) {
      //success
      onSuccess();
    }).catchError((err) {
      // todo
    });
  }
}
