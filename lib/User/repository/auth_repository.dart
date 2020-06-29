import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_login_ui/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();

  Future<FirebaseUser> signUpFirebase(email, password) =>
      _firebaseAuthAPI.signUp(email, password);

  Future signInFirebaseWithEmail(email, password) =>
      _firebaseAuthAPI.signinWithEmailPassword(email, password);
}
