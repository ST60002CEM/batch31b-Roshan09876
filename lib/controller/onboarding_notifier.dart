import 'package:flutter/material.dart';

class OnBoardNotifier extends ChangeNotifier {
  bool _isLastpage = false;

  bool get isLastPage => _isLastpage;

  //Accesing it through setter
  set isLastPage(bool newState) {
    _isLastpage = newState;
    notifyListeners();
  }
}
