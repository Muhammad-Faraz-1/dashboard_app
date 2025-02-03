import 'package:flutter/material.dart';
import 'package:testapp/utils/theme.dart';

class Provider1 extends ChangeNotifier {
  get colorTheme => null;

  late ThemeMode themeMode_ = ThemeMode.system;
  late ColorScheme _darkScheme = ThemeDataStyle.dark.colorScheme;
  late ColorScheme _lightScheme = ThemeDataStyle.light.colorScheme;
  ThemeMode get themeMode => themeMode_;
  void setThemeMode(ThemeMode value) {
    themeMode_ = value;
    notifyListeners();
  }

  ColorScheme get darkScheme => _darkScheme;
  void setDarkScheme(ColorScheme value) {
    _darkScheme = value;
    notifyListeners();
  }

  ColorScheme get lightScheme => _lightScheme;
  void setLightScheme(ColorScheme value) {
    _lightScheme = value;
    notifyListeners();
  }

  /////////////////////

  filterposition() {}

  String? selected = 'line';
  changechart(String select) {
    selected = select;
    notifyListeners();
  }

//////// all orders page
  int activefilter = 1;
  double left = 37;
  changeorderfilter(int active) {
    activefilter = active;
    activefilter == 1
        ? left = 37
        : activefilter == 2
            ? left = 143
            : left = 249;
    notifyListeners();
  }

  ////////////// order details page
  int filter = 1;
  double pos = 20;
  changepos(int active) {
    filter = active;
    filter == 1
        ? pos = 20
        : filter == 2
            ? pos = 105
            : filter == 3
                ? pos = 190
                : pos = 275;
    notifyListeners();
  }
int currentpage=1;
double navpos=20;
changepage(int activepage){
  currentpage=activepage;
  currentpage == 1
        ? navpos = 20
        : currentpage == 2
            ? navpos = 105
            : currentpage == 3
                ? navpos = 190
                : navpos = 275;
  notifyListeners();
}

////////////
 int cattype = 0;
 changecattype(int type){
  cattype=type;
  notifyListeners();
 }
goback(){
  cattype=cattype-1;
  print('hello world');
  notifyListeners();
}
// navbar_animation(){}
}
