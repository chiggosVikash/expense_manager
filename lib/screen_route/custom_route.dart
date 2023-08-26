import 'package:flutter/widgets.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget page;
  final Offset offset;

  CustomRoute({required this.page, required this.offset})
      : super(
    reverseTransitionDuration: const Duration(milliseconds: 600),
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: ((context, animation, secondaryAnimation) {
      final begin = offset;
      const end = Offset.zero;
      var tween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: Curves.easeIn));
      return SlideTransition(
          position: animation.drive(tween), child: page);
    }),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = offset;
      const end = Offset(0, 0);
      const curve = Curves.easeInOutSine;
      var tween =
      Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
