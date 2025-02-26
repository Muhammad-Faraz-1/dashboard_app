import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/utils/drawer.dart';
import 'package:testapp/pages/orderlist.dart';
import 'package:testapp/pages/catpage.dart';
import 'package:testapp/pages/landingpage.dart';
import 'package:testapp/pages/reviewspage.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/navbar.dart';

class Application_Page extends StatelessWidget {
  const Application_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final apicat = Provider.of<apiDataHandeling>(context);
    // double? width= MediaQuery.of(context).size.width;
    // double? height= MediaQuery.of(context).size.height;
    // print('width');
    // print(width);
    // print('height');
    // print(height);
    final provider = Provider.of<Provider1>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Stack(
          children: [
            MyDrawer(),
            TweenAnimationBuilder(
              tween: Tween<double>(
                  begin: 0, end: provider.drawerval == true ? 1 : 0),
              duration: Duration(seconds: 1),
              builder: (_, double val, __) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: Stack(
                    children: [
                      MediaQuery(
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
                            child: provider.currentpage == 1
                                ? Landingpage()
                                : provider.currentpage == 2
                                    ? OrdersPage()
                                    : provider.currentpage == 3
                                        ? Categories_Page()
                                        : provider.currentpage == 4
                                            ? Reviewspage()
                                            : Landingpage()),
                      ),
                      Positioned(bottom: 10, left: 10, child: Navbar()),
                      apicat.isloading?
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
                        child: Container(height: double.infinity,
                        width: double.infinity,
                        color: Colors.transparent,
                        ),
                      ):Container(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

      // data:MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),