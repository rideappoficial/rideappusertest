import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/orderModel.dart';
import 'package:rideusertesteapp/model/user.dart';

class OrdersManager extends ChangeNotifier{

  UserModel user;

  List<OrderModel> ordersModel = [];

  final Firestore firestore = Firestore.instance;

  StreamSubscription _subscription;

  void updateUser(UserModel user){
    this.user = user;
    ordersModel.clear();
    _subscription?.cancel();
    //print('User Id in OrderManager: ${user.id}');
    if(user != null){
      _listenToOrders();
    }
  }

  void _listenToOrders(){
    _subscription = firestore.collection('orders')
        .where('user', isEqualTo: user.id)
        .snapshots().listen((event) {
          ordersModel.clear();
          for(final doc in event.documents){
            ordersModel.add(OrderModel.fromDocument(doc));
          }
          notifyListeners();
        });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

}