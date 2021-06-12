import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/orderModel.dart';
import 'package:rideusertesteapp/model/user.dart';

class AdminOrdersManager extends ChangeNotifier {
  final List<OrderModel> _orders = [];
  UserModel userFilter;
  List<Status> statusFilter = [Status.preparing];

  final Firestore firestore = Firestore.instance;

  StreamSubscription _subscription;

  void updateAdmin({bool adminEnabled}) {
    _orders.clear();
    _subscription?.cancel();
    if (adminEnabled) {
      _listenToOrders();
    }
  }

  List<OrderModel> get filteredOrders {
    List<OrderModel> output = _orders.reversed.toList();
    if(userFilter != null){
      output = output.where((o) => o.userId == userFilter.id).toList();
    }
    return output = output.where((o) => statusFilter.contains(o.status)).toList();
  }

  void _listenToOrders() {
    _subscription = firestore.collection('orders').snapshots().listen((event) {
      for (final change in event.documentChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            _orders.add(OrderModel.fromDocument(change.document));
            break;
          case DocumentChangeType.modified:
            final modOrder = _orders
                .firstWhere((o) => o.orderId == change.document.documentID);
            modOrder.updateFromDocument(change.document);
            break;
          case DocumentChangeType.removed:
            debugPrint('Deu problema serio');
            break;
        }
      }
      notifyListeners();
    });
  }

  void setUserFilter(UserModel user){
    userFilter = user;
    print(userFilter);
    notifyListeners();
  }

  void setStatusFilter({Status status, bool enabled}){
    if(enabled){
      statusFilter.add(status);
    } else {
      statusFilter.remove(status);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
