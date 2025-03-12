// ignore_for_file: must_be_immutable, camel_case_types
// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/shimmer.dart';
// import 'package:testapp/utils/headstatic.dart';
import 'package:testapp/utils/textwidgets.dart';

class Allorder_Header extends StatelessWidget {
  const Allorder_Header({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    // final order = apicat.orderlist!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            apicat.isloading == false
                ? headinfobox(
                    label: 'Orders',
                    val: apicat.displayedOrders.length.toString(),
                  )
                : CustomShimmer(
                    width: 54.w,
                    height: 109.h,
                  ),
            SizedBox(
              width: 5.w,
            ),
            apicat.isloading == false
                ? headinfobox(
                    label: 'Sales',
                    val: '\$${apicat.sales!.toStringAsFixed(0)}K',
                  )
                : CustomShimmer(
                    width: 54.w,
                    height: 109.h,
                  ),
            SizedBox(
              width: 5.w,
            ),
            apicat.isloading == false
                ? headinfobox(
                    label: 'Sales',
                    val: '\$${apicat.sales!.toStringAsFixed(0)}K',
                  )
                : CustomShimmer(
                    width: 54.w,
                    height: 109.h,
                  ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Stack(
          children: [
            Container(
              height: 85.h,
              width: 340.w,
              padding: EdgeInsets.symmetric(horizontal: 21.sp, vertical: 10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  gradient: LinearGradient(colors: [
                    theme.primary.withOpacity(0.6),
                    theme.primary.withOpacity(0.3),
                    theme.primary.withOpacity(0.6),
                  ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  orderfilter(
                    img: 'assets/all.png',
                    label: 'All',
                    id: 1,
                  ),
                  orderfilter(
                    img: 'assets/pending.png',
                    label: 'Processing',
                    id: 2,
                  ),
                  orderfilter(
                    img: 'assets/cancel.png',
                    label: 'Canceled',
                    id: 3,
                  ),
                ],
              ),
            ),
            activeline(),
          ],
        )
      ],
    );
  }
}

class headinfobox extends StatelessWidget {
  String? val;
  String? label;
  headinfobox({super.key, required this.val, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 54.h,
      width: 109.w,
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          gradient: LinearGradient(
              colors: [theme.onSecondary, theme.secondaryContainer])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            val!,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                    color: theme.primary)),
          ),
          Text(
            label!,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: theme.primary)),
          )
        ],
      ),
    );
  }
}

class orderfilter extends StatelessWidget {
  String? img;
  String? label;
  int? id;
  orderfilter(
      {super.key, required this.img, required this.label, required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    final apicat = Provider.of<apiDataHandeling>(
      context,
    );
    return GestureDetector(
      onTap: () {
        provider.drawerval == false ? provider.changeorderfilter(id!) : null;
        apicat.currentorders(label == 'Processing' ? 'pending' : label!);
      },
      child: Container(
        height: 75.h,
        width: 86.w,
        padding: EdgeInsets.symmetric(vertical: 5.sp),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 36.h,
              width: 36.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.onSecondaryContainer,
              ),
              child: Center(
                child: SizedBox(
                  height: 26.h,
                  width: 26.w,
                  child: Image.asset(img!),
                ),
              ),
            ),
            // SizedBox(height: 5.h,),
            Contentheading1(
              subtitle: label!,
              color: theme.onSecondary,
            )
          ],
        ),
      ),
    );
  }
}

class activeline extends StatelessWidget {
  const activeline({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Provider1>(context);
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: provider.left.w,
      bottom: 0.h,
      child: Container(
        height: 5.h,
        width: 54.w,
        decoration: BoxDecoration(
          color: theme.onSecondary,
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(
            width: 4.w,
            color: theme.onSecondary,
          ),
        ),
      ),
    );
  }
}
