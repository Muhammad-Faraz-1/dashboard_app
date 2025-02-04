import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/headstatic.dart';
import 'package:testapp/widgets/allorders/head.dart';
import 'package:testapp/widgets/categories/categoryheader.dart';
import 'package:testapp/widgets/landingpage/headercontent.dart';
import 'package:testapp/widgets/reviews/reviewsheader.dart';

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Container(
        width: double.infinity,
        // height: 275.h,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          border: Border.all(color: theme.onTertiary, width: 1),
          borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(20).r,
                  bottomRight: Radius.circular(20))
              .r,
          gradient: LinearGradient(colors: [
            theme.primary.withOpacity(0.6),
            theme.primary.withOpacity(0.3),
            theme.primary.withOpacity(0.6),
          ]),
          boxShadow: [
            BoxShadow(
                color: theme.shadow.withOpacity(0.15),
                blurRadius: 6,
                spreadRadius: 0,
                offset: Offset.zero)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Static_Header(),
            ////////////////////////////////////////////////////////
            SizedBox(height: 10.h,),
            provider.currentpage==1?
            LandingHeader_content():provider.currentpage==2?Allorder_Header(): provider.currentpage==3?  Category_Header(): Reviewsheader(),
          ],
        ),
      ),
    );
  }
}