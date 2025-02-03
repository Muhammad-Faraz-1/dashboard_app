import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Container(
          height: 60.h,
          width: 340.w,
          padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 20.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                  theme.primary.withOpacity(0.6),
                  theme.primary.withOpacity(0.3),
                  theme.primary.withOpacity(0.6),
                ]),),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  provider.changepage(1);
                },
                child: Container(
                  height: 44.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    // border: Border(
                    //   bottom: BorderSide(color: Colors.black, width: 2),
                    // ),
                  ),
                  child: Center(
                      child: Image.asset(
                    provider.currentpage == 1
                        ? 'assets/home-fill.png'
                        : 'assets/home-line.png',
                    color: provider.currentpage == 1
                        ? theme.onSecondary
                        : theme.secondary,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  provider.changepage(2);
                },
                child: Container(
                  height: 44.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    // border:
                    //     Border(bottom: BorderSide(color: Colors.red, width: 2))
                  ),
                  child: Center(
                      child: Image.asset(
                    provider.currentpage == 2
                        ? 'assets/box-fill.png'
                        : 'assets/box-line.png',
                    color: provider.currentpage == 2
                        ? theme.onSecondary
                        : theme.secondary,
                    height: 30,
                    width: 30,
                    fit: BoxFit.contain,
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  provider.changepage(3);
                },
                child: Container(
                  height: 44.h,
                  width: 44.w,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(4),
                  //     border:
                  //         Border(bottom: BorderSide(color: Colors.red, width: 2))),
                  child: Center(
                      child: Image.asset(
                    provider.currentpage == 3
                        ? 'assets/cat-fill.png'
                        : 'assets/cat-line.png',
                    color: provider.currentpage == 3
                        ? theme.onSecondary
                        : theme.secondary,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  provider.changepage(4);
                },
                child: Container(
                  height: 44.h,
                  width: 44.w,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(4),
                  //     border:
                  //         Border(bottom: BorderSide(color: Colors.red, width: 2))),
                  child: Center(
                      child: Image.asset(
                    provider.currentpage == 1
                        ? 'assets/setting-fill.png'
                        : 'assets/setting-line.png',
                    color: provider.currentpage == 4
                        ? theme.onSecondary
                        : theme.secondary,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  )),
                ),
              )
            ],
          ),
        ),
        Activeline(),
      ],
    );
  }
}

class Activeline extends StatelessWidget {
  const Activeline({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    return AnimatedPositioned(
      duration: Duration(seconds: 1),
      left: provider.navpos.w,
      // left: 20.w,
      bottom: 0.h,
      child: Container(
        height: 5.h,
        width: 44.w,
        decoration: BoxDecoration(
          color: Color(0xff6F75EB),
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(
            width: 4.w,
            color: Color(0xff6F75EB),
          ),
        ),
      ),
    );
  }
}
