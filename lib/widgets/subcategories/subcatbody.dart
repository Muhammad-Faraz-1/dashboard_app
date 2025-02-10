import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';
// import 'package:testapp/widgets/categories/Categorybox.dart';

class SubCatBody extends StatelessWidget {
  const SubCatBody({super.key});

  @override
   Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Sectionheading(subtitle: 'All Sub Catgories'),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 350.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Subcatbox(),
                        Subcatbox(),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Subcatbox(),
                        Subcatbox(),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Subcatbox(),
                        Subcatbox(),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Subcatbox(),
                        Subcatbox(),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Subcatbox(),
                        Subcatbox(),
                    ],
                  ),
                ],
              ),
             
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
        // Navigator.pushNamed(context, '/fifth');
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