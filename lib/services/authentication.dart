import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<User> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<void> changeEmail(String email);

  Future<void> changePassword(String password);

  Future<void> deleteUser();

  Future<void> sendPasswordResetMail(String email);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'Wrong password provided for that user.';
      }
    }
    return 'Error al conectar a la base de datos';
  }

  Future<String> signUp(String email, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
    return 'Error al conectar a la base de datos';
  }

  Future<User> getCurrentUser() async {
    User user = _firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    User user = _firebaseAuth.currentUser;
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<bool> isEmailVerified() async {
    User user = _firebaseAuth.currentUser;
    return user.emailVerified;
  }

  @override
  Future<void> changeEmail(String email) async {
    User user = _firebaseAuth.currentUser;
    user.updateEmail(email).then((_) {
      print("Succesfull changed email");
    }).catchError((error) {
      print("email can't be changed" + error.toString());
    });
    return null;
  }

  @override
  Future<void> changePassword(String password) async {
    User user = _firebaseAuth.currentUser;
    user.updatePassword(password).then((_) {
      print("Succesfull changed password");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
    });
    return null;
  }

  @override
  Future<void> deleteUser() async {
    User user = _firebaseAuth.currentUser;
    user.delete().then((_) {
      print("Succesfull user deleted");
    }).catchError((error) {
      print("user can't be delete" + error.toString());
    });
    return null;
  }

  @override
  Future<void> sendPasswordResetMail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return null;
  }
}
