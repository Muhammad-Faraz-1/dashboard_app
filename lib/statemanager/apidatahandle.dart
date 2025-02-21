import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testapp/model/categoriesapi.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/model/ordersapi.dart';

class apiDataHandeling extends ChangeNotifier {
  ////////
  String urlBase = 'https://fm.zellehost.com';

  /// Categories api data is handeled here

  List<dynamic>? categories;
  bool isfetched = false;
  Future<Post?> fetchcategories() async {
    // if (categories!.isEmpty){}
    if (isfetched == true) {
      return null;
    } else {
      final uri = Uri.parse('${urlBase}/api/v1/productCategory/get?parent=0');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print(jsonDecode(response.body)['categories']);
        categories = jsonDecode(response.body)['categories'];
        isfetched = true;
        // getcategoriesdata(data);
      }
      notifyListeners();
      return Post();
    }
  }
///////////////////////////////////////////////////////
  //  SubCategories work is here
  List<dynamic>? subcategories;
  // bool isfetched = false;
  int? parentuid=1;
  setparent(int? id){
    parentuid=id;
    print(parentuid);
    notifyListeners();
  }
  Future<Post?> fetchsubcategories() async {
    final uri = Uri.parse('${urlBase}/api/v1/productCategory/get?parent=${parentuid}');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print(jsonDecode(response.body)['categories']);
        subcategories = jsonDecode(response.body)['categories'];
        print(subcategories);
      }
      notifyListeners();
      return Post();
  }
   
   List<dynamic>? orderdetails;
    Future<Order>? getorderdetails()async{
      final uri= Uri.parse('https://fm.skyhub.pk/api/v1/orders/get?limit=10');
      final response=await http.get(uri);
      if (response.statusCode==200){
        orderdetails = jsonDecode(response.body)['orders'];
        //  print("Name: ${orderdetails}");
  //       // print("ID: ${category.id}");
  //       // print("UID: ${category.uid}");
  //       // print("Slug: ${category.slug}");
  //       // print("Display: ${category.display}");
  //       // print("Parent: ${category.parent}");
  //       // print("Menu Order: ${category.menuOrder}");
        // print(orderdetails);
      }
      notifyListeners();
      return Order();
      
    }






















































///////////////////////////////////////////////////////
  // getcategoriesdata(List<dynamic>? cat) {
  //   // categories = cat;
  //   print('got them');
  //   ////////////////////////////////
  //   if (categories != null) {
  //     for (var item in categories!) {
  //       // Convert each item to ProductCategory model
  //       Post category = Post.fromJson(item);
  //       // Print each field separately
  //       print("Name: ${category.name}");
  //       // print("ID: ${category.id}");
  //       // print("UID: ${category.uid}");
  //       // print("Slug: ${category.slug}");
  //       // print("Display: ${category.display}");
  //       // print("Parent: ${category.parent}");
  //       // print("Menu Order: ${category.menuOrder}");
  //       // print("Banner Image: ${category.bannerImage}");
  //       print("Image: ${category.image}");
  //       // print("Permalink: ${category.permalink}");
  //       // print("Parent Name: ${category.parentName ?? 'N/A'}");  // Handle nullable field
  //       // print("Description: ${category.description}");
  //       // print("Created At: ${category.createdAt}");
  //       // print("Updated At: ${category.updatedAt}");
  //       print("------------------------------");
  //     }
  //   } else {
  //     print("No categories available.");
  //   }
  //   // names = categories?.map((category) => category['name'].toString()).toList();
  //   // print(names);

  //   notifyListeners();
  // }
}
