import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/app/modules/home/views/home_view.dart';
import 'package:netflix_clone/app/widgets/bottom_nav_bar.dart';
import 'package:page_transition/page_transition.dart';
import '../controllers/splash_screens_controller.dart';

class SplashScreensView extends GetView<SplashScreensController> {
  const SplashScreensView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: BottomNavBar(),
          ),
        );
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/netflix.json'),
            ],
          ),
        ),
      ),
    );
  }
}
