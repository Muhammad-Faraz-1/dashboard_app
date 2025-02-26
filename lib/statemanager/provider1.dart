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
  ///dashbaord page chart change method

  filterposition() {}
  String? selected = 'line';
  changechart(String select) {
    selected = select;
    notifyListeners();
  }

//////// all orders page top navigation for filters
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

  ////////////// order details page top navigation for filters
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

  // naviagtion bar changes pages from this method
  int currentpage = 1;
  double navpos = 20;
  changepage(int activepage)async {
    chck = 0;
    // Future.delayed(Duration(seconds: 2));
    if (drawerval == false){
    currentpage = activepage;
    // notifyListeners();
    }
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
  ///categories page flow is controlled here
  int cattype = 0;
  changecattype(int type) {
    cattype = type;
    notifyListeners();
  }

////////////
  ///backbutton logic so that it does not route to main page directly
  goback() {
    cattype = cattype - 1;
    print('hello world');
    notifyListeners();
  }
// navbar_animation(){}

  bool obs = true;
  obstate() {
    obs = !obs;
    print(obs);
    notifyListeners();
  }

  ////////////
  // drawer animation
  bool drawerval = false;
  changeval() {
    drawerval = !drawerval;
    print(drawerval);
    notifyListeners();
  }

////////////////first visit check
  int chck = 0;
  chckval(int val) {
    chck = val;
    notifyListeners();
  }

  ///////////////////
  ///size selection styling
  int selected_size = 1;
  change_size(int val) {
    selected_size = val;
    notifyListeners();
  }

  //////////////////////////////
  /// package selection styling
  int selected_package = 1;
  change_package(int val) {
    selected_package = val;
    notifyListeners();
  }

  ////////////////////////////
  /// color selection style
  int selected_color = 1;
  change_color(int val) {
    selected_color = val;
    notifyListeners();
  }

  ////////////
  // dropdown
  String selectedMonth = 'January';

  // String get selectedMonth => _selectedMonth;

  void updateMonth(String newMonth) {
    selectedMonth = newMonth;
    notifyListeners(); // Notify UI to rebuild
  }

  //////////////////////////
  ///order status pop radio btn
  int state = 1;
  changestatus(int val) {
    state = val;
    notifyListeners();
  }

  //////////////////////////////
  ///review status btn
  String reviewstatus = 'Approved';
  changereview(String val) {
    reviewstatus = val;
    notifyListeners();
  }
 

}
