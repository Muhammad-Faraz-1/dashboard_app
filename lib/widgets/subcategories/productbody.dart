import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';
// import 'package:testapp/widgets/categories/Categorybox.dart';

class Productbody extends StatelessWidget {
  const Productbody({super.key});

  @override
   Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Sectionheading(subtitle: 'Products'),
          SizedBox(
            height: 5.w,
          ),
          SizedBox(
            height: 480.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:Column(
                children: [
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                        Productbox(),SizedBox(height: 5.h,),
                      ],
              )
            ),
          )
        ],
      ),
    );
  }
}


class Productbox extends StatelessWidget {
  const Productbox({super.key});

  @override
   Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: (){
        provider.changecattype(2);
        // Navigator.pushNamed(context, '/fifth');
      },
      child: Container(
        height: 50.h,
        width: double.infinity,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image container
                Container(
                  height: 50.h,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionSubheading(subtitle: 'Lumina Bedroom Set',weight: FontWeight.w600,),
                    Contentsmall(subtitle: 'parent category name', weight: FontWeight.w500, colors: theme.primary,height: 1,),
                    Container(
                      height: 12.h,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.green,
                      child: Center(
                        child: Text('In stock',style: GoogleFonts.poppins(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),),
                      ),
                    )
                  ],
                )
                
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$145',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.white,
                    fontSize: 8.sp,
                    height: 1.25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  )
                ),),
                Text('\$145',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    height: 1.25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  )
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}