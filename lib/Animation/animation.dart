 import 'package:flutter/material.dart';

class SliderRight extends PageRouteBuilder {
  final Page;
  SliderRight({this.Page})
      : super(
          pageBuilder: (context, animation, animationtwo) => Page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = .5;
            final tween = Tween(begin: begin, end: end);
           // ignore: unused_local_variable
           final  offsetAnimation = animation.drive(tween);
             

            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
        );
}


// class Scale extends PageRouteBuilder {
//   final Page;
//   Scale({this.Page})
//       : super(
//           pageBuilder: (context, animation, animationtwo) => Page,
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             const begin = 0.0;
//             const end = 1.0;
//             final tween = Tween(begin: begin, end: end);
//            final  offsetAnimation = animation.drive(tween);
             

//             var CurvesAnimation =
//                 CurvedAnimation(parent: animation, curve: Curves);

//             return RotationTransition(turns: tween.animate(CurvesAnimation),child:child ,);
//           },
//         );
// }



class Slider1  extends PageRouteBuilder {
  final Page;
  Slider1 ({this.Page})
      : super(
          pageBuilder: (context, animation, animationtwo) => Page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
             const begin = Offset(1, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
           final  offsetAnimation = animation.drive(tween);
             

            return SlideTransition(
    position: offsetAnimation,
    child: child,
  );

          },
        );
}



 