import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  double low = -25;
  double high = 10;
  String type = "C";
  int radioVal = -1;

  changeTemp(double lval, double hval) {
    low = lval;
    high = hval;

    notifyListeners();
  }

  changeType( int val,String tempType,) {
    type = tempType;
    radioVal = val;
    notifyListeners();
  }
}
