import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rideusertesteapp/model/cart_manager.dart';
import 'package:rideusertesteapp/model/cart_tour.dart';

enum Status { canceled, preparing, transporting, delivered }

class OrderModel {
  OrderModel.fromCartManager(CartManager cartManager) {
    items = List.from(cartManager.items);
    price = cartManager.toursPrice;
    userId = cartManager.user.id;
    status = Status.preparing;
  }

  OrderModel.fromDocument(DocumentSnapshot doc) {
    orderId = doc.documentID;
    items = (doc.data['items'] as List<dynamic>).map((e) {
      return CartTourModel.fromMap(e as Map<String, dynamic>);
    }).toList();
    price = doc.data['price'] as num;
    userId = doc['user'] as String;
    date = doc['date'] as Timestamp;
    status = Status.values[doc.data['status'] as int];
  }

  final Firestore firestore = Firestore.instance;
  DocumentReference get firestoreRef =>
      firestore.collection('orders').document(orderId);

  void updateFromDocument(DocumentSnapshot doc){
    status = Status.values[doc.data['status'] as int];
  }

  Future<void> save() async {
    firestoreRef.setData({
      'items': items.map((e) => e.toOrderItemMap()).toList(),
      'price': price,
      'user': userId,
      'status': status.index,
      'date': Timestamp.now(),
    });
  }

  Function() get back {
    return status.index >= Status.transporting.index
        ? () {
            status = Status.values[status.index - 1];
            firestoreRef.updateData({'status': status.index});
          }
        : null;
  }

  Function() get advanced {
    return status.index <= Status.transporting.index
        ? () {
            status = Status.values[status.index + 1];
            firestoreRef.updateData({'status': status.index});
          }
        : null;
  }

  String orderId;
  List<CartTourModel> items;
  num price;
  String userId;
  Status status;
  Timestamp date;

  String get formattedId => '#${orderId.padLeft(6, '0')}';

  String get statusText => getStatusText(status);

  static String getStatusText(Status status) {
    switch (status) {
      case Status.canceled:
        return 'Cancelado';
      case Status.preparing:
        return 'Em preparação';
      case Status.transporting:
        return 'Em transporte';
      case Status.delivered:
        return 'Entregue';
      default:
        return '';
    }
  }

  void cancel() {
    status = Status.canceled;
    firestoreRef.updateData({'status': status.index});
  }

  @override
  String toString() {
    return 'Order{firestore: $firestore, orderId: $orderId, items: $items, price: $price, userId: $userId, date: $date}';
  }
}
