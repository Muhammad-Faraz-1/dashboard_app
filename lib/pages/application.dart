import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/pages/allorders.dart';
import 'package:testapp/pages/catpage.dart';
import 'package:testapp/pages/landingpage.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/navbar.dart';

class Application_Page extends StatelessWidget {
  const Application_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
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
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: provider.currentpage == 1
                    ? Landingpage()
                    : provider.currentpage == 2
                        ? OrdersPage()
                        : provider.currentpage == 3
                            ? Categories_Page()
                            : Landingpage(),
              ),
            ),
            Positioned(bottom: 10, left: 10, child: Navbar()),
          ],
        ),
      ),
    );
  }
}
