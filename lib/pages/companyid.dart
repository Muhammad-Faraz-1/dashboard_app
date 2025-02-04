import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/main.dart';
// import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class Idpage extends StatelessWidget {
  const Idpage({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage(
                  "assets/bg.png",
                ),
                fit: BoxFit.fill),
          ),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            padding: EdgeInsets.fromLTRB(40, 40, 40, 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              theme.primary.withOpacity(0.6),
              theme.primary.withOpacity(0.3),
              theme.primary.withOpacity(0.6),
            ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 140.w,
                  child: Image.asset('assets/zelle-logo.png'),
                ),
                ////////////////////////////////////////////////
                ////////////////////////////////////////////////
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Pageheading(subtitle: 'Enter Company ID'),
                    SizedBox(height: 15.h,),
                    Container(
                      height: 38.h,
                      padding: EdgeInsets.only(left: 10.sp),
                      decoration: BoxDecoration(
                          border: Border.all(color: theme.onTertiary),
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            theme.primary.withOpacity(0.6),
                            theme.primary.withOpacity(0.3),
                            theme.primary.withOpacity(0.6),
                          ])),
                      child: Center(
                        child: TextField(
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.none,
                              textStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: theme.tertiary,
                                  height: 1.5)),
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.check_circle_outline,
                              color: theme.primary,
                            ),
                            hintText: '1230-344',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: theme.tertiary,
                                  height: 1.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/first');
                      },
                      child: Container(
                        height: 38.h,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          // border: Border.all(color: theme.onTertiary),
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              theme.onSecondary,
                              theme.secondaryContainer
                            ],
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Continue to login', style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: theme.primary,
                                        height: 1.5),
                                  ),),
                                  SizedBox(width: 10.w,),
                                  Image.asset('assets/login.png',color: theme.primary,)
                                  // SvgPicture.asset('assets/login.svg')
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                ////////////////////////////////////////////////
                ////////////////////////////////////////////////
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 15.h,width: 15.w,
                        child: Image.asset('assets/halflogo.png'),),
                        SizedBox(width: 5.w,),
                    Contentmedium(subtitle: 'Version 1.0.0', colors: theme.primary,weight: FontWeight.w600,),
                      ],
                    ),
                    Contentmedium(subtitle: 'Designed & Managed By Zelle Solutions', colors: theme.primary,weight: FontWeight.w600,),
                    // Text('Designed & Managed By Zelle Solutions',style: GoogleFonts.poppins(
                    //               textStyle: TextStyle(
                    //                   fontSize: 10.sp,
                    //                   fontWeight: FontWeight.w600,
                    //                   color: theme.primary,
                    //                   height: 1.2),
                    //             ),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
