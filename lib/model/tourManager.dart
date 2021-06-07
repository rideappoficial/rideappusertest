import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/toursModel.dart';

class TourManager extends ChangeNotifier{

  TourManager(){
    _loadAllTours();
  }

  final Firestore firestore = Firestore.instance;

  List<TourModel> allTours = [];
  //List<TourModel> filteredTours = [];
  String _search = '';

  String get search => _search;
  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<TourModel> get filteredTours {
    final List<TourModel> filteredTours = [];
    if(search.isEmpty) {
      filteredTours.addAll(allTours);
    } else {
      filteredTours.addAll(
          allTours.where(
                  (p) => p.title.toLowerCase().contains(search.toLowerCase()))
      );
    }
    return filteredTours;
  }

  Future<void> _loadAllTours() async {
    final QuerySnapshot snapTours = await firestore.collection('tours').getDocuments();

    allTours = snapTours.documents.map(
            (d) => TourModel.fromDocument(d)).toList();
    notifyListeners();

  }

  TourModel findProductById(String id){
    try {
      return allTours.firstWhere((t) => t.id == id);
    } catch (e){
      return null;
    }
  }

}