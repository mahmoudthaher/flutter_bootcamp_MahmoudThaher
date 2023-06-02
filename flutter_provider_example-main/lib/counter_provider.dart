import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  //المسؤوول عن اي تعديل
  int counter = 0;

  updateCounter() {
    counter++;
    notifyListeners();
    //same SetState and Emit
  }
  //get Counter => counter;   اذا كانت private
}
