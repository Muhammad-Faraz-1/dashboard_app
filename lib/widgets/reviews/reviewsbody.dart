// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';
import 'package:testapp/utils/popup.dart';

class Reviewsbody extends StatelessWidget {
  const Reviewsbody({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sectionheading(subtitle: 'All Reviews'),
          SizedBox(
            height: 5.w,
          ),
          SizedBox(
            height: 330.h,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ReviewBox(),
                    SizedBox(height: 5.h),
                    ReviewBox(),
                    SizedBox(height: 5.h),
                    ReviewBox(),
                    SizedBox(height: 5.h),
                    ReviewBox(),
                    SizedBox(height: 5.h),
                    ReviewBox(),
                    SizedBox(height: 5.h),
                    ReviewBox(),
                    SizedBox(height: 5.h),
                    ReviewBox(),
                    SizedBox(height: 5.h),
                    ReviewBox(),
                    SizedBox(height: 5.h),
                    ReviewBox(),
                    SizedBox(height: 5.h),
                    ReviewBox(),
                    SizedBox(height: 5.h),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

//////////////////
///
///
class ReviewBox extends StatelessWidget {
  const ReviewBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Provider1>(context);
    return GestureDetector(
      onTap: () {provider.drawerval==false?
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomPopup();
          },
        ):null;
      },
      child: Container(
        height: 60.h,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.onTertiary, width: 1),
          gradient: LinearGradient(colors: [
            theme.primary.withOpacity(0.6),
            theme.primary.withOpacity(0.3),
            theme.primary.withOpacity(0.6),
          ]),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Contentheading1(
                    subtitle: 'David Andrew', color: theme.secondary),
                Container(
                  height: 22.h,
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5).r,
                    color: Color(0xff32A848),
                  ),
                  child: Center(
                    child: Text(
                      'Approved',
                      style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                starsvg(img: 'assets/star.svg'),
                starsvg(img: 'assets/star.svg'),
                starsvg(img: 'assets/star.svg'),
                starsvg(img: 'assets/star.svg'),
                starsvg(img: 'assets/star-line.svg'),
                SizedBox(
                  width: 5.w,
                ),
                Contentmedium(
                    subtitle: '4.5',
                    weight: FontWeight.w500,
                    colors: theme.secondary)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class starsvg extends StatelessWidget {
  String? img;
  starsvg({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      width: 15.w,
      child: SvgPicture.asset(
        img!,
        colorFilter: ColorFilter.mode(Color(0xff4769FB), BlendMode.srcIn),
      ),
    );
  }
}
