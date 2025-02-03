import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testapp/utils/mainheader.dart';
import 'package:testapp/widgets/allorders/body.dart';
import 'package:testapp/widgets/allorders/head.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
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
          children: const [
            ////// header widget
            // Head(),
            MainPageHeader(),
            ///// body section
            BodySection(),
          ],
        ),
      ),
    );
  }
}
