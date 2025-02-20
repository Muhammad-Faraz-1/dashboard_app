import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:testapp/utils/textwidgets.dart';
import 'package:testapp/widgets/categories/Categorybox.dart';

class Categroiesbody extends StatelessWidget {
  const Categroiesbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sectionheading(subtitle: 'All Catgories'),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 350.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Categorybox(),
                        Categorybox(),
                          ],
                        ),
                        SizedBox(height: 5.h,),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Categorybox(),
                        Categorybox(),
                          ],
                        ),
                        SizedBox(height: 5.h,),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Categorybox(),
                        Categorybox(),
                          ],
                        ),
                        SizedBox(height: 5.h,),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}