// ignore_for_file: must_be_immutable
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';
// import 'package:testapp/widgets/allorders/head.dart';
import 'package:testapp/widgets/orderdetails/orderheadercompoenets.dart';

class Headerdetails extends StatelessWidget {
  const Headerdetails({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Container(
        width: double.infinity,
        // height: 210.h,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          border:
              Border.all(color: theme.tertiary, width: 1),
          borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(20).r,
              bottomRight: Radius.circular(20).r),
          gradient: LinearGradient(colors: [
            theme.primary.withOpacity(0.6),
            theme.primary.withOpacity(0.3),
            theme.primary.withOpacity(0.6),
          ]),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 6,
                spreadRadius: 0,
                offset: Offset.zero)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CatsubSectionHeader(name: 'Order Details'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // provider.cattype==0?
                    // Navigator.pop(context):provider.goback();
                    // print('hi');
                  },
                  child: Container(
                    height: 34.h,
                    width: 34.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4).r,
                        gradient: LinearGradient(colors: [
                          theme.primary.withOpacity(0.6),
                          theme.primary.withOpacity(0.3),
                          theme.primary.withOpacity(0.6),
                        ])),
                    child: Center(
                      ///////// backarrow will be placed here
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        color: theme.secondary,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Pageheading(
                      subtitle:'Order Details',
                    )),
                //////////////////////
              ],
            ),
            // 
            SizedBox(
              height: 10.h,
            ),
            /////// order info
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                headinfobox(),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            //// filter row
            Stack(
              children: [
                Container(
                  height: 85.h,
                  width: 340.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
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
                      GestureDetector(
                        onTap: () {
                          provider.changepos(1);
                        },
                        child: ordersfilter(
                            img: 'assets/all.png', label: 'Customer'),
                      ),
                      GestureDetector(
                        onTap: () {
                           provider.changepos(2);
                        },
                        child: ordersfilter(
                            img: 'assets/pending.png', label: 'Order'),
                      ),
                      GestureDetector(
                        onTap: () {
                           provider.changepos(3);
                        },
                        child: ordersfilter(
                            img: 'assets/cancel.png', label: 'Addon'),
                      ),
                      GestureDetector(
                        onTap: () {
                           provider.changepos(4);
                        },
                        child: ordersfilter(
                            img: 'assets/cancel.png', label: 'Payment'),
                      ),
                    ],
                  ),
                ),
                activesline(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class headinfobox extends StatelessWidget {
  headinfobox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Stack(
        children: [
          Container(
            height: 60.h,
            // width: 340.w,
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                gradient:
                    LinearGradient(colors: [theme.onSecondary, theme.onSecondaryContainer])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Contentmedium(
                            subtitle: 'Order #',
                            weight: FontWeight.w400,
                            colors: theme.primary),
                        SizedBox(
                          width: 5.w,
                        ),
                        Contentmedium(
                            subtitle: '16253',
                            weight: FontWeight.w600,
                            colors: theme.primary),
                      ],
                    ),
                    Row(
                      children: [
                        Contentmedium(
                            subtitle: 'Payment Gateway',
                            weight: FontWeight.w400,
                            colors: theme.primary),
                        SizedBox(
                          width: 5.w,
                        ),
                        Contentmedium(
                            subtitle: 'Acima Leasing',
                            weight: FontWeight.w600,
                            colors: theme.primary),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Contentmedium(
                        subtitle: 'Order Date',
                        weight: FontWeight.w400,
                        colors: theme.primary),
                    SizedBox(
                      width: 5.w,
                    ),
                    Contentmedium(
                        subtitle: '12 Jan 2025',
                        weight: FontWeight.w600,
                        colors: theme.primary),
                  ],
                ),
                Row(
                  children: [
                    Contentmedium(
                        subtitle: 'Delivery Date',
                        weight: FontWeight.w400,
                        colors: theme.primary),
                    SizedBox(
                      width: 5.w,
                    ),
                    Contentmedium(
                        subtitle: '25 Jan 2025',
                        weight: FontWeight.w600,
                        colors: theme.primary),
                  ],
                )
              ],
            ),
          ),
          Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            width: 90.w,
            height: 22.h,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(color: Color(0xff32A848),borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                'Delivered',
                style: GoogleFonts.poppins(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                    color: theme.primary),
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
