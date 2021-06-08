import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/user.dart';
import 'package:rideusertesteapp/model/userManager.dart';

class AdminUsersManager extends ChangeNotifier {
  List<UserModel> users = [];
  Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(UserManager userManager) {
    _subscription?.cancel();
    if (userManager.adminEnabled) {
      _listenToUsers();
    } else {
      users.clear();
      notifyListeners();
    }
  }

  void _listenToUsers() async {
    _subscription = firestore.collection('users').snapshots().listen((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        users = snapshot.documents.map((d) => UserModel.fromDocument(d)).toList();
      }
      users.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      notifyListeners();
    });
  }

  List<String> get names => users.map((user) => user.name).toList();

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
