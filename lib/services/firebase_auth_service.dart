import 'package:firebase_auth/firebase_auth.dart';
import 'package:inspector/common/toast.dart';

class FireBaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (error) {
      if (error.toString() == 'user-not-found' ||
          error.toString() == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else {
        showToast(message: 'Failed to login: ${error.toString()}');
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (error) {
      if (error.toString() == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else {
        showToast(message: 'Failed to login: ${error.toString()}');
      }
    }
    return null;
  }
}
