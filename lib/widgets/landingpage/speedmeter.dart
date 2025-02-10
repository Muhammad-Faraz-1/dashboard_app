// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:testapp/glowcircle.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'dart:ui';

import 'package:testapp/utils/textwidgets.dart';
// import 'package:testapp/widgets/landingpage/glowcontainer.dart';

// class SpeedoMeter extends StatefulWidget {
//   const SpeedoMeter({super.key});

//   @override
//   State<SpeedoMeter> createState() => _SpeedoMeterState();
// }

// class _SpeedoMeterState extends State<SpeedoMeter> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).colorScheme;
//     return Container(
//       height: 350,
//       width: 155,
//       // padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: [
//           theme.primary.withOpacity(0.6),
//           theme.primary.withOpacity(0.3),
//           theme.primary.withOpacity(0.6),
//         ]),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: theme.shadow,
//             blurRadius: 4,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           SfRadialGauge(
//             enableLoadingAnimation: true,
//             animationDuration: 3500,
//             axes: <RadialAxis>[
//               RadialAxis(
//                   axisLineStyle: const AxisLineStyle(
//                       thicknessUnit: GaugeSizeUnit.factor, thickness: 0.15),
//                   radiusFactor: 0.9,
//                   showTicks: false,
//                   showLastLabel: true,
//                   maximum: 100,
//                   axisLabelStyle: const GaugeTextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   pointers: <GaugePointer>[
//                     NeedlePointer(value: 90)
//                   ],
//                   annotations: <GaugeAnnotation>[
//                     GaugeAnnotation(
//                         widget: Container(
//                             child: Text('90.0',
//                                 style: TextStyle(
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold))),
//                         angle: 90,
//                         positionFactor: 0.5)
//                   ])
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//////////////////////////////////////
///
class speedometer2 extends StatelessWidget {
  const speedometer2({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return Container(
      // height: 180.h,
      width: 165.w,
      padding: EdgeInsets.fromLTRB(10.sp, 10.sp, 10.sp, 0.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          theme.primary.withOpacity(0.6),
          theme.primary.withOpacity(0.3),
          theme.primary.withOpacity(0.6),
        ]),
        borderRadius: BorderRadius.circular(10).r,
        boxShadow: [
          BoxShadow(
            color: theme.shadow.withOpacity(0.15),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sectionheading(subtitle: 'Website Performance'),
          SectionSubheading(
            subtitle: 'Web Performance ',
            weight: FontWeight.w600,
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 150.h,
            child: SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 6,
                    color: theme.primary, // Customize the axis line color
                  ),
                  majorTickStyle: MajorTickStyle(
                    length: 10.h, // Length of major ticks
                    thickness: 2, // Thickness of major ticks
                    color: theme.primary, // Color of major ticks
                  ),
                  minorTickStyle: MinorTickStyle(
                    length: 5.h, // Length of minor ticks
                    thickness: 1, // Thickness of minor ticks
                    color: theme.primary, // Color of minor ticks
                  ),
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 100,
                      startWidth: 7,
                      endWidth: 7,
                      color: theme.secondaryContainer,
                      labelStyle: GaugeTextStyle(
                        color: theme.primary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                        enableAnimation: provider.chck == 1 ? true : false,
                        gradient: LinearGradient(
                            colors: [
                              theme.onSecondary,
                              theme.secondaryContainer,
                            ],
                            stops: <double>[
                              0.25,
                              0.75
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                        animationType: AnimationType.linear,
                        value: 90,
                        animationDuration: 3000,
                        needleStartWidth: 2,
                        needleEndWidth: 4,
                        needleLength: 0.7,
                        knobStyle: KnobStyle(
                          knobRadius: 0,
                        )),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                          child: provider.chck == 1
                              ? AcceleratingCounter1(
                                  targetNumber: 90,
                                  color: theme.primary,
                                  percent: true,
                                )
                              : RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                            text: '90',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  color: theme.primary),
                            ),
                            children: [
                              TextSpan(
                                text: '\%',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primary),
                                ),
                              )
                            ]),
                      )
                        ),
                        angle: 90,
                        positionFactor: 0.5)
                  ])
            ]),
          ),
        ],
      ),
    );
  }
}

///
///
///
class secruity extends StatelessWidget {
  const secruity({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return Container(
      // height: 180.h,
      width: 165.w,
      padding: EdgeInsets.fromLTRB(10.sp, 10.sp, 10.sp, 0.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          theme.primary.withOpacity(0.6),
          theme.primary.withOpacity(0.3),
          theme.primary.withOpacity(0.6),
        ]),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadow.withOpacity(0.15),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: SectionSubheading(
              subtitle: 'Web Security',
              weight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 150.h,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                // GlowingCircle(size: 200, color: Color(0xff43CC5C),),
                // GlowingImage(),
                // SizedBox(
                //     height: 130.h,
                //     width: 120.w,
                //     child: Image.asset(
                //       'assets/sheild.png',
                //       fit: BoxFit.cover,
                //     )),
                    SizedBox(
                    height: 130.h,
                    width: 120.w,
                    child: Image.asset(
                      'assets/w1.png',
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                    height: 130.h,
                    width: 120.w,
                    child: Image.asset(
                      'assets/g2.png',
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                    height: 120.h,
                    width: 110.w,
                    child: Image.asset(
                      'assets/w1.png',
                      fit: BoxFit.cover,
                    )),
                provider.chck == 1
                    ? AcceleratingCounter1(
                        targetNumber: 86,
                        color: Colors.green,
                        percent: true,
                      )
                    : RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                            text: '86',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff43CC5C)),
                            ),
                            children: [
                              TextSpan(
                                text: '\%',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff43CC5C)),
                                ),
                              )
                            ]),
                      )
                // :Text(
                //   '86%',
                //   style: GoogleFonts.poppins(
                //     textStyle: TextStyle(
                //         fontSize: 22.sp,
                //         fontWeight: FontWeight.w600,
                //         color: Color(0xff43CC5C)),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AcceleratingCounter1 extends StatelessWidget {
  final int? targetNumber; // The final number to reach
  Color? color;
  bool? percent;
  AcceleratingCounter1(
      {super.key,
      required this.targetNumber,
      required this.color,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: targetNumber),
      duration: const Duration(milliseconds: 1000), // Adjust duration as needed
      curve: Curves.decelerate, // Simulates acceleration
      builder: (context, value, child) {
        return RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
              text: percent == true ? '$value' : value.toString(),
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: color),
              ),
              children: [
                TextSpan(
                  text: '\%',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: color),
                  ),
                )
              ]),
        );
      },
    );
  }
}
