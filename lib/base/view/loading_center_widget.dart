import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_architecture/generated/assets.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;

  final double? height;

  const LoadingWidget({super.key, this.width = 40, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child:
      Lottie.asset(
        Assets.baseLoadingJsonData,
        height: 44.w,
        width: 44.w,
        alignment: Alignment.center,
      ));
  }
}

class LoadingCenterWidget extends StatelessWidget {
  final double? width;
  final double? height;
  static int showCount = 0;
  const LoadingCenterWidget({super.key, this.width = 40, this.height = 20});

  static show() async{
    showCount++;
    await Get.dialog(const LoadingCenterWidget());
    showCount--;
  }

  static cancel() {
    if(showCount > 0) {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingWidget(
        width: width,
        height: height,
      ),
    );
  }
}
