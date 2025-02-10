// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';
import 'package:testapp/widgets/categories/categoryheader.dart';

class head extends StatelessWidget {
  const head({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Container(
        width: double.infinity,
        // height: 275.h,
        padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
        decoration: BoxDecoration(
          border: Border.all(color: theme.onTertiary, width: 1),
          borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(20).r,
                  bottomRight: Radius.circular(20).r)
              ,
          gradient: LinearGradient(colors: [
            theme.primary.withOpacity(0.6),
            theme.primary.withOpacity(0.3),
            theme.primary.withOpacity(0.6),
          ]),
          boxShadow: [
            BoxShadow(
                color: theme.shadow.withOpacity(0.15),
                blurRadius: 6,
                spreadRadius: 0,
                offset: Offset.zero)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.cattype==0?
                    Navigator.pop(context):provider.goback();
                    // print('hi');
                  },
                  child: Container(
                    height: 34.h,
                    width: 34.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4).r,
                        gradient: LinearGradient(colors: [
                          theme.primary.withOpacity(0.6),
                          theme.primary.withOpacity(0.3),
                          theme.primary.withOpacity(0.6),
                        ])),
                    child: Center(
                      ///////// backarrow will be placed here
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        color: theme.secondary,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Pageheading(
                      subtitle:provider.cattype==0? 'Category Name':provider.cattype==1?'Products page':'Product Details',
                    )),
                //////////////////////
              ],
            ),
            ////////////////////////////////////////////////////////
            // SizedBox(
            //   height: 10.h,
            // ),
            provider.cattype>=2?Container(height: 0,):
            subcatheaderinfo(),
          ],
        ),
      ),
    );
  }
}

class subcatheaderinfo extends StatelessWidget {
  const subcatheaderinfo({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Provider1>(context);
    // final theme = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // provider.cattype==0?
        // const Static_Header():NewHeader(name: 'Category Name'),
        SizedBox(
          height: 10.h,
        ),
        // //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            catinfobox(
              label: 'categories',
              val: '29',
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
