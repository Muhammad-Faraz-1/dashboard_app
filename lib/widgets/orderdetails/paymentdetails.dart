// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/utils/textwidgets.dart';

class Payment_Details extends StatelessWidget {
  const Payment_Details({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final apicat = Provider.of<apiDataHandeling>(context);
    final order = apicat.selectedOrder;
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
                DetailsRow(label: 'Subtotal', content:"\$${order?.subTotal?.toStringAsFixed(2)}"),SizedBox(height: 5.h,),
                DetailsRow(label: 'Tax', content: "\$${order?.tax?.toStringAsFixed(2) }"),SizedBox(height: 5.h,),
                DetailsRow(label: 'Discount', content: "\$${order?.discount?.toStringAsFixed(2) }"),SizedBox(height: 5.h,),
                DetailsRow(label: 'Shipping', content: "\$${order?.shippingCost?.toStringAsFixed(2) }"),SizedBox(height: 5.h,),
                DetailsRow(label: 'Professional Assembly', content: "\$${order?.professionalAssembledPrice?.toStringAsFixed(2) }"),SizedBox(height: 5.h,),
                DetailsRow(label: 'Protection Plan', content: "\$${order?.cartProtectionPrice?.toStringAsFixed(2)}"),SizedBox(height: 5.h,),
                Divider(height: 1,color: theme.primary,),SizedBox(height: 5.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.sp),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  // Contentheading1(subtitle: 'Total', color: theme.primary, ),
                  // Contentheading1(subtitle: '\$4,900', color: theme.primary, ),
                  Sectionheading(subtitle: 'Total'),
                  Sectionheading(subtitle: "\$${order?.total?.toStringAsFixed(2)}")
                      ]),
                )
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
