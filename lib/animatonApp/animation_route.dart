

// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SliderRight extends PageRouteBuilder{

  final Page;
  SliderRight(this.Page) : super(
    pageBuilder: (context, animation, secondaryAnimation) => Page,
    // في حاله ان لا يوجد اي انيمشين
    // transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child)
    {
      // * - من اليمين  الي اليسار
      // var begin=const Offset(1.0, 0.0);
      // * - من اليسار   الي اليمين
      // var begin=const Offset(-1.0, 0.0);

      // * - من اسفل   الي اعلي
      // var begin=const Offset(0.0, 1.0);
      // * - من اعلي  الي اسفل
      // var begin=const Offset(0.0, -1.0);
      //
      var begin=const Offset(0.0, 1.0);
      var end= Offset.zero;

      var tween=Tween(begin:begin ,end: end);
      var offsetAnimation=animation.drive(tween);
      return SlideTransition(position: offsetAnimation,child: child,);
    },
  );

}


class ScalRight extends PageRouteBuilder{

  final Page;
  ScalRight(this.Page) : super(
    pageBuilder: (context, animation, secondaryAnimation) => Page,
    // في حاله ان لا يوجد اي انيمشين
    // transitionsBuilder: (context, animation, secondaryAnimation, child) => child,


    transitionsBuilder: (context, animation, secondaryAnimation, child)
    {
      var begin=0.0;
      var end= 1.0;
      var tween=Tween(begin:begin ,end: end);
      var curvedAnimation=CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
      return ScaleTransition(scale: tween.animate(curvedAnimation),child: child,);
    },
  );

}