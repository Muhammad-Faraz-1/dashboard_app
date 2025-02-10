import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/utils/textwidgets.dart';
import 'package:testapp/widgets/landingpage/speedmeter.dart';

class summarybox extends StatelessWidget {
  const summarybox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 193.h,
      width: 340.w,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          theme.primary.withOpacity(0.6),
          theme.primary.withOpacity(0.3),
          theme.primary.withOpacity(0.6),
        ]),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadow.withOpacity(0.15),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionSubheading(subtitle: 'Order Summary'),
          SizedBox(
            height: 5.h,
          ),
          // GridView.builder( gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2, // Set the number of columns in the grid
          //       crossAxisSpacing: 10, // Space between columns
          //       mainAxisSpacing: 10, // Space between rows
          //       childAspectRatio: 2.2), itemBuilder: (BuildContext,4){
          //         return summarydetails(head: '', val: '')
          //       })
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  summarydetails(head: 'New Order', val: '15'),
              summarydetails(head: 'Completed Order', val: '8'),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [summarydetails(head: 'Processing Order', val: '6'),
              summarydetails(head: 'Canceled Order', val: '1'),
                ],
              )
            ],
          )
         
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class summarydetails extends StatelessWidget {
  String? head;
  String? val;
  summarydetails({super.key, required this.head, required this.val});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 70.h,
      width: 155.w,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient:
              LinearGradient(colors: [theme.onSecondary, theme.secondaryContainer])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SectionSubheading(subtitle: head!),
          AcceleratingCounter1(targetNumber: int.parse(val!), color: Colors.white,percent: false,)
          //  AcceleratingCounter(targetNumber: int.parse(val!), color: theme.primary,)
          // Text(
          //   val!,
          //   style: GoogleFonts.poppins(
          //       textStyle: TextStyle(
          //           fontSize: 20.sp,
          //           fontWeight: FontWeight.w500,
          //           height: 1.1,
          //           color: theme.primary)),
          // )
        ],
      ),
    );
  }
}
