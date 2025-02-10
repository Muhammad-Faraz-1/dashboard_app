// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';
import 'package:testapp/widgets/reviews/reviewsbody.dart';

class StatusBtn extends StatelessWidget {
  const StatusBtn({super.key});

  @override
 Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return Container(
      width: 165.w,
      height: 22.h,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.primary.withOpacity(0.6),
            theme.primary.withOpacity(0.3),
            theme.primary.withOpacity(0.6),
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
          btn(text: "Approved", bgColor: Color(0xFF32A848)),
          btn(text:"Pending",bgColor:  Color(0xFFF08F9F)),
          btn(text: "Rejected",bgColor:  Color(0xFFEBA352)),
        ],
      ),
    );
    
  }
}
class btn extends StatelessWidget {
  Color? textColor;
  Color? bgColor;
  String? text;
   btn( {super.key,required this.text,required this.bgColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Provider1>(context);
    return GestureDetector(
      onTap: (){
        provider.changereview(text!);
      },
      child: Container(
        width: 55.w,
        height: 22.h,
        decoration: BoxDecoration(
          color: provider.reviewstatus==text? bgColor:Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 9.sp,
              color:provider.reviewstatus==text? theme.primary:Color(0xFF757575),
            ),
          ),
        ),
      ),
    );
  }
}


class ReviewPopupContent extends StatelessWidget {
  const ReviewPopupContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1,sigmaY: 1),
        child: Container(
          height: 200.h,
          width: 320.w,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              theme.primary.withOpacity(0.6),
              theme.primary.withOpacity(0.6),
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
                  Contentmedium(subtitle: '01/02/2025', colors: theme.primary)
                ],
              ),
              // SizedBox(height: 10.h),
               Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 76.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        // border: Border.all(color: theme.onSecondaryContainer,width: 2),
                        // color:  theme.onSecondaryContainer,
                        gradient: LinearGradient(colors: [
                              theme.onSecondary,
                              theme.secondaryContainer,
                            ]),
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
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
  }
}