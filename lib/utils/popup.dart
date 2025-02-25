// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:testapp/widgets/orderlist/orderstatuspopup.dart';
import 'package:testapp/widgets/reviews/reviewspopupcontent.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    // final theme = Theme.of(context).colorScheme;
    return Dialog(
      insetPadding: EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      child:provider.currentpage==4? ReviewPopupContent():Orderstatuspopup(),
    );
  }
}


