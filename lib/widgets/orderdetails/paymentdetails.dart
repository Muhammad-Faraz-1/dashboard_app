// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/utils/textwidgets.dart';

class Payment_Details extends StatelessWidget {
  const Payment_Details({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Sectionheading(subtitle: 'Payment Details'),
          SizedBox(
            height: 5.w,
          ),
          Container(
            // height: 340.h,
            width: 320.w,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                colors: [
                  theme.primary.withOpacity(0.6),
                  theme.primary.withOpacity(0.3),
                  theme.primary.withOpacity(0.6),
                ],
              ),
            ),
            child: Column(
              children: [
                DetailsRow(label: 'Subtotal', content: '\$233'),SizedBox(height: 5.h,),
                DetailsRow(label: 'Tax', content: '\$233'),SizedBox(height: 5.h,),
                DetailsRow(label: 'Discount', content: '\$233'),SizedBox(height: 5.h,),
                DetailsRow(label: 'Shipping', content: '\$233'),SizedBox(height: 5.h,),
                DetailsRow(label: 'Professional Assembly', content: '\$233'),SizedBox(height: 5.h,),
                DetailsRow(label: 'Protection Plan', content: '\$233'),SizedBox(height: 5.h,),
                Divider(height: 1,color: theme.primary,),SizedBox(height: 5.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Contentheading1(subtitle: 'Total', color: theme.primary, ),
                // Contentheading1(subtitle: '\$4,900', color: theme.primary, ),
                Sectionheading(subtitle: 'Total'),
                Sectionheading(subtitle: '\$1200')
    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  String? label;
  String? content;
   DetailsRow({super.key,required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Contentlarge(
          subtitle: label, colors: theme.primary, weight: FontWeight.w400),
      Contentlarge(
          subtitle: content, colors: theme.primary, weight: FontWeight.w500),
    ]);
  }
}
