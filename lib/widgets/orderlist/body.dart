// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:testapp/pages/orderdetails.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/shimmer.dart';
// import 'package:testapp/statemanager/provider1.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/pages/orderdetails.dart';
// import 'package:testapp/statemanager/provider1.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    final apicat = Provider.of<apiDataHandeling>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: SizedBox(
        height: 360.h,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 500.h,
            child: apicat.isfetchdeatils == true
                ? GridView.builder(
                    padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: apicat.orderlist!.length,
                    // apicat.orderdetails?.length ?? 0, // Ensure null safety
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // 2 items per row
                      mainAxisSpacing: 5, // Space between rows
                      childAspectRatio: 3.9.sp, // Adjust height of boxes
                    ),
                    itemBuilder: (context, index) {
                      final order = apicat.orderlist![index];
                      return apicat.orderfilter == "all"
                          ? orderbox(
                              name: order['billing']['first_name'] +
                                  " " +
                                  order['billing']['last_name'],
                              orderid: order['_id'],
                              date: order['createdAt'],
                              totalprice: order['total'],
                              status: order['status'],
                              // status: 'Processing',
                            )
                          : order['status'] == apicat.orderfilter
                              ? orderbox(
                                  name: order['billing']['first_name'] +
                                      " " +
                                      order['billing']['last_name'],
                                  orderid: order['_id'],
                                  date: order['createdAt'],
                                  totalprice: order['total'],
                                  status: order['status'],
                                  // status: 'Processing',
                                ):CustomShimmer();
                    },
                  )
                : Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()),
                  ),
          ),
        ),
      ),
    );
  }
}

/////////////////

class orderbox extends StatelessWidget {
  String? name;
  String? orderid;
  String? date;
  double? totalprice;
  String? status;
  orderbox(
      {super.key,
      this.date,
      this.name,
      this.orderid,
      this.status,
      this.totalprice});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Provider1>(context);
    final apicat = Provider.of<apiDataHandeling>(context);
    return GestureDetector(
      onTap: () {
        provider.drawerval == false
            ? Navigator.pushNamed(context, '/third')
            : null;
        // provider.changepage(1);
        // _selectedOrder
        apicat.fetchOrderDetails(orderid!);
      },
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              // height: 60.h,
              width: MediaQuery.of(context).size.width - 20,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                border: Border.all(color: theme.primary),
                borderRadius: BorderRadius.circular(10.r),
                gradient: LinearGradient(colors: [
                  theme.primary.withOpacity(0.6),
                  theme.primary.withOpacity(0.3),
                  theme.primary.withOpacity(0.6),
                ]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Contentsmall(
                        subtitle: orderid!,
                        weight: FontWeight.w600,
                        colors: theme.onSecondary,
                      ),
                      Contentsmall(
                        subtitle: date!.substring(0, 9),
                        weight: FontWeight.w600,
                        colors: theme.secondary,
                      )
                    ],
                  ),
                  Contentlarge(
                      subtitle: name!,
                      colors: theme.secondary,
                      weight: FontWeight.w500),
                  cost(
                    subtitle: '\$ ${totalprice!.toInt()}',
                    colors: theme.secondary,
                    weight: FontWeight.w600,
                    fontSize: 15,
                    height: 1.2,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                decoration: BoxDecoration(
                    color: status == 'pending'
                        ? Color(0xffEBA352)
                        : status == 'delivered'
                            ? Color(0xff32A848)
                            : status == 'cancel'
                                ? Color(0xffF08F9F)
                                : Color(0xff5285B4),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Center(
                  child: Text(
                    status!,
                    style: GoogleFonts.poppins(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        color: theme.primary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
