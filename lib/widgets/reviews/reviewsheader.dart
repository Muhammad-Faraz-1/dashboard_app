// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class Reviewsheader extends StatelessWidget {
  const Reviewsheader({super.key});

  @override
   Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Provider1>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            review(
              label: 'Total Reviews',
              val: '70',
            ),
            
            review(
              label: 'Total rating',
              val: '4.5',
            ),
          ],
        ),
        SizedBox(height: 10.h,),
        Stack(
          children: [
            Container(
              height: 85.h,
              width: 340.w,
              padding:
                  EdgeInsets.symmetric(horizontal: 21.sp, vertical: 10.sp),
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
                      provider.changeorderfilter(1);
                    },
                    child: reviewfilter(img: 'assets/approved.png', label: 'Approved'),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.changeorderfilter(2);
                    },
                    child: reviewfilter(
                        img: 'assets/pending.png', label: 'Pending'),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.changeorderfilter(3);
                    },
                    child: reviewfilter(
                        img: 'assets/cancel.png', label: 'Rejected'),
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

//////////////////////////////////////////


class review extends StatelessWidget {
  String? val;
  String? label;
  review({super.key, required this.val, required this.label});

  @override
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 54.h,
      width: 160.w,
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          gradient:
              LinearGradient(colors: [theme.onSecondary, theme.secondaryContainer])),
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
          Contentsmall(subtitle: label!, weight: FontWeight.w600, colors: theme.primary)
        ],
      ),
    );
  }
}

class reviewfilter extends StatelessWidget {
  String? img;
  String? label;
  reviewfilter({super.key, required this.img, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 65.h,
      width: 86.w,
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 36.w,
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
          Contentheading1(
            subtitle: label!,
            color: theme.onSecondary,
          )
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////

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
