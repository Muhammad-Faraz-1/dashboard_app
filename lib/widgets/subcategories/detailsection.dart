// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class ProductDetails extends StatelessWidget {
  int vspace = 5;
  bool isvariable = false;
  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;
    final product = apicat.selectedproduct;
    // final bool isvariable = product!.variation.length == 0 ? false : true;
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: SizedBox(
        height: 575.h,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                // height: 400.h,
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: theme.onTertiary, width: 1),
                    gradient: LinearGradient(colors: [
                      theme.primary.withOpacity(0.6),
                      theme.primary.withOpacity(0.3),
                      theme.primary.withOpacity(0.5)
                    ]),
                    borderRadius: BorderRadius.circular(10).r,
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
                    ////////////// product image container
                    Container(
                      width: double.infinity,
                      height: 180.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10).r),
                      child: Image.network(
                        '${apicat.urlBaseZelle}${product!.images[0].imageUrl}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: vspace.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /////////////// product category
                        Contentmedium(
                            subtitle: product.categories[1].name,
                            colors: theme.tertiary),
                        ////////////////// product stock status
                        Container(
                          height: 22.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.sp, vertical: 5.sp),
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              product.manageStock.stockStatus,
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    //////////////// product name
                    Text(
                      product.name,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: theme.secondary,
                              height: 1.1)),
                    ),
                    SizedBox(height: vspace.h),
                    ///////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sku: ${product.sku}',
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: theme.tertiary,
                                height: 1.2,
                              ),
                            ),
                            Text(
                              'Package: ${product.categories[1].name}',
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: theme.tertiary,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //////////// regular/canceled price
                            Text(
                              '\$${product.regularPrice}',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: theme.tertiary,
                                      fontSize: 12.sp,
                                      height: 1.25,
                                      fontWeight: FontWeight.w500,
                                      color: theme.tertiary)),
                            ),
                            ///////// sale price
                            Text(
                              '\$${product.salePrice}',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 15.sp,
                                      height: 1.2,
                                      fontWeight: FontWeight.w600,
                                      color: theme.tertiary)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //////////////////////////////
                    SizedBox(height: vspace.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        cost(
                            subtitle: product.attributes[0].name,
                            colors: theme.tertiary,
                            weight: FontWeight.w500,
                            fontSize: 10,
                            height: 1.2),
                        SizedBox(height: 5.h),
                        SizedBox(
                          height: 22.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.attributes[0].options.length,
                            itemBuilder: (BuildContext context, int index) {
                              return product.attributes[0].type == 'color'
                                  ? color_attribute(
                                      id: product
                                          .attributes[index].options[index].name,
                                      color: Color(
                                        int.parse(
                                          '0xff${product.attributes[index].options[index].value.substring(1, 7)}',
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      child: package_attribute(
                                          id: product
                                              .attributes[0].options[index].name,
                                          title: product.attributes[0]
                                              .options[index].name),
                                    );
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: vspace.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        cost(
                            subtitle: product.attributes[1].name,
                            colors: theme.tertiary,
                            weight: FontWeight.w500,
                            fontSize: 10,
                            height: 1.2),
                        SizedBox(height: 5.h),
                        SizedBox(
                          height: 22.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.attributes[1].options.length,
                            itemBuilder: (BuildContext context, int index) {
                              return product.attributes[1].type == 'color'
                                  ? color_attribute(
                                      id: product
                                          .attributes[1].options[index].name,
                                      color: Color(
                                        int.parse(
                                          '0xff${product.attributes[1].options[index].value.substring(1, 7)}',
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      child: package_attribute(
                                          id: product
                                              .attributes[1].options[index].name,
                                          title: product.attributes[1]
                                              .options[index].name),
                                    );
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // ////////////////////////////////
              SizedBox(height: 10.h),
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
                    SizedBox(height: 5.h),
                    ExpandableText(text: product.description),
                    // SizedBox(height: 10.h),
                    // Text(
                    //   'Dimensions',
                    //   style: GoogleFonts.poppins(
                    //     textStyle: TextStyle(
                    //       color: theme.secondary,
                    //       fontSize: 15.sp,
                    //       height: 1.2,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 5.h),
                    // HtmlElementView(viewType: product.weightDimention)
                    // ExpandableText(
                    //     text:
                    //         product.weightDimention)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////

class size_attribute extends StatelessWidget {
  int? id;
  String? title;
  size_attribute({super.key, this.id, this.title});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        provider.change_size(id!);
      },
      child: IntrinsicWidth(
        child: Container(
          height: 22.h,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: provider.selected_size == id
                    ? [theme.onSecondary, theme.secondaryContainer]
                    : [
                        theme.primary.withOpacity(0.6),
                        theme.primary.withOpacity(0.3),
                        theme.primary.withOpacity(0.6),
                      ],
              ),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: provider.selected_size != id
                      ? theme.primary
                      : Colors.transparent)),
          child: Contentmedium(
            subtitle: title,
            colors:
                provider.selected_size == id ? theme.primary : theme.tertiary,
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////
class package_attribute extends StatelessWidget {
  String? id;
  String? title;
  package_attribute({super.key, this.id, this.title,});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;
    print(id);
    return GestureDetector(
      onTap: () {
        // provider.change_package(id!);
        apicat.changepackage(id!);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 5.sp),
        child: Container(
          height: 22.h,
          // width: 100.w,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: apicat.defaultpackage == id
                    ? [theme.onSecondary, theme.secondaryContainer]
                    : [
                        theme.primary.withOpacity(0.6),
                        theme.primary.withOpacity(0.3),
                        theme.primary.withOpacity(0.6),
                      ],
              ),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color:
                      apicat.defaultpackage != id ? theme.primary : Colors.transparent)),
          // child: Text("abc",style: TextStyle(
          //   fontSize: 12,
          //   color: Colors.white
          // ),),
          child: Contentmedium(
            subtitle: title,
            colors: apicat.defaultpackage == id ? theme.primary : theme.tertiary,
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////
class color_attribute extends StatelessWidget {
  Color? color;
  String? id;
  color_attribute({super.key, this.color, required this.id,});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        apicat.changecolor(id!);
      },
      child: Container(
        // height: 22.h,
        width: 22.w,
        decoration: BoxDecoration(
            border: Border.all(
                color: apicat.defaultcolor == id
                    ? theme.onSecondaryContainer
                    : Colors.transparent,
                width: 1),
            borderRadius: BorderRadius.circular(2)),
        padding: EdgeInsets.all(1),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////

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
                        : widget.text.substring(0, 250),
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
                            fontSize: 10.sp,
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
