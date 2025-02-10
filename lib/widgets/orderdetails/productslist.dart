import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/utils/textwidgets.dart';

class ListofProducts extends StatelessWidget {
  const ListofProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        color: Colors.transparent,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Sectionheading(subtitle: 'Customer Details'),
          SizedBox(
            height: 5.w,
          ),
          Container(
              height: 340.h,
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
              //// product container starts here
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleProductDetails(),
                    SizedBox(height: 5.h),
                    divide(),
                    SizedBox(height: 5.h),
                    SingleProductDetails(),
                    SizedBox(height: 5.h),
                    divide(),
                    SizedBox(height: 5.h),
                    SingleProductDetails(),
                    SizedBox(height: 5.h),
                    divide(),
                    SizedBox(height: 5.h),
                    SingleProductDetails(),
                    SizedBox(height: 5.h),
                    divide(),
                    SizedBox(height: 5.h),
                    SingleProductDetails(),
                    SizedBox(height: 5.h),
                    divide(),
                    SizedBox(height: 5.h),
                    SingleProductDetails(),
                    SizedBox(height: 5.h),
                  ],
                ),
              ))
        ]));
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
  const SingleProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 60.h,
      width: 300.w,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 2.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 60.h,
                  width: 81.w,
                  child: Image.asset(
                    'assets/product.png',
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
                        '1',
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
                    Text(
                        'Monaco 3 PC Modular Sectional with 2 Chaise, Grey, Sectional',
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
                        subtitle: 'sku-1273971',
                        height: 1.2,
                        weight: FontWeight.w400,
                        colors: theme.primary),
                    Contentsmall(
                        subtitle: 'Brown color Queen Size Bed',
                        height: 1.2,
                        weight: FontWeight.w400,
                        colors: theme.primary),
                  ],
                ),
              ),
            ),
            /////////////
            cost(
                subtitle: '\$455',
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
