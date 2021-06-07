import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:rideusertesteapp/model/toursModel.dart';

class CartTourModel extends ChangeNotifier {
  CartTourModel.fromTour(this.tour){
   tourId = tour.id;
   quantity = 1;
  }

  CartTourModel.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    tourId = document.data['tid'] as String;
    quantity = document.data['quantity'] as int;

    firestore.document('tours/$tourId').get().then(
            (doc) {
              tour = TourModel.fromDocument(doc);
              notifyListeners();
            }
    );

  }

  CartTourModel.fromMap(Map<String, dynamic> map){
    tourId = map['tid'] as String;
    quantity = map['quantity'] as int;
    fixedPrice = map['fixedPrice'] as num;

    firestore.document('tours/$tourId').get().then(
            (doc) {
          tour = TourModel.fromDocument(doc);
          notifyListeners();
        }
    );

  }

  final Firestore firestore = Firestore.instance;

  String id;
  String tourId;
  int quantity;

  num fixedPrice;

  TourModel tour;

    num get unitPrice {
      if(tour == null) return 0;
      return tour.unitPrice;
    }

    num get totalPrice => unitPrice * quantity;

    Map<String, dynamic> toCartItemMap(){
      return {
        'tid': tourId,
        'quantity': quantity,
      };
    }

  Map<String, dynamic> toOrderItemMap(){
    return {
      'tid': tourId,
      'quantity': quantity,
      'fixedPrice': fixedPrice ?? unitPrice,
    };
  }

    bool stackable(TourModel tourModel){
      return tourModel.id == tourId;
    }

    void increment(){
      quantity++;
      notifyListeners();
    }

    void decrement(){
      quantity--;
      notifyListeners();
    }

    /*
    bool get hasStock {
      final size = itemSize;
      if(size == null) return false;
      return size.stock >= quantity;
    }
    */

}