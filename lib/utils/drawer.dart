import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
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
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 85.h,
              width: 180.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(colors: [
                    theme.primary.withOpacity(0.6),
                    theme.primary.withOpacity(0.3),
                    theme.primary.withOpacity(0.6),
                  ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                      radius: 70,
                    ),
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cost(
                          subtitle: 'Abdul Sami',
                          colors: Colors.white,
                          weight: FontWeight.w500,
                          fontSize: 15,
                          height: 1.2),
                      cost(
                          subtitle: 'Manager',
                          colors: Colors.white,
                          weight: FontWeight.w400,
                          fontSize: 10,
                          height: 1.2)
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                // scrollDirection: Axis.none,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        cost(
                            subtitle: 'Dashboard',
                            colors: Colors.white,
                            weight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.2)
                      ],
                    ),
                    onTap: () {
                      provider.changepage(1);
                      provider.changeval();
                      // Add your action when the drawer item is pressed
                      // Navigator.pop(context);
                      // provider.changeval();
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.open_in_browser,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        cost(
                            subtitle: 'Orders',
                            colors: Colors.white,
                            weight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.2)
                      ],
                    ),
                    onTap: () {
                      // Add your action when the drawer item is pressed
                      // Navigator.pop(context);
                      provider.changepage(2);
                      provider.changeval();
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.wallet,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        cost(
                            subtitle: 'Categories',
                            colors: Colors.white,
                            weight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.2)
                      ],
                    ),
                    onTap: () {
                      // Add your action when the drawer item is pressed
                      // Navigator.pop(context);
                      provider.changeval();
                      provider.changepage(3);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.reviews,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        cost(
                            subtitle: 'Reviews',
                            colors: Colors.white,
                            weight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.2)
                      ],
                    ),
                    onTap: () {
                      provider.changeval();
                      provider.changepage(4);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.receipt_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        cost(
                            subtitle: 'Reports',
                            colors: Colors.white,
                            weight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.2)
                      ],
                    ),
                    onTap: () {
                      provider.changeval();
                      provider.changepage(4);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        cost(
                            subtitle: 'Settings',
                            colors: Colors.white,
                            weight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.2)
                      ],
                    ),
                    onTap: () {
                      provider.changeval();
                      provider.changepage(4);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        cost(
                            subtitle: 'Notifications',
                            colors: Colors.white,
                            weight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.2)
                      ],
                    ),
                    onTap: () {
                      provider.changeval();
                      provider.changepage(4);
                    },
                  ),
                  SizedBox(
                    height: 110.h,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        cost(
                            subtitle: 'Logout',
                            colors: Colors.white,
                            weight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.2)
                      ],
                    ),
                    onTap: () {
                      provider.changeval();
                      Navigator.pop(context);
                      // provider.changepage(4);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
