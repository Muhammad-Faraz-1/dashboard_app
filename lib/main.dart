import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testapp/pages/application.dart';
import 'package:testapp/pages/companyid.dart';
import 'package:testapp/pages/loginpage.dart';
import 'package:testapp/pages/orderdetails.dart';
import 'package:testapp/pages/subcatpage.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/statemanager/apidatahandle.dart';
import 'package:testapp/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ThemeMode themeMode = ThemeMode.system;
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // fontSizeFactor: 1.sp,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => Provider1()),
            ChangeNotifierProvider(create: (context) => apiDataHandeling()),
          ],
          child: MaterialApp(
            theme: ThemeDataStyle.light,
            darkTheme: ThemeDataStyle.dark,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            initialRoute: '/',
            routes: {
              '/': (context) => Idpage(),
              '/first': (context) => Loginpage(),
              '/second': (context) => Application_Page(),
              '/third': (context) => OrderDetails(),
              '/fourth': (context) => SubCategoriesPage(),
              
            },
          ),
        );
      },
    );
  }
}

