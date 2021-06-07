import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../helpers/firebase_errors.dart';
import './user.dart';

class UserManager extends ChangeNotifier{
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;

  UserModel user;

  bool _loading = false;
  bool get loading => _loading;

  bool get isLoggedIn => user != null;

  Future<void> signIn({Function onFail, Function onSucess, UserModel user}) async {
    loading = true;
    try{
      final AuthResult result = await auth.signInWithEmailAndPassword(email: user.email, password: user.password);
      await Future.delayed(Duration(seconds: 4));
      //print(result.user.uid);
      await _loadCurrentUser(firebaseUser: result.user);
      onSucess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }


  Future<void> signup({UserModel user, Function onFail, Function onSucess}) async {
    loading = true;
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      user.id = result.user.uid;
      this.user = user;
      await user.saveData();
      onSucess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  void signout() {
    auth.signOut();
    user = null;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) async {
    final FirebaseUser currentUser = firebaseUser ?? await auth.currentUser();
    if(currentUser != null){
      final DocumentSnapshot docUser = await firestore.collection('users').document(currentUser.uid).get();
      user = UserModel.fromDocument(docUser);
      //print(user.name);
      notifyListeners();
    }

  }

  /*
  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) async {
    final FirebaseUser currentUser = firebaseUser ?? await auth.currentUser();
    if (currentUser != null) {
      //final DocumentSnapshot docUser = await firestore.collection('users')
      final DocumentSnapshot docUser = await firestore
          .collection(FirebasePath.userCollection)
          .document(currentUser.uid)
          .get();
      user = User.fromDocument(docUser);

      final docAdmin =
          await firestore.collection('admins').document(user.id).get();
      if (docAdmin.exists) {
        user.admin = true;
      }
      notifyListeners();
    }
  }
  */

  bool get adminEnabled => user != null;
  //bool get adminEnabled => user != null && user.admin;
}
