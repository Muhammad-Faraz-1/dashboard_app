import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/utils/mainheader.dart';
import 'package:testapp/widgets/categories/catbody.dart';

class Categories_Page extends StatelessWidget {
  const Categories_Page({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        gradient: LinearGradient(colors: [
          theme.primary.withOpacity(0.6),
          theme.primary.withOpacity(0.3),
          theme.primary.withOpacity(0.6),
        ]),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ////// header widget
            // Category_Header(),
            MainPageHeader(),
            SizedBox(
              height: 10.h,
            ),
            Categroiesbody()
          ],
        ),
      ),
    );
  }
}
