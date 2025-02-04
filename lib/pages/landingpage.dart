import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/utils/mainheader.dart';
import 'package:testapp/widgets/landingpage/chart.dart';
import 'package:testapp/widgets/landingpage/ordersummary.dart';
import 'package:testapp/widgets/landingpage/speedmeter.dart';
import 'package:testapp/widgets/landingpage/table.dart';
import 'package:testapp/widgets/landingpage/topcategories.dart';
import 'package:testapp/widgets/landingpage/topproducts.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        gradient: LinearGradient(colors: [
              theme.primary.withOpacity(0.6),
              theme.primary.withOpacity(0.3),
              theme.primary.withOpacity(0.6),
            ]),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:  [
            ////// header widget
            // Header(),
            MainPageHeader(),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /////////////// speed meter widget
                  speedometer2(),
                  SizedBox(
                    width: 10.w,
                  ),
                  ///////////// sheild widget
                  secruity(),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            RevenueChart(),
            SizedBox(height: 10.h),
            summarybox(),
            SizedBox(height: 10.h),
            customtable(),
            SizedBox(height: 10.h),
            topsellingcategoriessection(),
            SizedBox(height: 10.h),
            topsellingproductsection(),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}
