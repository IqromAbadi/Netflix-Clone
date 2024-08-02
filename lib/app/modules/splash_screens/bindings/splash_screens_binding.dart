import 'package:get/get.dart';

import '../controllers/splash_screens_controller.dart';

class SplashScreensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreensController>(
      () => SplashScreensController(),
    );
  }
}
