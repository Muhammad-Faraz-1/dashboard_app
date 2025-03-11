// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/shimmer.dart';
// import 'package:testapp/utils/textwidgets.dart';
// import 'package:testapp/widgets/categories/Categorybox.dart';

class SubCatBody extends StatelessWidget {
  const SubCatBody({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Sectionheading(subtitle: 'All Sub Catgories'),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
              height: 500.h,
              child: apicat.isloading
                  ? GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                      itemCount: 8, // Ensure null safety
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 items per row
                        crossAxisSpacing: 5, // Space between columns
                        mainAxisSpacing: 5, // Space between rows
                        childAspectRatio: 1.05.sp, // Adjust height of boxes
                      ),
                      itemBuilder: (context, index) {
                        return CustomShimmer(width: 167.w,height: 140.h,);
                      },
                    )
                  : GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      itemCount: apicat.subcategories?.length ??
                          0, // Ensure null safety
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 items per row
                        crossAxisSpacing: 5, // Space between columns
                        mainAxisSpacing: 5, // Space between rows
                        childAspectRatio: 0.92.sp, // Adjust height of boxes
                      ),
                      itemBuilder: (context, index) {
                        final category = apicat.subcategories![index];
                        return Subcatbox(
                          name: category['name'],
                          img: category['image2'],
                          parentid: category['uid'],
                          slug: category['slug'],
                        );
                      },
                    ))
        ],
      ),
    );
  }
}

class Subcatbox extends StatelessWidget {
  String? name;
  String? img;
  int? parentid;
  String? slug;
  Subcatbox({super.key, this.name, this.img, this.parentid, this.slug});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        provider.changecattype(1);
        apicat.setSlug(slug!);
      },
      child: Container(
        // height: 50.h,
        width: 167.w,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.onTertiary, width: 1),
          gradient: LinearGradient(colors: [
            theme.primary.withOpacity(0.6),
            theme.primary.withOpacity(0.3),
            theme.primary.withOpacity(0.6),
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image container
            Expanded(
              child: Container(
                // height: 40.h,
                // height: double.infinity,
                // height: 75.h,
                // width: 60.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Image.network(
                  apicat.urlBaseZelle + img!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
            // content column
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Subcategories',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: theme.primary,
                            fontSize: 10.sp,
                          ),
                        ),
                        Text(
                          '12',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: theme.primary,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Products',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: theme.primary,
                            fontSize: 10.sp,
                          ),
                        ),
                        Text(
                          '44',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: theme.primary,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
