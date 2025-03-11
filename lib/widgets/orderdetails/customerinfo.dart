import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/utils/textwidgets.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;

    final order = apicat.selectedOrder; // Order? object
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Sectionheading(subtitle: 'Customer Details'),
          SizedBox(
            height: 5.w,
          ),
          Container(
              // height: 350.h,
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
                  Customer(),
                  SizedBox(height: 10.h),
                  address(),
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 15.h,
                          width: 15.w,
                          child: Icon(
                            Icons.local_shipping,
                            color: theme.primary,
                            size: 20,
                          )),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Contentheading1(
                            subtitle: 'Shipping',
                            color: theme.primary,
                          ),
                          SizedBox(height: 5.h),
                          Contentmedium(
                            weight: FontWeight.w600,
                              subtitle: order?.isShipping == 0
                                  ? 'Local Pickup'
                                  : order?.shippingCost == 0
                                      ? 'Free Shipping'
                                      : "Flat Rate Shipping",
                              colors: theme.primary),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                        width: 15.w,
                        child: Icon(
                          Icons.payment,
                          color: theme.primary,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Contentheading1(
                            subtitle: 'Payment Method',
                            color: theme.primary,
                          ),
                          SizedBox(height: 5.h),
                          Contentmedium(
                            weight: FontWeight.w600,
                              subtitle: order?.paymentMethod!,
                              colors: theme.primary),
                        ],
                      )
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class Customer extends StatelessWidget {
  const Customer({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;

    final order = apicat.selectedOrder; // Order? object select order object is connected to order to be used

    if (order == null || order.billing == null) {
      return Center(
        child: Text(
          "No Customer Data Available",
          style: TextStyle(color: theme.error),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
          width: 15.w,
          child: Icon(
            Icons.person,
            color: theme.primary,
            size: 20,
          ),
        ),
        SizedBox(width: 10.w),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Contentheading1(
                size: 15.sp,
                subtitle: 'Customer Info',
                color: theme.primary,
              ),
              SizedBox(height: 2.h),
              Contentmedium(
                size: 12.sp,
                subtitle:
                    order.billing!.firstName, 
                colors: theme.primary,
              ),
              SizedBox(height: 2.h),
              Contentmedium(
              size: 12.sp,
              subtitle: order.billing!.email,
              colors: theme.primary,
                            ),
              SizedBox(height: 2.h),
              Contentmedium(
                size: 12.sp,
                subtitle: order.billing!.phone,
                colors: theme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class address extends StatelessWidget {
  const address({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;

    final order = apicat.selectedOrder; 

    if (order == null || order.billing == null) {
      return Center(
        child: Text(
          "No Customer Data Available",
          style: TextStyle(color: theme.error),
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
          width: 15.w,
          child: Icon(
            Icons.location_on,
            color: theme.primary,
            size: 20,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Contentheading1(
                size: 15.sp,
                subtitle: 'Address',
                color: theme.primary,
              ),
              SizedBox(
                height: 5.h,
              ),
              Contentmedium(
                size: 12.sp,
                  subtitle: order.billing!.address1, colors: theme.primary),
              SizedBox(height: 2.h),
              Contentmedium(
                size: 12.sp,
                  subtitle: order.billing!.city, colors: theme.primary),
              SizedBox(height: 2.h),
              Contentmedium(
                size: 12.sp,
                  subtitle:
                      '${order.billing!.state}, ${order.billing!.country}',
                  colors: theme.primary),
            ],
          ),
        ),
      ],
    );
  }
}