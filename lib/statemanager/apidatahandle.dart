import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testapp/model/categoriesapi.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/model/ordersapi.dart';
import 'package:testapp/model/productsapi.dart';

class apiDataHandeling extends ChangeNotifier {
  ////////
  String urlBaseZelle = 'https://fm.zellehost.com';
  String urlBaseSky = 'https://fm.skyhub.pk';
  String api_products =
      '/api/v1/products/by-category?categorySlug=sectionals&per_page=10&page=1';
  String api_categories = '/api/v1/productCategory/get?parent=0';
  String api_orders = '/api/v1/orders/get?';

  /// is loading logic
  bool isloading = false;
  loader(bool state) {
    isloading = state;
    print(isloading);
    notifyListeners();
  }
//////////////////////////////////////////////////////
  /// Categories api data is handeled here

  List<dynamic>? categories;
  bool isfetched = false;
  Future<Post?> fetchcategories(BuildContext context) async {
    // Provider1 provider1 = Provider.of<Provider1>(context, listen: false);
    // if (categories!.isEmpty){}
    if (isfetched == true) {
      print('fetched categories');
      // provider1.changepage(3);
      return null;
    } else {
      print('fetching categories');
      loader(true);
      // isloading=true;
      final uri = Uri.parse('${urlBaseZelle}${api_categories}');
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
  // bool isfetchedsubcat = false;
  int? parentuid;
  setparent(int? id, BuildContext context) {
    parentuid = id;
    loader(true);
    // print(parentuid);
    fetchsubcategories(context);
    print(subcategories);
    Future.delayed(Duration(seconds: 1));

    // print('navigation done');
    notifyListeners();
  }

  Future<Post?> fetchsubcategories(BuildContext context) async {
    print('fetching subcategories');
    // loader(true);
    final uri = Uri.parse(
        '${urlBaseZelle}/api/v1/productCategory/get?parent=${parentuid}');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(jsonDecode(response.body)['categories']);
      subcategories = jsonDecode(response.body)['categories'];
      print(subcategories!.length);
      loader(false);
      notifyListeners();
    }
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
    notifyListeners();
  }

  List<dynamic>? pendingOrders;
  Future<Order?> getorderlist() async {
    if (isfetchdeatils == true) {
      print('fetched order details');
      return null;
    } else {
      print('fetching orders');
      loader(true);
      final uri = Uri.parse('${urlBaseSky}${api_orders}');
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

    final url = Uri.parse('${urlBaseSky}/api/v1/orders/get_by_id?_id=$orderId');
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

  /////////////////////////////////////////
  ///product list work is here
  String sub_cat_slug = '';
  List<dynamic>? productlist;
  int page = 1;
  setslug(String slug) {
    sub_cat_slug = slug;
    fetchProducts();
    print(sub_cat_slug);
    notifyListeners();
  }

  List<Product> _products = [];
  String _errorMessage = '';

  List<Product> get products => _products;
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    final url = Uri.parse(
        '${urlBaseZelle}/api/v1/products/by-category?categorySlug=${sub_cat_slug}&per_page=10&page=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      _products = (data['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
    }
    notifyListeners();
  }

  ///////////////////////////////
  ///get single product
  Product? selectedproduct;
  String? defaultcolor;
  String? defaultpackage;
  setproductid(Product id) {
    selectedproduct = id;
    defaultcolor = selectedproduct!.defaultAttributes[0].type == 'color'
        ? selectedproduct!.defaultAttributes[0].options[0].name
        : selectedproduct!.defaultAttributes[1].options[0].name;
    defaultpackage = selectedproduct!.defaultAttributes[0].type == 'select'
        ? selectedproduct!.defaultAttributes[0].options[0].name
        : selectedproduct!.defaultAttributes[1].options[0].name;
    print(defaultcolor);
    print(defaultpackage);

    notifyListeners();
  }

  //////////////////// default attribute change function
  changepackage(String name) {
    defaultpackage = name;
    notifyListeners();
  }

  changecolor(String name) {
    defaultcolor = name;
    notifyListeners();
  }
}
