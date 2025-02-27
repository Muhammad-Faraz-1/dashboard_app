// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/utils/shimmer.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/statemanager/provider1.dart';
// import 'package:testapp/utils/headstatic.dart';
// import 'package:testapp/utils/newhead.dart';
import 'package:testapp/utils/textwidgets.dart';

class Category_Header extends StatelessWidget {
  const Category_Header({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Provider1>(context);
    // final theme = Theme.of(context).colorScheme;

    final apicat = Provider.of<apiDataHandeling>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // provider.cattype==0?
        // const Static_Header():NewHeader(name: 'Category Name'),
        SizedBox(
          height: 10.h,
        ),
        // Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           CustomShimmer(width: 160.w, height: 54.h),
        //           CustomShimmer(width: 160.w, height: 54.h),
        //         ],
        //       )
        apicat.isloading == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomShimmer(width: 160.w, height: 54.h),
                  CustomShimmer(width: 160.w, height: 54.h),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  catinfobox(
                    label: 'categories',
                    val: apicat.categories!.length.toString(),
                  ),
                  catinfobox(
                    label: 'Products',
                    val: '320',
                  ),
                ],
              )
      ],
    );
  }
}

class catinfobox extends StatelessWidget {
  String? val;
  String? label;
  catinfobox({super.key, required this.val, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 54.h,
      width: 160.w,
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          gradient: LinearGradient(
              colors: [theme.onSecondary, theme.secondaryContainer])),
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
          Contentsmall(
              subtitle: label!, weight: FontWeight.w600, colors: theme.primary)
        ],
      ),
    );
  }
}
