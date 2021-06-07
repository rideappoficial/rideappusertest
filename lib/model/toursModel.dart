import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// = Product (DC)
class TourModel extends ChangeNotifier{

  TourModel.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    title = document['title'] as String;
    description = document['description'] as String;
    images = List<String>.from(document.data['images'] as List<dynamic>);
    unitPrice = document['unitPrice'] as num;
  }

  String id;
  String title;
  String description;
  List<String> images;
  int unitPrice;

}