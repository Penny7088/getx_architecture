import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/pages/splash/state.dart';
import 'package:getx_architecture/base/controller/common_controller.dart';

/// FileName controller
///
/// @Author mac
/// @Date 2024/5/29 10:52
///
/// @Description  controller

class SplashController extends CommonController<SplashState> {
  @override
  SplashState createState() {
   return SplashState();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  configUI() {
   isShowBottomBar = false;
   isShowAppBar = false;
   debugPrint('state.runtimeType = ${state.runtimeType}');
   debugPrint('controller = ${this.runtimeType}');
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint('controller = ${controllerTag}');
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<SplashController>(tag: controllerTag);
  }

}