import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
// import 'package:testapp/utils/textwidgets.dart';
import 'package:testapp/widgets/categories/Categorybox.dart';

class Categroiesbody extends StatelessWidget {
  const Categroiesbody({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(
      context,
    );
    return Container(
      width: double.infinity,
      height: 450.h,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: SizedBox(
        height: 420.h,
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 5),
          itemCount:
              apicat.categories?.length ?? 0, // Ensure null safety
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 5, // Space between columns
            mainAxisSpacing: 5, // Space between rows
            childAspectRatio: 1.05.sp, // Adjust height of boxes
          ),
          itemBuilder: (context, index) {
            final category = apicat.categories![index];
            return Categorybox2(name: category['name'],img: category['image2'],parentid: category['uid'],);
          },
        ),
      ),
    );
  }
}
