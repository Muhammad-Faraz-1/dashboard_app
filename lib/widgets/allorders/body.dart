// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sectionheading(subtitle: 'All Orders'),
          // SizedBox(
          //   height: 5.w,
          // ),
          SizedBox(
            height: 360.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  orderbox(
                    color: Color(0xffEBA352),
                    val: 'Hold',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  orderbox(
                    color: Color(0xff5285B4),
                    val: 'Processing',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  orderbox(
                    color: Color(0xff32A848),
                    val: 'Delivered',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  orderbox(
                    color: Color(0xffF08F9F),
                    val: 'Canceled',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  orderbox(
                    color: Color(0xff32A848),
                    val: 'Delivered',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  orderbox(
                    color: Color(0xff32A848),
                    val: 'Delivered',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/////////////////

class orderbox extends StatelessWidget {
  Color? color;
  String? val;
  orderbox({super.key, required this.color, required this.val});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return GestureDetector(
      onTap: () {
        // provider.changepage(5);
        Navigator.pushNamed(context, '/third');
      },
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              // height: 60.h,
              width: 320.w,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(colors: [
                  theme.primary.withOpacity(0.6),
                  theme.primary.withOpacity(0.3),
                  theme.primary.withOpacity(0.6),
                ]),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Contentsmall(
                        subtitle: 'Order #13224',
                        weight: FontWeight.w600,
                        colors: theme.onSecondary,
                      ),
                      Contentsmall(
                        subtitle: '12 Jan 2025',
                        weight: FontWeight.w600,
                        colors: theme.secondary,
                      )
                    ],
                  ),
                  Contentlarge(
                      subtitle: 'Abdul Sami',
                      colors: theme.secondary,
                      weight: FontWeight.w500),
                  cost(
                      subtitle: '\$450',
                      colors: theme.secondary,
                      weight: FontWeight.w600,
                      fontSize: 15,
                      height: 1.2,)
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                decoration: BoxDecoration(color: color!,borderRadius: BorderRadius.circular(4.r)),
                child: Center(
                  child: Text(
                    val!,
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
