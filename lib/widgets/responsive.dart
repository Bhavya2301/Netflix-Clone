import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;

  const Responsive({
    Key? key,
    required this.mobile,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return mobile;
      },
    );
  }
}
