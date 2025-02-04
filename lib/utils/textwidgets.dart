// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:furnituremecca_mobile_dashboard/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/main.dart';
// import 'package:testapp/statemanager/provider1.dart';

class Pageheading extends StatelessWidget {
  String? subtitle;
  Pageheading({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return Text(
      subtitle!,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          // color: Colors.white,
          color: theme.primary,
          fontSize: 18.sp,
          height: 1.38,
          fontWeight: FontWeight.w500,
        ),
      ),
      textAlign: TextAlign.start,
      textScaler: TextScaler.linear(1.sp),
    );
  }
}

class Sectionheading extends StatelessWidget {
  String? subtitle;
  Sectionheading({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return Text(
      subtitle!,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          // color: Colors.white,
          color: theme.primary,
          fontSize: 15.sp,
          height: 1.25,
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: TextAlign.start,
      textScaler: TextScaler.linear(1.sp),
    );
  }
}

class SectionSubheading extends StatelessWidget {
  String? subtitle;
  FontWeight? weight;
  SectionSubheading({super.key, required this.subtitle, this.weight});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return Text(
      subtitle!,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: theme.primary,
          fontSize: 12.sp,
          height: 1.25,
          fontWeight:weight==null? FontWeight.w500:weight,
          
        ),
        
      ),
      textAlign: TextAlign.start,
      textScaler: TextScaler.linear(1.sp),
      
    );
  }
}

class Contentheading1 extends StatelessWidget {
  String? subtitle;
  Color? color;
  Contentheading1({super.key, required this.subtitle,required this.color});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return Text(
      subtitle!,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color!,
          fontSize: 12.sp,
          height: 1.25,
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: TextAlign.start,
      textScaler: TextScaler.linear(1.sp),
    );
  }
}



///////////////////////////////////////////////

class Contentlarge extends StatelessWidget {
  String? subtitle;
  Color? colors;
  FontWeight? weight;
   Contentlarge({super.key,required this.subtitle,required this.colors,required this.weight});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return Text(
      subtitle!,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: colors,
          fontSize: 12.sp,
          height: 1.25,
          fontWeight: weight,
        ),
      ),
      textAlign: TextAlign.start,
      // maxLines: 2,
      textScaler: TextScaler.linear(1.sp),
    );
  }
}

class Contentsmall extends StatelessWidget {
  String? subtitle;
  FontWeight? weight;
  Color? colors;
  double? height;
   Contentsmall({super.key,required this.subtitle, required this.weight, required this.colors,this.height});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return Text(
      subtitle!,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: colors,
          fontSize: 8.sp,
          height:height==null? 1.5:height,
          fontWeight: weight,
        ),
      ),
      textAlign: TextAlign.start,
      textScaler: TextScaler.linear(1.sp),
    );
  }
}

class Contentmedium extends StatelessWidget {
  String? subtitle;
  Color? colors;
  FontWeight? weight;
   Contentmedium({super.key,required this.subtitle,required this.colors,this.weight});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return Text(
      subtitle!,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: colors,
          fontSize: 10.sp,
          height: 1.2,
          // fontWeight: FontWeight.w500,
          fontWeight: weight==null?FontWeight.w500:weight,
        ),
      ),
      textAlign: TextAlign.start,
      textScaler: TextScaler.linear(1.sp),
    );
  }
}

////////////////////////////////

class cost extends StatelessWidget {
  String? subtitle;
  Color? colors;
  FontWeight? weight;
  int? fontSize;
  double? height;
   cost({super.key,required this.subtitle,required this.colors,required this.weight,required this.fontSize,required this.height});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Provider1>(context);
    return Text(
      subtitle!,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: colors,
          fontSize: fontSize!.sp,
          height: height,
          fontWeight: weight,
        ),
      ),
      textAlign: TextAlign.start,
      textScaler: TextScaler.linear(1.sp),
    );
  }
}