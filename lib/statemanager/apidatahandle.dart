import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testapp/model/categoriesapi.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/model/ordersapi.dart';

class apiDataHandeling extends ChangeNotifier {
  ////////
  String urlBase = 'https://fm.zellehost.com';

  /// is loading logic

  bool isloading = false;
  loader(bool state) {
    isloading = state;
    notifyListeners();
  }

  /// Categories api data is handeled here

  List<dynamic>? categories;
  bool isfetched = false;
  Future<Post?> fetchcategories() async {
    // if (categories!.isEmpty){}
    if (isfetched == true) {
      print('fetched categories');
      return null;
    } else {
      loader(true);
      // isloading=true;
      final uri = Uri.parse('${urlBase}/api/v1/productCategory/get?parent=0');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print(jsonDecode(response.body)['categories']);
        categories = jsonDecode(response.body)['categories'];
        isfetched = true;
        loader(false);

        // getcategoriesdata(data);
      }
      notifyListeners();
      return Post();
    }
  }

///////////////////////////////////////////////////////
  //  SubCategories work is here
  List<dynamic>? subcategories;
  bool isfetchedsubcat = false;
  int? parentuid = 1;
  setparent(int? id) {
    parentuid = id;
    print(parentuid);
    notifyListeners();
  }

  Future<Post?> fetchsubcategories() async {
    if (isfetchedsubcat == true) {
      print('fetched sub categories');
      return null;
    } else {
      loader(true);
      final uri = Uri.parse(
          '${urlBase}/api/v1/productCategory/get?parent=${parentuid}');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        print(jsonDecode(response.body)['categories']);
        subcategories = jsonDecode(response.body)['categories'];
        isfetchedsubcat = true;
      }
      loader(false);
    }
    notifyListeners();
    return Post();
  }
////////////////////////////////////////////////
  //  order list work is here

  List<dynamic>? orderlist;
  double? sales;
  bool isfetchdeatils = false;
  //////////////////////////////
  ///orders filter is here
  String orderfilter = 'all';
  currentorders(String val) {
    orderfilter = val.toLowerCase();
    print(orderfilter);
   
    
    // pendingOrders = orderlist?.where((order) => order['status'] == orderfilter).toList() ?? [];
    // if (pendingOrders!.isNotEmpty){
    //   for (var i = 0; i < pendingOrders!.length; i++) {
    //   print('list of pending orders  ${pendingOrders![i]}');
    // }
    // }
    // else{
    //   print('it is empty');
    // }
    notifyListeners();
  }

  List<dynamic>? pendingOrders;
  Future<Order?> getorderlist() async {
    if (isfetchdeatils == true) {
      print('fetched order details');
      return null;
    } else {
      loader(true);
      final uri = Uri.parse('https://fm.skyhub.pk/api/v1/orders/get?');
      // final uri= Uri.parse('https://fm.skyhub.pk/api/v1/orders/get_by_id?_id=67b2c5904f75453ebd5c3228');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        orderlist = jsonDecode(response.body)['orders'];
        sales =
            orderlist!.fold(0, (sum, order) => sum! + (order['total'] as num));
      }
      isfetchdeatils = true;
      loader(false);
    }
    notifyListeners();

    return Order();
  }

////////////////////////////////////////////////////////
  // order details work is here
  Order? _selectedOrder; // Stores the selected order details
  Order? get selectedOrder => _selectedOrder;
  cleardetails() {
    _selectedOrder = null;
    notifyListeners();
  }

  // Fetch full order details only when an order is clicked
  Future<void> fetchOrderDetails(String orderId) async {
    cleardetails(); // Clear previous details
    print("Fetching details for Order ID: $orderId");

    loader(true); // Start loading indicator

    final url =
        Uri.parse('https://fm.skyhub.pk/api/v1/orders/get_by_id?_id=$orderId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      // Ensure "order" key exists and is not null
      if (data.containsKey("order") && data["order"] != null) {
        _selectedOrder =
            Order.fromMap(data["order"]); // Pass directly to fromMap()
      } else {
        print("No order found in response.");
        _selectedOrder = null;
      }
    }
    loader(false); // Stop loading

    notifyListeners(); // Notify UI about the update
  }
}
