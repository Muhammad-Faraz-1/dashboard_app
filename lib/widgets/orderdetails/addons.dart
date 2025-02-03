// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/utils/textwidgets.dart';

class Add_On extends StatelessWidget {
  const Add_On({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        color: Colors.transparent,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Sectionheading(subtitle: 'Add ons'),
          SizedBox(
            height: 5.w,
          ),
          Container(
              // height: 340.h,
              width: 320.w,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(colors: [
                    theme.primary.withOpacity(0.6),
                    theme.primary.withOpacity(0.3),
                    theme.primary.withOpacity(0.6),
                  ])),
              child: Column(
                children: [
                  assemblybox(
                    active: 1,
                    img: 'assets/assemble.png',
                    label: 'Professional Assembly(\$210)', content: 'Use professional assembly for all products and save up to \$80',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  assemblybox(
                    active: 0,
                    img: 'assets/protection.png',
                    label: 'Elite Platinum Protection(\$110)', content: '5 years coverage for all stains and most accidental damage',
                  ),
                ],
              ))
        ]));
  }
}

class assemblybox extends StatelessWidget {
  int active;
  String? img;
  String? label;
  String? content;
  assemblybox(
      {super.key,
      required this.active,
      required this.img,
      required this.label,required this.content});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 55.h,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: active == 1
              ? LinearGradient(
                  colors: [theme.onSecondary, theme.onSecondaryContainer])
              : LinearGradient(colors: [theme.primary, theme.primary])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.w,
                child: Image.asset(
                  img!,
                  color: active == 1 ? theme.primary : theme.secondary,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                width: 220.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Contentlarge(
                        subtitle: label!,
                        colors:active==1? theme.primary:theme.secondary,
                        weight: FontWeight.w600),
                    Contentsmall(
                        subtitle:
                            content!,
                        weight: FontWeight.w400,
                        colors:active==1? theme.primary:theme.secondary,)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
            height: 20.h,
            width: 20.w,
            child:active==1? Icon(
              Icons.check_circle,
              color: theme.primary,
            ):Icon(
              Icons.cancel,
              color: theme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
