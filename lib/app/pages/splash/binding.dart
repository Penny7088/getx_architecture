import 'package:get/get.dart';

import 'controller.dart';

/// FileName splash_binding
///
/// @Author mac
/// @Date 2024/5/29 10:51
///
/// @Description splash_binding

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}