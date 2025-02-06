import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/utils/textwidgets.dart';
import 'package:testapp/widgets/landingpage/chart.dart';

class topsellingproductsection extends StatelessWidget {
  const topsellingproductsection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      // height: 600,
      width: 340.w,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          theme.primary.withOpacity(0.6),
          theme.primary.withOpacity(0.3),
          theme.primary.withOpacity(0.6),
        ]),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadow.withOpacity(0.15),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SectionSubheading(subtitle: 'Top Categories'),
              Container(
                  width: 120.w,
                  height: 30.h,
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      theme.primary.withOpacity(0.6),
                      theme.primary.withOpacity(0.3),
                      theme.primary.withOpacity(0.6),
                    ]),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: DropdownMonths()),
            ],
          ),
          SizedBox(
            height: 5.w,
          ),
          Column(
            children: [
              bestproduct(productname: 'Home Decor', orderno: '56 Orders', parentcat: '12 Subcategories',),
               SizedBox(height: 10.h),
               DottedDashedLine(
                  height: 0,
                  width: 155.w,
                  axis: Axis.horizontal,
                  dashColor: theme.primary),
               SizedBox(height: 10.h),

              bestproduct(productname: 'Living Room', orderno: '46 Orders', parentcat: '15 Subcategories',),
               SizedBox(height: 10.h),
              DottedDashedLine(
                  height: 0,
                  width: 155.w,
                  axis: Axis.horizontal,
                  dashColor: theme.primary),
               SizedBox(height: 10.h),

              
              bestproduct(productname: 'Kids Room', orderno: '40 Orders', parentcat: '2 Subcategories',),
               SizedBox(height: 10.h),
              DottedDashedLine(
                  height: 0,
                  width: 155.w,
                  axis: Axis.horizontal,
                  dashColor: theme.primary),
               SizedBox(height: 10.h),

              
              bestproduct(productname: 'Mattressess', orderno: '15 Orders', parentcat: '9 Subcategories',),
               SizedBox(height: 10.h),
              DottedDashedLine(
                  height: 0,
                  width: 155.w,
                  axis: Axis.horizontal,
                  dashColor: theme.primary),
               SizedBox(height: 10.h),
            ],
          ),
        ],
      ),
    );
  }
}







// ignore: must_be_immutable
class bestproduct extends StatelessWidget {
  String? productname;
  String? parentcat;
  String? orderno;
  String? img;
   bestproduct({super.key,required this.productname,required this.orderno,required this.parentcat,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 36.h,
      width: 340.w,
      color: Colors.transparent,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
                height: 36.h,
                width: 54.w,
                child: Image.asset(
                  'assets/catimg.png',
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productname!,
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      color: theme.primary),
                ),
                Text(
                  parentcat!,
                  style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: theme.primary),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 5,
            child: Text(
              orderno!,
              style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: theme.primary),
            ),
          ),
        ],
      ),
    );
  }
}


