import 'package:dmechat/core/constants.dart';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= kMobileWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < kTabletWidth &&
      MediaQuery.of(context).size.width >= kMobileWidth;

  static bool isLaptop(BuildContext context) =>
      MediaQuery.of(context).size.width > kLaptopWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= kLaptopWidth) {
          return desktop;
        } else if (constraints.maxWidth > kMobileWidth) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
