
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class ordersfilter extends StatelessWidget {
  String? img;
  String? label;
  ordersfilter({super.key, required this.img, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 65.h,
      width: 66.w,
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
              color: theme.onSecondary,
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
            subtitle: label!, color: theme.onSecondary,
          )
        ],
      ),
    );
  }
}

class activesline extends StatelessWidget {
  const activesline({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: provider.pos.w,
      // left: 20.w,
      bottom: 0.h,
      child: Container(
        height: 5.h,
        width: 46.w,
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

class FixedHeader extends StatelessWidget {
  const FixedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            provider.changecattype(0);
            Navigator.pop(context);
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
              subtitle: 'Order Details',
            )),
        //////////////////////
      ],
    );
  }
}