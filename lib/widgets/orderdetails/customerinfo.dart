import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/utils/textwidgets.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key});

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
                  customer(),
                  SizedBox(height: 5.h),
                  address(),
                  SizedBox(height: 5.h),
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
                              subtitle: 'Flat Rate Shipping',
                              colors: theme.primary),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
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
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Contentheading1(
                            subtitle: 'Payment Method',
                            color: theme.primary,
                          ),
                          SizedBox(height: 5.h),
                          Contentmedium(
                              subtitle: 'Credit Card', colors: theme.primary),
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

class customer extends StatelessWidget {
  const customer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
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
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Contentheading1(
              subtitle: 'Customer Info',
              color: theme.primary,
            ),
            SizedBox(
              height: 5.h,
            ),
            Contentmedium(subtitle: 'Abdul Sami', colors: theme.primary),
            Contentmedium(
                subtitle: 'abdulsami123@gmail.com', colors: theme.primary),
            Contentmedium(subtitle: '026572612636', colors: theme.primary),
          ],
        ),
      ],
    );
  }
}

class address extends StatelessWidget {
  const address({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Contentheading1(
              subtitle: 'Address',
              color: theme.primary,
            ),
            SizedBox(
              height: 5.h,
            ),
            Contentmedium(
                subtitle: 'Suite 304-305, 2nd Floor, Main Rashid Minhas Road',
                colors: theme.primary),
            Contentmedium(subtitle: 'Karachi 74500', colors: theme.primary),
            Contentmedium(subtitle: 'Pakistan', colors: theme.primary),
          ],
        ),
      ],
    );
  }
}








// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 15.h,
//               width: 15.w,
//               child: Icon(
//                 Icons.person,
//                 color: theme.primary,
//                 size: 20,
//               ),
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Contentheading1(
//               subtitle: 'Customer Info',
//               color: theme.primary,
//             )
//           ],
//         ),
//         Row(
//           children: [
//             SizedBox(
//               height: 15.h,
//               width: 15.w,
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Contentmedium(subtitle: 'Abdul Sami', colors: theme.primary),
//                 Contentmedium(
//                     subtitle: 'abdulsami123@gmail.com', colors: theme.primary),
//                 Contentmedium(subtitle: '026572612636', colors: theme.primary),
//               ],
//             ),
//           ],
//         )
//       ],
//     );