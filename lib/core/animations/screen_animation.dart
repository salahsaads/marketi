import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

Widget animationFadeInLeft(int delay, Widget child) {
  return FadeInLeft(
    delay: Duration(milliseconds: delay),
    curve: Curves.bounceIn,
    child: child,
  );
}

Widget animationFadeInDown(int delay, Widget child) {
  return FadeInDown(
    delay: Duration(milliseconds: delay),
    curve: Curves.bounceIn,
    child: child,
  );
}

Widget animationFadeInRight(int delay, Widget child) {
  return FadeInLeft(
    delay: Duration(milliseconds: delay),
    curve: Curves.bounceIn,
    child: child,
  );
}

Widget animationFadeInUp(int delay, Widget child) {
  return FadeInDown(
    delay: Duration(milliseconds: delay),
    curve: Curves.bounceIn,
    child: child,
  );
}
