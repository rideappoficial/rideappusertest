import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/section.dart';

class HomeManager extends ChangeNotifier {
  final Firestore firestore = Firestore.instance;

  HomeManager() {
    _loadSections();
  }

  final List<Section> _sections = [];
  List<Section> _editingSections = [];
  bool editing = false;
  bool loading = false;

  void _loadSections() async {
    //firestore.collection('home').orderBy('pos').snapshots().listen((snapshot) {
      firestore.collection('home').snapshots().listen((snapshot) {
      _sections.clear();
      for (final DocumentSnapshot document in snapshot.documents) {
        _sections.add(Section.fromDocument(document));
      }
      //print('sections: $_sections');
      notifyListeners();
    });
  }

  void addSection(Section section) {
    _editingSections.add(section);
    notifyListeners();
  }

  void removeSection(Section section) {
    _editingSections.remove(section);
    notifyListeners();
  }

  List<Section> get sections {
    if (editing) {
      return _editingSections;
    } else {
      return _sections;
    }
  }

  void enterEditting() {
    editing = true;
    _editingSections = _sections.map((s) => s.clone()).toList();
    notifyListeners();
  }

  Future<void> saveEditing() async {
    bool valid = true;
    for(final section in _editingSections){
      if(!section.valid()) valid = false;
    }
    if(!valid) return;

    loading = true;
    notifyListeners();

    int pos = 0;
    for(final section in _editingSections){
      await section.save(pos);
      pos++;
    }

    for(final section in List.from(_sections)){
      if(!_editingSections.any((element) => element.id == section.id)){
        await section.delete();
      }
    }

    loading = false;
    editing = false;
    notifyListeners();
  }

  void descartEditing() {
    editing = false;
    notifyListeners();
  }
}
