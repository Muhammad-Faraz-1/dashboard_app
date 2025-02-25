// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';
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
        children: [
          // Sectionheading(subtitle: 'All Sub Catgories'),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
                  height: 500.h,
                  child:apicat.isfetchedsubcat==true? GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    itemCount:
            apicat.subcategories?.length ?? 0, // Ensure null safety
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 5, // Space between columns
          mainAxisSpacing: 5, // Space between rows
          childAspectRatio: 1.05.sp, // Adjust height of boxes
                    ),
                    itemBuilder: (context, index) {
          final category = apicat.subcategories![index];
          return SubCategorybox2(name: category['name'],img: category['image2'],parentid: category['uid'],);
                    },
                  ):Center(
                child: SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator()),
              ),
                )
        ],
      ),
    );
  }
}


class Subcatbox extends StatelessWidget {
  const Subcatbox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: (){
        provider.changecattype(1);
        Navigator.pushNamed(context, '/fifth');
      },
      child: Container(
        height: 50.h,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image container
            Container(
              height: 40.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Image.asset('assets/product2.png',fit: BoxFit.contain,),
            ),
            SizedBox(width: 5.w,),
            // content column
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionSubheading(subtitle: 'Bedroom',weight: FontWeight.w600,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Contentsmall(subtitle: '12 Categories', weight: FontWeight.w500, colors: theme.primary,height: 1.25,),
                    Contentsmall(subtitle: '44 Products', weight: FontWeight.w500, colors: theme.primary,height: 1.25,),
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


class SubCategorybox2 extends StatelessWidget {
  String? name;
  String? img;
  int? parentid;
  SubCategorybox2({super.key, this.name, this.img,this.parentid});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        provider.changecattype(1);
        Navigator.pushNamed(context, '/fifth');
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
            Container(
              // height: 40.h,
              // height: double.infinity,
              // height: 75.h,
              // width: 60.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Image.network(
                apicat.urlBase + img!,
                fit: BoxFit.contain,
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
                // Flexible(child: SectionSubheading(subtitle: name,weight: FontWeight.w600,)),
                // SizedBox(
                //   width: 80,
                //   child: Text(
                //     name!,
                //     style: GoogleFonts.poppins(
                //       textStyle: TextStyle(
                //         color: theme.primary,
                //         fontSize: 12.sp,
                //         height: 1,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //     overflow: TextOverflow.clip,
                //     textAlign: TextAlign.start,
                //     textScaler: TextScaler.linear(1.sp),
                //     maxLines: 2,
                //   ),
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Contentsmall(
                    //   subtitle: '12 \nSubcategories',
                    //   weight: FontWeight.w500,
                    //   colors: theme.primary,
                    //   height: 1.25,
                    // ),
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
                    // Contentsmall(
                    //   subtitle: '44 Products',
                    //   weight: FontWeight.w500,
                    //   colors: theme.primary,
                    //   height: 1.25,
                    // ),
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
