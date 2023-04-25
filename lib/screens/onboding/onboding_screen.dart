import 'dart:ui';

import 'package:animated_app/screens/onboding/onboding_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';

class OnBodingScreen extends StatefulWidget {
  const OnBodingScreen({super.key});

  @override
  State<OnBodingScreen> createState() => _OnBodingScreenState();
}

class _OnBodingScreenState extends State<OnBodingScreen> {
  OnBodingScreenController onBodingScreenController =
      Get.put(OnBodingScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBodingScreenController>(builder: (bodingController) {
      onBodingScreenController = bodingController;
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              left: 100,
              bottom: 100,
              child: Image.asset(
                "assets/Backgrounds/Spline.png",
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: const SizedBox(),
              ),
            ),
            const RiveAnimation.asset(
              "assets/RiveAssets/shapes.riv",
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: const SizedBox(),
              ),
            ),
            AnimatedPositioned(
              top: bodingController.isShowSignInDialog ? -50 : 0,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              duration: const Duration(milliseconds: 260),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: 260,
                        child: Column(
                          children: const [
                            Text(
                              "Learn design & code",
                              style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                                height: 1.2,
                                color: Color(0xffF88D93),
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 2),
                      AnimatedBtn(
                        btnAnimationController:
                            bodingController.btnAnimationController,
                        press: () {
                          bodingController.onTapBtn(context);
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
