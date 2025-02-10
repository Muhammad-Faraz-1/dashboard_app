// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingHeader_content extends StatelessWidget {
  String date = DateTime.now().toString().substring(0, 10);

  String getFormattedDate() {
    DateTime now = DateTime.now();
    return '${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}/${now.year}';
  }

  LandingHeader_content({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    String date1 = getFormattedDate();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date1,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.primary,
                      height: 1.1),
                )),
            Text('Hi Jasons,',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.primary,
                      height: 1.1),
                )),
          ],
        ),
        //////////
        SizedBox(
          height: 10.h,
        ),
        //////////
        Container(
          // height: 154.h,
          width: double.infinity,
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                theme.primary.withOpacity(0.6),
                theme.primary.withOpacity(0.3),
                theme.primary.withOpacity(0.6),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dashboard',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: theme.secondaryContainer,
                        height: 1.1),
                  )),
                  SizedBox(height: 10.h,),
              Text(
                'Hi Jasons, great to see you! Your store made 23 sales yesterday. Let\'s aim even higher today!',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.secondaryContainer,
                      overflow: TextOverflow.clip,
                      height: 1.1),
                ),
                maxLines: 3,
              ),SizedBox(height: 10.h,),
              Container(
                width: 110.w,
                height: 28.h,
                padding: EdgeInsets.only(left: 10.sp,top: 5.sp,right: 5.sp,bottom: 5.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40).r,
                  color: theme.secondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('View Sales',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: theme.primary,
                          ),
                        )),
                    Container(
                      height: 18.h,
                      width: 18.w,
                      // padding: EdgeInsets.all(value),
                      decoration: BoxDecoration(
                          color: theme.primary, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          size: 10.sp,
                          Icons.arrow_forward_ios_outlined,
                          color: theme.secondary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
