import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/widgets/orderdetails/addons.dart';
import 'package:testapp/widgets/orderdetails/customerinfo.dart';
import 'package:testapp/widgets/orderdetails/headorderdetails.dart';
import 'package:testapp/widgets/orderdetails/paymentdetails.dart';
import 'package:testapp/widgets/orderdetails/productslist.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
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
                    Headerdetails(),
                    provider.filter == 1
                        ? CustomerDetails()
                        : provider.filter == 2
                            ? ListofProducts()
                            : provider.filter == 3
                                ? Add_On()
                                : Payment_Details(),
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
