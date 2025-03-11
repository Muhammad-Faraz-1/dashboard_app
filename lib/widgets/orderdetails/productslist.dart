import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/model/ordersapi.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/utils/textwidgets.dart';

class ListofProducts extends StatelessWidget {
  const ListofProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;
    return Container(
  width: double.infinity,
  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
  color: Colors.transparent,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Sectionheading(subtitle: 'Order Details'),
      SizedBox(height: 5.w),
      // Use ConstrainedBox to provide bounded height constraints
      ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7, // Adjust as needed
        ),
        child: Container(
          width: 320.w,
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: LinearGradient(colors: [
              theme.primary.withOpacity(0.6),
              theme.primary.withOpacity(0.3),
              theme.primary.withOpacity(0.6),
            ]),
          ),
          child: apicat.ordersfetched == true
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Prevent Column from expanding
                    children: [
                      GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: apicat.selectedOrder?.items?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // 2 items per row
                          mainAxisSpacing: 10, // Space between rows
                          childAspectRatio: 4.1.sp, // Adjust height of boxes
                        ),
                        itemBuilder: (context, index) {
                          final product = apicat.selectedOrder!
                              .items![index]; // Fetch product details
                          return SingleProductDetails(product: product);
                        },
                      ),
                    ],
                  ),
                )
              : Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
    ],
  ),
);
    // final order = apicat.selectedOrder;
    // return Container(
    //     width: double.infinity,
    //     padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
    //     color: Colors.transparent,
    //     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //       Sectionheading(subtitle: 'Order Details'),
    //       SizedBox(
    //         height: 5.w,
    //       ),

    //       // Container(
    //       //     // height: 390.h,
    //       //     width: 320.w,
    //       //     padding: EdgeInsets.all(10.sp),
    //       //     decoration: BoxDecoration(
    //       //       borderRadius: BorderRadius.circular(10.r),
    //       //       gradient: LinearGradient(colors: [
    //       //         theme.primary.withOpacity(0.6),
    //       //         theme.primary.withOpacity(0.3),
    //       //         theme.primary.withOpacity(0.6),
    //       //       ]),
    //       //     ),
    //       //     //// product container starts here
    //       //     child: SingleChildScrollView(
    //       //       scrollDirection: Axis.vertical,
    //       //       child: SizedBox(
    //       //         height: 500.h,
    //       //         child: apicat.ordersfetched == true
    //       //             ? GridView.builder(
    //       //                 padding: EdgeInsets.symmetric(horizontal: 5),
    //       //                 scrollDirection: Axis.vertical,
    //       //                 itemCount: apicat.selectedOrder?.items?.length,
    //       //                 gridDelegate:
    //       //                     SliverGridDelegateWithFixedCrossAxisCount(
    //       //                   crossAxisCount: 1, // 2 items per row
    //       //                   mainAxisSpacing: 5, // Space between rows
    //       //                   childAspectRatio: 4.1.sp, // Adjust height of boxes
    //       //                 ),
    //       //                 itemBuilder: (context, index) {
    //       //                   final product = apicat.selectedOrder!
    //       //                       .items![index]; // Fetch product details

    //       //                   return SingleProductDetails(product: product);
    //       //                 },
    //       //               )
    //       //             : Center(
    //       //                 child: SizedBox(
    //       //                     height: 50,
    //       //                     width: 50,
    //       //                     child: CircularProgressIndicator()),
    //       //               ),
    //       //       ),
    //       //     ))
    //     ]));
  }
}

///////////////////////////////////////////////////
class divide extends StatelessWidget {
  const divide({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
        width: 170.w,
        child: Divider(
          height: 1.h,
          color: theme.primary,
        ));
  }
}

/////////////////////////////////////////////////////
class SingleProductDetails extends StatelessWidget {
  final OrderItem product; // Product data

  const SingleProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;
    String valuesString = product.attributes
        .map((attr) => attr["options"]?.map((opt) => opt["name"]).join(", "))
        .join(", ");

    print(valuesString);
    return SizedBox(
      height: 80.h,
      width: 300.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 60.h,
                  width: 81.w,
                  child: Image.network(
                    apicat.urlBaseZelle + product.image, // Show product image
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: -3,
                  top: -3,
                  child: Container(
                    height: 15.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: theme.secondary),
                    child: Center(
                      child: Text(
                        product.quantity.toString(), // Show product quantity
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                                color: theme.primary)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            ///////
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: 147.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.name, // Show product name
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: theme.primary,
                            fontSize: 12.sp,
                            height: 1.25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        maxLines: 2),
                    SizedBox(height: 5.h),
                    Contentsmall(
                        subtitle: product.sku,
                        height: 1.2,
                        weight: FontWeight.w500,
                        colors: theme.primary),
                    Contentsmall(
                        subtitle: valuesString,
                        height: 1.2,
                        weight: FontWeight.w500,
                        colors: theme.primary),
                  ],
                ),
              ),
            ),
            /////////////
            cost(
                subtitle: '\$${product.total}', // Show product price
                colors: theme.primary,
                weight: FontWeight.w600,
                fontSize: 12,
                height: 1.25)
          ],
        ),
      ),
    );
  }
}
