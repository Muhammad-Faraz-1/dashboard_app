import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/utils/textwidgets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            // height: 400.h,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: theme.onTertiary, width: 1),
                gradient: LinearGradient(colors: [
                  theme.primary.withOpacity(0.6),
                  theme.primary.withOpacity(0.3),
                  theme.primary.withOpacity(0.5)
                ]),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: Offset.zero),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 180.h,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    'assets/product2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Contentmedium(subtitle: 'Bedroom', colors: theme.tertiary),
                    Container(
                      height: 22.h,
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'In stock',
                          style: GoogleFonts.poppins(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  'Lumina Bedroom Set',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: theme.secondary,
                          height: 1.1)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ///////////////////////////////////////
                Text(
                  'SKU: 1635242',
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.tertiary,
                    height: 1.2,
                  ),
                ),
                Text(
                  'Queen Bed, Dresser and Mirror in Gray',
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.tertiary,
                    height: 1.2,
                  ),
                ),
                //////////////////////////////
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: theme.tertiary,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: theme.onSecondaryContainer, width: 1),
                              borderRadius: BorderRadius.circular(2)),
                          padding: EdgeInsets.all(1),
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(2)),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: theme.tertiary,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 22.h,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                theme.onSecondary,
                                theme.secondaryContainer
                              ]),
                              borderRadius: BorderRadius.circular(4)),
                          child: Contentmedium(
                              subtitle: 'King Size', colors: theme.primary),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 22.h,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: theme.primary, width: 1),
                              gradient: LinearGradient(colors: [
                                theme.primary.withOpacity(0.6),
                                theme.primary.withOpacity(0.3),
                                theme.primary.withOpacity(0.6),
                              ]),
                              borderRadius: BorderRadius.circular(4)),
                          child: Contentmedium(
                              subtitle: 'Queen Size', colors: theme.secondary),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 22.h,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: theme.primary, width: 1),
                              gradient: LinearGradient(colors: [
                                theme.primary.withOpacity(0.6),
                                theme.primary.withOpacity(0.3),
                                theme.primary.withOpacity(0.6),
                              ]),
                              borderRadius: BorderRadius.circular(4)),
                          child: Contentmedium(
                              subtitle: 'Twin Size', colors: theme.secondary),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: theme.tertiary,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      // spacing: ,
                      runSpacing: 5,
                      children: [
                        Container(
                          height: 22.h,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                theme.onSecondary,
                                theme.secondaryContainer
                              ]),
                              borderRadius: BorderRadius.circular(4)),
                          child: Contentmedium(
                              subtitle: 'Bed and Mirror',
                              colors: theme.primary),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 22.h,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: theme.primary, width: 1),
                              gradient: LinearGradient(colors: [
                                theme.primary.withOpacity(0.6),
                                theme.primary.withOpacity(0.3),
                                theme.primary.withOpacity(0.6),
                              ]),
                              borderRadius: BorderRadius.circular(4)),
                          child: Contentmedium(
                              subtitle: 'Bed, Dresser and Mirror ',
                              colors: theme.secondary),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 22.h,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: theme.primary, width: 1),
                              gradient: LinearGradient(colors: [
                                theme.primary.withOpacity(0.6),
                                theme.primary.withOpacity(0.3),
                                theme.primary.withOpacity(0.6),
                              ]),
                              borderRadius: BorderRadius.circular(4)),
                          child: Contentmedium(
                              subtitle: 'Bed, Dresser, Mirror and Nightstand',
                              colors: theme.secondary),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
// ////////////////////////////////
          SizedBox(
            height: 10.h,
          ),
// ///////////////////////////////
          Container(
            // height: 400.h,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: theme.onTertiary, width: 1),
                gradient: LinearGradient(colors: [
                  theme.primary.withOpacity(0.6),
                  theme.primary.withOpacity(0.3),
                  theme.primary.withOpacity(0.5)
                ]),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: Offset.zero),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: theme.secondary,
                      fontSize: 15.sp,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ExpandableText(
                    text:
                        'Upgrade your bedroom with the Sullivan Bedroom Set, a perfect blend of style, functionality, and timeless design. Finished in a warm drift gray tone with clean, modern lines, this set effortlessly complements a wide range of bedroom decor styles, making it a versatile and inviting choice for any home.'),
                SizedBox(height: 10.h,),
                
                Text(
                  'Dimensions',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: theme.secondary,
                      fontSize: 15.sp,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                ExpandableText(
                    text:
                        'Upgrade your bedroom with the Sullivan Bedroom Set, a perfect blend of style, functionality, and timeless design. Finished in a warm drift gray tone with clean, modern lines, this set effortlessly complements a wide range of bedroom decor styles, making it a versatile and inviting choice for any home.')
              ],
            ),
          )
        ],
      ),
    );
  }
}

////////////////////////////////////

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandableText({required this.text, this.maxLines = 3, Key? key})
      : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
              text: widget.text, style: TextStyle(color: Colors.black)),
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflowing = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: theme.tertiary,
                    fontSize: 10.sp,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                    // fontWeight: weight==null?FontWeight.w500:weight,
                  ),
                ),
                children: [
                  TextSpan(
                    text: _isExpanded
                        ? widget.text
                        : widget.text
                            .substring(0, textPainter.width.toInt() - 50),
                  ),
                  if (isOverflowing || _isExpanded)
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? ' See Less' : ' See More',
                          style: TextStyle(
                            color: theme.secondaryContainer,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
