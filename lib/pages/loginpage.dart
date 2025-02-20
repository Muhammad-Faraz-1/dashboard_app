// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: Container(
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
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                theme.primary.withOpacity(0.6),
                theme.primary.withOpacity(0.3),
                theme.primary.withOpacity(0.6),
              ])),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50.h,
                          width: 140.w,
                          child: Image.asset('assets/fm-logo.png'),
                        ),
                        SizedBox(
                          height: 38.h,
                          width: 38.w,
                          child: Image.asset('assets/country-flag.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 110.h,
                    ),
                    ////////////////////////////////////////////////
                    ////////////////////////////////////////////////
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Pageheading(subtitle: 'Sign In'),
                        SizedBox(
                          height: 10.h,
                        ),
                        fieldwithlabel(
                          hint: 'Username',
                          icon: Icons.check_circle_outline,
                          val: 0,
                        ),
                        passfieldwithlabel(
                          hint: 'Password',
                          icon: Icons.remove_red_eye_sharp,
                          obs: true, val: 1,
                        ),
                        Row(
                          children: [
                            CustomCheckbox(),
                            SizedBox(
                              width: 5.w,
                            ),
                            Contentmedium(
                                subtitle: 'Remember me', colors: theme.primary)
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.chckval(1);
                            Navigator.pushNamed(context, '/second');
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
                                  Text(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: theme.primary,
                                          height: 1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ///////////////////////////////////////
                    SizedBox(
                      height: 160.h,
                    ),
                    ////////////////////////////////////////////////
                    ////////////////////////////////////////////////
                    Column(
                      children: [
                        SizedBox(
                          height: 80.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 15.h,
                              width: 15.w,
                              child: Image.asset('assets/halflogo.png'),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Contentmedium(
                              subtitle: 'Version 1.0.0',
                              colors: theme.primary,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                        Contentmedium(
                          subtitle: 'Designed & Managed By Zelle Solutions',
                          colors: theme.primary,
                          weight: FontWeight.w600,
                        ),
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
        ),
      ),
    );
  }
}

class passfieldwithlabel extends StatelessWidget {
  IconData? icon;
  String? hint;
  bool? obs;
  int? val;
  passfieldwithlabel(
      {super.key, required this.hint, required this.icon, required this.obs,required this.val});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Provider1>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              textAlignVertical: TextAlignVertical.center,
              obscureText: provider.obs,
              cursorColor: theme.tertiary,
              style: GoogleFonts.poppins(
                  decoration: TextDecoration.none,
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: theme.tertiary,
                      height: 1.5)),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 7.h),
                fillColor: Colors.transparent,
                border:InputBorder.none,
                // border: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.red, width: 3)),
                suffixIcon: val == 1
                    ? GestureDetector(
                      onTap: () {
                        provider.obstate();
                      },
                      child: Icon(
                          Icons.remove_red_eye_sharp,
                          color: theme.primary,
                        ),
                    )
                    : null,
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: theme.tertiary.withOpacity(0.5),
                      height: 1.5),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}

///////////////////////////////////
class fieldwithlabel extends StatelessWidget {
  IconData? icon;
  String? hint;
  // bool? obs;
  int? val;
  fieldwithlabel(
      {super.key, required this.hint, required this.icon,required this.val});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Provider1>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              textAlignVertical: TextAlignVertical.center,
              // obscureText: provider.obs,
              cursorColor: theme.tertiary,
              style: GoogleFonts.poppins(
                  decoration: TextDecoration.none,
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: theme.tertiary,
                      height: 1.5)),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 7.h),
                fillColor: Colors.transparent,
                border:InputBorder.none,
                // border: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.red, width: 3)),
                suffixIcon: val == 1
                    ? GestureDetector(
                      onTap: () {
                        provider.obstate();
                      },
                      child: Icon(
                          Icons.remove_red_eye_sharp,
                          color: theme.primary,
                        ),
                    )
                    : null,
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: theme.tertiary.withOpacity(0.5),
                      height: 1.5),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
///

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      child: Container(
        height: 10.h,
        width: 10.w,
        decoration: BoxDecoration(
            color: theme.primary, border: Border.all(color: theme.onTertiary)),
      ),
    );
  }
}
