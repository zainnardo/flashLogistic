import 'package:flutter/material.dart';

//NOTE: Primary Colors
const Color primaryRed        = Color(0xfff50009);
const Color darkOrange        = Color(0xffe65100);
const Color secondaryRed      = Color(0xffea595b);
const Color primaryOrange     = Color(0xffff9200);
const Color accentOrange      = Color(0xffffab40);
const Color primaryYellow     = Color(0xffffbd24);
const Color secondaryOrange   = Color(0xffffb74d);
const Color secondaryYellow   = Color(0xfffbd16c);
const Color lightOrange       = Color(0xffffd180);
const Color secondaryGreen    = Color(0xffb1dac1);
const Color primaryGreen      = Color(0xff009B4c);
const Color primaryBlue       = Color(0xFF2196F3);
const Color secondaryBlue     = Color(0xffA5E2FF);
const Color primaryGrey       = Color(0xffa1a1a1);
const Color lightGrey         = Color(0xffE0E0E0);
const Color secondaryGrey     = Color(0xffeeeeef);
const Color primaryWhite      = Color(0xffffffff);
const Color shadowBlack       = Color(0x42000000);
const Color secondaryBlack    = Color(0x8A000000);
const Color primaryBlack      = Color(0xff000000);
const Color transparent       = Color(0x00000000);


class Palette { 
  static const MaterialColor primeColor = MaterialColor( 
    0xff413f37, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
    <int, Color>{ 
      50:  Color(0xff3b3932),//10% 
      100: Color(0xff34322c),//20% 
      200: Color(0xff2e2c27),//30% 
      300: Color(0xff272621),//40% 
      400: Color(0xff21201c),//50% 
      500: Color(0xff1a1916),//60% 
      600: Color(0xff131310),//70% 
      700: Color(0xff0d0d0b),//80% 
      800: Color(0xff060605),//90% 
      900: Color(0xff000000),//100% 
    }, 
  ); 
} 



