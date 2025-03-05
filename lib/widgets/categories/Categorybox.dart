// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:testapp/model/categoriesapi.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/statemanager/provider1.dart';
// import 'package:testapp/utils/textwidgets.dart';

// import '../../statemanager/provider1.dart';

// class Categorybox extends StatelessWidget {
//   String? name;
//   String? img;
//   Categorybox({super.key, this.name, this.img});

//   @override
//   Widget build(BuildContext context) {
//     final apicat = Provider.of<apiDataHandeling>(context);
//     final theme = Theme.of(context).colorScheme;
//     return GestureDetector(
//       onTap: () {
//         // provider.changecattype(1);
//         // apicat.getcategoriesdata();
//         // fetchPost(context);
//         // Navigator.pushNamed(context, '/fourth');
//       },
//       child: Container(
//         height: 50.h,
//         width: 167.w,
//         padding: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: theme.onTertiary, width: 1),
//           gradient: LinearGradient(colors: [
//             theme.primary.withOpacity(0.6),
//             theme.primary.withOpacity(0.3),
//             theme.primary.withOpacity(0.6),
//           ]),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // image container
//             Container(
//               // height: 40.h,
//               height: double.infinity,
//               width: 60.w,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
//               child: Image.network(
//                 apicat.urlBase + img!,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             SizedBox(
//               width: 5.w,
//             ),
//             // content column
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Flexible(child: SectionSubheading(subtitle: name,weight: FontWeight.w600,)),
//                 SizedBox(
//                   width: 80,
//                   child: Text(
//                     name!,
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         color: theme.primary,
//                         fontSize: 12.sp,
//                         height: 1,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     overflow: TextOverflow.clip,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(1.sp),
//                     maxLines: 2,
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Contentsmall(
//                       subtitle: '12 Categories',
//                       weight: FontWeight.w500,
//                       colors: theme.primary,
//                       height: 1.25,
//                     ),
//                     Contentsmall(
//                       subtitle: '44 Products',
//                       weight: FontWeight.w500,
//                       colors: theme.primary,
//                       height: 1.25,
//                     ),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// ////////////////////////////////////////////////
// ///////////////////////////////////////////////

class Categorybox extends StatelessWidget {
  String? name;
  String? img;
  int? parentid;
  Categorybox({super.key, this.name, this.img, this.parentid});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        apicat.setparent(parentid, context);
        Navigator.pushNamed(context, '/fourth');
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
                child: Image.network(
                  apicat.urlBaseZelle + img!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
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
