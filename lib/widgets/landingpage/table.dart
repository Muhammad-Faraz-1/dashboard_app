import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/utils/textwidgets.dart';

class customtable extends StatelessWidget {
  const customtable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 340.w,
      // height: 600,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          theme.primary.withOpacity(0.6),
          theme.primary.withOpacity(0.3),
          theme.primary.withOpacity(0.6),
        ]),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
           BoxShadow(
            color: theme.shadow.withOpacity(0.15),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionSubheading(subtitle: 'Recent Orders'),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 340.w,
            decoration: BoxDecoration(
              border: Border.all(color: theme.primary, width: 1),
              borderRadius: BorderRadius.circular(4.r),
              color: Colors.transparent,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Customer',
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: theme.primary),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Status',
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: theme.primary),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Address',
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: theme.primary),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Price',
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: theme.primary),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
           TableRow(),
          SizedBox(
            height: 5.h,
          ),
           DottedDashedLine(
              height: 0,
              width: double.infinity,
              axis: Axis.horizontal,
              dashColor: theme.primary),
          SizedBox(
            height: 5.h,
          ),
          const TableRow(),
          SizedBox(
            height: 5.h,
          ),
           DottedDashedLine(
              height: 0,
              width: double.infinity,
              axis: Axis.horizontal,
              dashColor: theme.primary),
          SizedBox(
            height: 5.h,
          ),
          const TableRow(),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}

///////////////////////////////
class TableRow extends StatelessWidget {
  const TableRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 340.w,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Rashid Ali',
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: theme.primary),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
              decoration: const BoxDecoration(color: Color(0xffEBA352)),
              child: Center(
                child: Text(
                  'Pending',
                  style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: theme.primary),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 4,
            child: Text(
              'Lyla Goeprt,6467 Main Market,St rear apartments, pots ville,Pa 1791',
              style: GoogleFonts.poppins(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: theme.primary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 1,
            child: Text(
              '\$455',
              style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: theme.primary),
            ),
          )
        ],
      ),
    );
  }
}
