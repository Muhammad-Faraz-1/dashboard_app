// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class Orderstatuspopup extends StatelessWidget {
  const Orderstatuspopup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ClipRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            height: 300.h,
            width: 320.w,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.primary.withOpacity(0.6),
                    theme.primary.withOpacity(0.3),
                    theme.primary.withOpacity(0.6),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: theme.onTertiary, width: 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Contentmedium(
                            subtitle: 'Order Id #', colors: theme.primary),
                        Contentmedium(
                            subtitle: '12343',
                            colors: theme.primary,
                            weight: FontWeight.w600),
                      ],
                    ),
                    Contentmedium(
                        subtitle: '18 January 2025', colors: theme.primary),
                  ],
                ),
                SizedBox(height: 15.h),
                cost(
                    colors: theme.primary,
                    subtitle: 'Order Status',
                    weight: FontWeight.w600,
                    fontSize: 15,
                    height: 1.2),
                SizedBox(height: 5.h),
                Statusrow(id: 1, name: 'Delivered'),
                Statusrow(id: 2, name: 'Canceled'),
                Statusrow(id: 3, name: 'Hold'),
                Statusrow(id: 4, name: 'Processing'),
                Statusrow(id: 5, name: 'Backorder'),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                            width: 76.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              // border: Border.all(color: theme.primaryContainer,width: 2),
                              // color:  
                              gradient: LinearGradient(colors: [
                                theme.onSecondary,
                                theme.secondaryContainer,
                              ]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text('Save Status',style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: theme.primary,
                                        fontSize: 10.sp,
                                        height: 1.25,
                                        fontWeight:FontWeight.w600,
                                      ),
                                    ),),
                            )
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class Statusrow extends StatelessWidget {
  String? name;
  int? id;
  Statusrow({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        provider.changestatus(id!);
      },
      child: Container(
        decoration: BoxDecoration(
            border: id != 5
                ? Border(bottom: BorderSide(color: theme.primary, width: 1))
                : Border()),
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            Container(
              height: 15.h,
              width: 15.w,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: provider.state == id
                          ? theme.tertiaryContainer
                          : theme.onTertiary),
                  color: theme.primary),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: provider.state == id
                      ? theme.tertiaryContainer
                      : theme.primary,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            cost(
                subtitle: name,
                colors: theme.primary,
                weight: FontWeight.w500,
                fontSize: 12,
                height: 1.25)
          ],
        ),
      ),
    );
  }
}
