import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final apicat = Provider.of<apiDataHandeling>(context);
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage(
                "assets/bg.png",
              ),
              fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.all(8),
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
                    child: const CircleAvatar(
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.sp,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // scrollDirection: Axis.none,
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        // dashboard
                        Container(
                          padding: provider.currentpage == 1
                              ? EdgeInsets.symmetric(
                                  vertical: 15.sp, horizontal: 10.sp)
                              : EdgeInsets.symmetric(
                                  vertical: 15.sp, horizontal: 0.sp),
                          decoration: BoxDecoration(
                              color: provider.currentpage == 1
                                  ? theme.secondaryContainer
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                  provider.currentpage == 1 ? 10 : 0)),
                          child: GestureDetector(
                            onTap: () {
                              provider.changeval();
                              provider.changepage(1);
                              // Add your action when the drawer item is pressed
                              // Navigator.pop(context);
                              // provider.changeval();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
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
                          ),
                        ),
                        // order list
                        GestureDetector(
                          onTap: () {
                            // Add your action when the drawer item is pressed
                            // Navigator.pop(context);
                            apicat.getorderlist();
                            provider.changeval();
                            provider.changepage(2);
                          },
                          child: Container(
                            padding: provider.currentpage == 2
                                ? EdgeInsets.symmetric(
                                    vertical: 15.sp, horizontal: 10.sp)
                                : EdgeInsets.symmetric(
                                    vertical: 15.sp, horizontal: 0.sp),
                            decoration: BoxDecoration(
                                color: provider.currentpage == 2
                                    ? theme.secondaryContainer
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                    provider.currentpage == 2 ? 10 : 0)),
                            child: Row(
                              children: [
                                const Icon(
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
                          ),
                        ),
                        // categories
                        GestureDetector(
                          onTap: () {
                            // Add your action when the drawer item is pressed
                            // Navigator.pop(context);
                            apicat.fetchcategories(context);
                            provider.changeval();
                            provider.changepage(3);
                          },
                          child: Container(
                            padding: provider.currentpage == 3
                                ? EdgeInsets.symmetric(
                                    vertical: 15.sp, horizontal: 10.sp)
                                : EdgeInsets.symmetric(
                                    vertical: 15.sp, horizontal: 0.sp),
                            decoration: BoxDecoration(
                                color: provider.currentpage == 3
                                    ? theme.secondaryContainer
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                    provider.currentpage == 3 ? 10 : 0)),
                            child: Row(
                              children: [
                                const Icon(
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
                          ),
                        ),
                        // Reviews
                        GestureDetector(
                          onTap: () {
                            provider.changeval();
                            provider.changepage(4);
                          },
                          child: Container(
                            padding: provider.currentpage == 4
                                ? EdgeInsets.symmetric(
                                    vertical: 15.sp, horizontal: 10.sp)
                                : EdgeInsets.symmetric(
                                    vertical: 15.sp, horizontal: 0.sp),
                            decoration: BoxDecoration(
                                color: provider.currentpage == 4
                                    ? theme.secondaryContainer
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                    provider.currentpage == 4 ? 10 : 0)),
                            child: Row(
                              children: [
                                const Icon(
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
                          ),
                        ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // Reports
                        GestureDetector(
                          onTap: () {
                            provider.changeval();
                            // provider.changepage(4);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.sp, horizontal: 0.sp),
                            child: Row(
                              children: [
                                const Icon(
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
                          ),
                        ),
                        // Settings
                        GestureDetector(
                          onTap: () {
                            provider.changeval();
                            // provider.changepage(4);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.sp, horizontal: 0.sp),
                            child: Row(
                              children: [
                                const Icon(
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
                          ),
                        ),
                        // Notifications
                        GestureDetector(
                          onTap: () {
                            provider.changeval();
                            provider.changepage(4);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.sp, horizontal: 0.sp),
                            child: Row(
                              children: [
                                const Icon(
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
                          ),
                        ),
                      ],
                    ),

                    // Logout
                    GestureDetector(
                      onTap: () {
                        provider.changeval();
                        Navigator.pop(context);
                        // provider.changepage(4);
                      },
                      child: Row(
                        children: [
                          const Icon(
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
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
