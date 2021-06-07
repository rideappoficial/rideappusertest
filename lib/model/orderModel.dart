import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rideusertesteapp/model/cart_manager.dart';
import 'package:rideusertesteapp/model/cart_tour.dart';

class OrderModel {
  OrderModel.fromCartManager(CartManager cartManager){
    items = List.from(cartManager.items);
    price = cartManager.toursPrice;
    userId = cartManager.user.id;
  }

  OrderModel.fromDocument(DocumentSnapshot doc){
    orderId = doc.documentID;
    items = (doc.data['items'] as List<dynamic>).map((e) {
      return CartTourModel.fromMap(e as Map<String, dynamic>);
    }).toList();
    price = doc.data['price'] as num;
    userId = doc['user'] as String;
    date = doc['date'] as Timestamp;
  }

  final Firestore firestore = Firestore.instance;
  DocumentReference get firestoreRef => firestore.collection('orders').document(orderId);

  Future<void> save() async {
    firestoreRef.setData({
      'items': items.map((e) => e.toOrderItemMap()).toList(),
      'price': price,
      'user': userId,
      //'status': status.index,
      //'date': Timestamp.now(),
    });
  }

  String orderId;
  List<CartTourModel> items;
  num price;
  String userId;
  Timestamp date;

  String get formattedId => '#${orderId.padLeft(6, '0')}';

  void cancel(){
    //
  }

  @override
  String toString() {
    return 'Order{firestore: $firestore, orderId: $orderId, items: $items, price: $price, userId: $userId, date: $date}';
  }
}