import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/item_model.dart';

class HomeController extends ChangeNotifier {
  List data = [];
  var popupMenuItemIndex = 0;
  int index = 0;

  sortData(String orderBy) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('data')
        .orderBy(orderBy, descending: false)
        .get();

    data = querySnapshot.docs.map((e) => e.data()).toList();
    notifyListeners();
  }

  onMenuItemSelected(int value) {
    popupMenuItemIndex = value;

    if (value == Option.name.index) {
      index = 0;
      sortData('name');
    } else if (value == Option.age.index) {
      index = 1;
      sortData('age');
      notifyListeners();
    } else if (value == Option.city.index) {
      index = 2;
      sortData('city');
    } else {}
    notifyListeners();
  }
}
