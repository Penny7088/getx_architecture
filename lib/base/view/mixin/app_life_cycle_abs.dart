/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-22 11:11:09
 * @LastEditors: TT
 * @LastEditTime: 2023-07-10 10:46:59
 */

import 'package:flutter/material.dart';

mixin class AppLifeCycleAbs {
  /// app进入前台
  configAppLifeCycleResumed() {}

  /// app在前台但不响应事件，比如电话，touch id等"
  configAppLifeCycleInactive() {}

  /// app进入后台
  configAppLifeCyclePaused() {}

  /// 没有宿主视图但是flutter引擎仍然有效
  configAppLifeCycleDetached() {}

  /// 主题变更事件回调
  configPlatformBrightness() {}

  /// 语言发生改变回调
  configChangeLocales(List<Locale>? locales) {}
}
