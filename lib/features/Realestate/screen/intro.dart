import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';

import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/utils/Navigation/navigation.dart';
import '../../../main.dart';
import 'realestate_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.1),
                    child: SizedBox(
                      height: screenHeight * 0.6,
                      width: screenWidth,
                      child: Image.asset(
                        "assets/images/intro.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.01,
                  right: screenWidth * 0.3,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Row(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.14,
                          width: screenWidth * 0.09,
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.black, Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: Text(
                            "Real Estate",
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Discover dream house from smartphone",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "The No. 1 App for searching and finding the most suitable house with you.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                h: screenHeight * 0.06,
                radius: screenWidth * 0.02,
                text: "Continue",
                textStyle: TextStyle(
                    fontSize: screenWidth * 0.04, color: AppColors.white),
                onPressed: () {
                  Navigation.pushAndRemoveUntil(const RealestateScreen());
                  prefs!.setString("isFirst", "yes");
                },
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Developed by Mustafa Ghazlan",
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
