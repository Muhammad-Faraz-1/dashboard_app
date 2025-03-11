import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/model/productsapi.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/statemanager/provider1.dart';
// import 'package:testapp/statemanager/provider1.dart';
// import 'package:testapp/utils/shimmer.dart';
import 'package:testapp/utils/textwidgets.dart';
// import 'package:testapp/widgets/categories/Categorybox.dart';

// class Productbody extends StatelessWidget {
//   const Productbody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final apicat = Provider.of<apiDataHandeling>(context);
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
//       color: Colors.transparent,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Sectionheading(subtitle: 'Products'),
//           SizedBox(
//             height: 5.w,
//           ),
//           SizedBox(
//             height: 500.h,
//             child: ListView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               itemCount: apicat.products.length,
//               itemBuilder: (context, index) {
//                 final product = apicat.products[index];

//                 return Productbox(
//                   name: product.name,
//                   old_price: product.regularPrice.toString(),
//                   new_price: product.salePrice,
//                   parent: product.categories[0].name,
//                   img: product.images[0].imageUrl,
//                   stock: product.manageStock.stockStatus,id: product,
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
class Productbody extends StatelessWidget {
  const Productbody({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);

    return Container(
      width: double.infinity,
      height: 500.h,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.w),
          Expanded( // Fix: Wrapping ListView in Expanded
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 100) {
                  apicat.fetchProducts(); // Load more products when near bottom
                }
                return false;
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5),
                itemCount: apicat.products.length + (apicat.hasMore ? 1 : 0), // Loader at bottom
                itemBuilder: (context, index) {
                  if (index == apicat.products.length) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final product = apicat.products[index];

                  return Productbox(
                    name: product.name,
                    old_price: product.regularPrice.toString(),
                    new_price: product.salePrice,
                    parent: product.categories[0].name,
                    img: product.images[0].imageUrl,
                    stock: product.manageStock.stockStatus,
                    id: product,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Productbox extends StatelessWidget {
  final String name;
  final String old_price;
  final String new_price;
  final String parent;
  final String stock;
  final String img;
  final Product id;

  Productbox({
    super.key,
    required this.name,
    required this.new_price,
    required this.old_price,
    required this.parent,
    required this.img,
    required this.stock,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final apicat = Provider.of<apiDataHandeling>(context);
    final provider = Provider.of<Provider1>(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: GestureDetector(
        onTap: () {
        provider.changecattype(2);
        apicat.setproductid(id);
        },
        child: Container(
          height: 50.h,
          width: double.infinity,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.onTertiary, width: 1),
            gradient: LinearGradient(colors: [
              theme.primary.withOpacity(0.6),
              theme.primary.withOpacity(0.3),
              theme.primary.withOpacity(0.6),
            ]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image container
                  Container(
                    height: 50.h,
                    width: 60.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Image.network(
                      '${apicat.urlBaseZelle}${img}',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 210.w,
                        child: Text(
                          name,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: theme.primary,
                              fontSize: 12.sp,
                              height: 1.25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Contentsmall(
                        subtitle: parent,
                        weight: FontWeight.w500,
                        colors: theme.primary,
                        height: 1,
                      ),
                      Container(
                        height: 12.h,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            stock,
                            style: GoogleFonts.poppins(
                                fontSize: 7.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   '\$${ old_price}',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.white,
                            fontSize: 8.sp,
                            height: 1.25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                  Text(
                    '\$${ new_price}',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12.sp,
                            height: 1.25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
