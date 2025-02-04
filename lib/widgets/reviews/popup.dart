// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';
import 'package:testapp/widgets/reviews/reviewsbody.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Dialog(
      insetPadding: EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1,sigmaY: 1),
        child: Container(
          height: 200.h,
          width: 320.w,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              theme.primary.withOpacity(0.6),
              theme.primary.withOpacity(0.3),
              theme.primary.withOpacity(0.6),
            ],),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:  theme.onTertiary,width: 1)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Sectionheading(subtitle: 'David Steffan'),
                  Contentmedium(subtitle: '12 Jan 2025', colors: theme.primary)
                ],
              ),
              // SizedBox(height: 10.h),
               Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      colors: theme.secondary),
                ],
              ),
              // SizedBox(height: 10.h),
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Contentmedium(subtitle: 'Product', colors: theme.primary),
                  SizedBox(height: 5.h,),
                  SectionSubheading(subtitle: 'Lumina Bedroom Set'),
                ],
              ),
              // SizedBox(height: 10.h),
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Contentmedium(subtitle: 'Comment', colors: theme.primary),
                  SizedBox(height: 5.h,),
                  Contentmedium(subtitle: 'The entire set is beautifully crafted, bringing a cohesive and modern look to my room.', colors: theme.primary)
                  // SectionSubheading(subtitle: 'Lumina Bedroom Set'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusBtn(),
                  Container(
                    width: 76.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.onSecondaryContainer,width: 2),
                      color:  theme.onSecondaryContainer,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('Save Status',style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: theme.primary,
                                fontSize: 10.sp,
                                height: 1.25,
                                fontWeight:FontWeight.w600,
                              ),
                            ),),
                    )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class StatusBtn extends StatelessWidget {
  const StatusBtn({super.key});

  @override
 Widget build(BuildContext context) {
    // final provider = Provider.of<Provider1>(context);
    return Container(
      width: 165.w,
      height: 22.h,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.6),
            Color.fromRGBO(255, 255, 255, 0.3),
            Color.fromRGBO(255, 255, 255, 0.6)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          btn(text: "Approved", textColor: Colors.white, bgColor: Color(0xFF32A848),),
          btn(text:"Pending",textColor:  Color(0xFF757575),bgColor:  Colors.transparent),
          btn(text: "Rejected",textColor:  Color(0xFF757575),bgColor:  Colors.transparent),
        ],
      ),
    );
    
  }
}
class btn extends StatelessWidget {
  Color? textColor;
  Color? bgColor;
  String? text;
   btn( {super.key,required this.text,required this.textColor,required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 22.h,
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 9,
            color: textColor,
          ),
        ),
      ),
    );
  }
}