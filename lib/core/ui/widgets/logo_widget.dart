import 'package:flutter/material.dart';
import '../../constant/app_images/app_images.dart';

class LogoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const LogoWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
        logoPngImage,
        width: width,
        height: height,
          fit: BoxFit.fill,
    ));
  }
}
