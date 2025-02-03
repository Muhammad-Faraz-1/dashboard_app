import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/utils/textwidgets.dart';
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
          Sectionheading(subtitle: 'All Catgories'),
          SizedBox(
            height: 5.w,
          ),
          SizedBox(
            height: 350.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GridView(
                      shrinkWrap: true,
                      // padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Set the number of columns in the grid
                          crossAxisSpacing: 5, // Space between columns
                          mainAxisSpacing: 5, // Space between rows
                          childAspectRatio: 3.3),
                      children: [
                        Categorybox(),
                        Categorybox(),
                        Categorybox(),
                        Categorybox(),
                        Categorybox(),
                        Categorybox(),
                        Categorybox(),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}