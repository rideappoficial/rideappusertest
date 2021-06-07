import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:rideusertesteapp/model/cart_tour.dart';
import 'package:rideusertesteapp/model/toursModel.dart';
import 'package:rideusertesteapp/model/user.dart';
import 'package:rideusertesteapp/model/userManager.dart';
//import 'package:rideruserapp/models/cart_tour.dart';
//import 'package:rideruserapp/models/tours_model.dart';
//import 'package:rideruserapp/models/user.dart';
//import 'package:rideruserapp/models/user_manager.dart';

class CartManager extends ChangeNotifier{

  List<CartTourModel> items = [];

  UserModel user;
  num toursPrice = 0.0;

  void updateUser(UserManager userManager){
    user = userManager.user;
    items.clear();

    if(user != null){
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async {
    final QuerySnapshot cartSnap = await user.cartReference.getDocuments();
    items = cartSnap.documents.map(
            (d) => CartTourModel.fromDocument(d)..addListener(_onItemUpdate)
    ).toList();
  }

  void addToCart(TourModel tourModel){
    try {
      final e = items.firstWhere((t) => t.stackable(tourModel));
      e.increment();
    } catch(e){
      final cartTourModel = CartTourModel.fromTour(tourModel);
      cartTourModel.addListener(_onItemUpdate);
      items.add(cartTourModel);
      user.cartReference.add(cartTourModel.toCartItemMap())
          .then((doc) => cartTourModel.id = doc.documentID);
      _onItemUpdate();
    }
    notifyListeners();
  }

  void _onItemUpdate(){
    toursPrice = 0.0;
    for(int i = 0; i < items.length; i++){
      final cartTourModel = items[i];
      if(cartTourModel.quantity == 0){
        removeOfCart(cartTourModel);
        i--;
        continue;
      }
      toursPrice += cartTourModel.totalPrice;
      _updateCartTour(cartTourModel);
    }
    notifyListeners();
  }

  void removeOfCart(CartTourModel cartTourModel){
    items.removeWhere((t) => t.id == cartTourModel.id);
    user.cartReference.document(cartTourModel.id).delete();
    cartTourModel.removeListener((_onItemUpdate));
    notifyListeners();
  }

  void clear(){
    for(final cartTour in items){
      user.cartReference.document(cartTour.id).delete();
    }
    items.clear();
    notifyListeners();
  }

  void _updateCartTour(CartTourModel cartTourModel){
    if(cartTourModel.id != null){
      user.cartReference.document(cartTourModel.id)
          .updateData(cartTourModel.toCartItemMap());
    }
  }

  /*
  // Para questão relacionada a estoque ...
  bool get isCartValid {
    for(final cartTourModel in items){
      if(!cartTourModel.hasStock) return false;
    }
    return true;
  }
  */

}


