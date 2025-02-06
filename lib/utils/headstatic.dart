import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';

class Static_Header extends StatelessWidget {
  const Static_Header({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/third');
                provider.changeval();
              },
              child: Container(
                height: 34.h,
                width: 34.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4).r,
                    gradient: LinearGradient(colors: [
                      theme.primary.withOpacity(0.6),
                      theme.primary.withOpacity(0.3),
                      theme.primary.withOpacity(0.6),
                    ])),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/drawer.svg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Pageheading(
                  subtitle: "Furniture Mecca",
                )),
          ],
        ),
        //////////////////////
        SizedBox(
          width: 65.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 24.h,
                width: 24.w,
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    color: theme.primary,
                  ),
                ),
              ),
              Container(
                height: 34.h,
                width: 34.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.onTertiary)),
                child: Center(child: Image.asset('assets/profile.png')),
              ),
            ],
          ),
        ),
        //////////////////////////
      ],
    );
  }
}
