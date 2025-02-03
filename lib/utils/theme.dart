import 'package:flutter/material.dart';

class ThemeDataStyle {
  
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      // background: Color(0xFFFFF3D3), //background
      // onBackground: Color(0xff5333BC), //secondary background for login page
      // primary: Color(0xFF5333BC), //sub heading button
      // secondary: Color(0xFFFFFFFF), //secondary text
      // primaryContainer: const Color(0xFFFFE6A3), //box
      // onSecondary: Color(0xFF1F2123), // text
      // tertiary: Color(0xFF009AE2), // same in both modes
      // onTertiary: Color(0xFFFFFFFF),  // same in both modes
      // tertiaryContainer: Color(0xFF5333BC),  // gradient for button
      // onTertiaryContainer: Color(0xFF5333BC),  // gradient for button
      // secondaryContainer: Color(0xFF1F2123),   //2nd gradient
      // onSecondaryContainer: Color(0xFF1F2123),  //2nd gradient
      // onPrimaryContainer: Color(0xFFFFF3D3), // attendance page buttons
      // onPrimary: Color(0xFF5333BC),  // attendance page button icon
      // onSurface:const Color(0xFFFFE6A3),  //leadbox
      // inversePrimary: Color(0xFF1F2123), // same for both 
      // //legends
      // outlineVariant: Color(0xFF1F2123),
      // surfaceVariant: Color(0xFF3D444B),
      // onInverseSurface: Color(0xFF6E7277),
      // onSurfaceVariant: Color(0xFF919599),
      // outline: Color(0xFFABADAF)
      primary: Color(0xffffffff), //white
      secondary: Color(0xff595959), //charcaol
      onSecondary: Color(0xff6f75eb), //blue light
      secondaryContainer: Color(0xff353cbb), // darker blue
      tertiary: Color(0xff757575), //lighter charcoal
      onTertiary: Color(0xfff0f0f0), //border color
      tertiaryContainer: Color(0xff4769FB), //blue lines inside charts
      shadow: Color(0xff000000),
      
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(

      primary: Color(0xffffffff), //white
      secondary: Color(0xff595959), //charcaol
      onSecondary: Color(0xff6f75eb), //blue light
      secondaryContainer: Color(0xff353cbb), // darker blue
      tertiary: Color(0xff7575), //lighter charcoal
      onTertiary: Color(0xfff0f0f0), //border color
      shadow: Color(0xff000000)


      // background: Color(0xFF1F2123), //background
      // onBackground: Color(0xff1f2123), //secondary background for login page
      // primary: Color(0xFF009AE2),  //subheading button
      // secondary: Color(0xFFFFFFFF), //secondary text
      // primaryContainer: Color(0xFF000000),  //box
      // onSecondary: Color(0xFFFFFFFF),  //text
      // tertiary: Color(0xFF009AE2),  //icon same in both modes
      // onTertiary: Color(0xFFFFFFFF),  //text same in both modes
      // tertiaryContainer: Color(0xFF009AE2),  // gradient for button
      // onTertiaryContainer: Color(0xFFB929BE),  // gradient for button
      // secondaryContainer: Color(0xFF009AE2),   //2nd gradient
      // onSecondaryContainer: Color(0xFFB929BE),  //2nd gradient
      // onPrimaryContainer: Color(0xFFB929BE), // attendance page buttons
      // onPrimary: Color(0xFFFFFFFF),  // attendance page button icon
      // onSurface: Color.fromARGB(255, 66, 69, 71),  //leadbox
      // inversePrimary: Color(0xFF1F2123),  //same for both
      // //legends
      // outlineVariant: Color.fromRGBO(13, 81, 139, 1),
      // surfaceVariant: Color.fromRGBO(9, 55, 95, 1),
      // onInverseSurface: Color.fromRGBO(69, 160, 237, 1),
      // onSurfaceVariant: Color.fromRGBO(230, 121, 47, 1),
      // outline: Color.fromARGB(255, 200, 20, 7)
    ),
  );

}