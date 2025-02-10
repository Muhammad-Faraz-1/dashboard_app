import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/utils/textwidgets.dart';
import 'package:testapp/widgets/landingpage/chart.dart';

class topsellingcategoriessection extends StatelessWidget {
  const topsellingcategoriessection({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionSubheading(subtitle: 'Top Categories'),
              Container(
                  width: 120.w,
                  height: 30.h,
                  padding: EdgeInsets.all(5.r),
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
            height: 5.h,
          ),
          Column(
            children: [
              categorybox(
                catgeoryname: 'Home Decor',
                orderno: '56 Orders',
                subcat: '12 Subcategories',
              ),
              SizedBox(height: 10.h),
              DottedDashedLine(
                  height: 0,
                  width: 155.w,
                  axis: Axis.horizontal,
                  dashColor: theme.primary),
              SizedBox(height: 10.h),
              categorybox(
                catgeoryname: 'Living Room',
                orderno: '46 Orders',
                subcat: '15 Subcategories',
              ),
              SizedBox(height: 10.h),
              DottedDashedLine(
                  height: 0,
                  width: 155.w,
                  axis: Axis.horizontal,
                  dashColor: theme.primary),
              SizedBox(height: 10.h),
              categorybox(
                catgeoryname: 'Kids Room',
                orderno: '40 Orders',
                subcat: '2 Subcategories',
              ),
              SizedBox(height: 10.h),
              DottedDashedLine(
                  height: 0,
                  width: 155.w,
                  axis: Axis.horizontal,
                  dashColor: theme.primary),
              SizedBox(height: 10.h),
              categorybox(
                catgeoryname: 'Mattressess',
                orderno: '15 Orders',
                subcat: '9 Subcategories',
              ),
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
class categorybox extends StatelessWidget {
  String? catgeoryname;
  String? subcat;
  String? orderno;
  String? img;
  categorybox(
      {super.key,
      required this.catgeoryname,
      required this.orderno,
      required this.subcat});

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
                  catgeoryname!,
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      color: theme.primary),
                ),
                Text(
                  subcat!,
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
            width: 10.w,
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
