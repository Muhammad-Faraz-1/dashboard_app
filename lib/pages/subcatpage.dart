import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/widgets/subcategories/catsubheader.dart';
import 'package:testapp/widgets/subcategories/detailsection.dart';
import 'package:testapp/widgets/subcategories/productbody.dart';
import 'package:testapp/widgets/subcategories/subcatbody.dart';

class SubCategoriesPage extends StatelessWidget {
  const SubCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          provider.cattype == 0 ? Navigator.pop(context) : provider.goback();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            // padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage(
                    "assets/bg.png",
                  ),
                  fit: BoxFit.fill),
            ),
            // child: SvgPicture.asset("assets/star.svg",),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
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
                    children: [
                      ////// header widget
                      // CatsubSectionHeader(name: 'Bedrooms'),
                      head(),
                      SizedBox(
                        height: 10.h,
                      ),
                      provider.cattype == 0 ? SubCatBody() :provider.cattype==1? Productbody():Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ProductDetails()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
