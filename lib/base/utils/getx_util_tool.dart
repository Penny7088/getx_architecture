import 'package:flutter/material.dart';
import 'package:get/get.dart';




configNormalBottomSheet({
  required Widget body,
  Color? barrierColor,
}) {
  return Get.bottomSheet(
    body,
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.6),
    exitBottomSheetDuration: const Duration(milliseconds: 300),
    enterBottomSheetDuration: const Duration(milliseconds: 300),
    isScrollControlled: true,
  );
}

configNormal({
  required Widget body,
}) {
  return Get.dialog(body);
}

/// 跳转到指定界面
Future<T?>? currentToPage<T>({
  required String name,
  Map<String, String>? parameters,
  dynamic arguments,
  Function(Map info)? onChange,
  bool preventDuplicates = true,
}) {
  if (name == "") {
    return null;
  }

  return Get.toNamed(
    name,
    parameters: parameters,
    arguments: arguments,
    preventDuplicates: preventDuplicates,
  );
}

/// 将指定页面添加到当前路由中,并将其他页面pop
/// Navigation.pushNamedAndRemoveUntil()
/// name 新的页面路由
/// predicate
/// Get.until((route) => Get.currentRoute == '/home')`
/// 如果你想保留某个界面不被清除,使用👆.
Future<T?>? currentTo<T>({
  required String name,
  RoutePredicate? predicate,
  dynamic arguments,
  int? id,
  Map<String, String>? parameters,
}) {
  return Get.offAllNamed(name,
      parameters: parameters,
      arguments: arguments,
      id: id,
      predicate: predicate);
}

/// 返回上一界面,再跳转到新界面
/// 这个会有返回动画
/// Navigation.popAndPushNamed()
Future<T?>? currentOffAndToName<T>({
  required String name,
  dynamic arguments,
  int? id,
  dynamic result,
  Map<String, String>? parameters,
}) {
  return Get.offAndToNamed(
    name,
    arguments: arguments,
    parameters: parameters,
  );
}

/// 替换当前界面,并跳转到目标页
/// Navigator.of(context).pushReplacementNamed(name);
Future<T?>? currentOffName<T>({
  required String name,
  Map<String, String>? parameters,
  dynamic arguments,
  int? id,
  bool preventDuplicates = true,
}) {
  return Get.offNamed(
    name,
    arguments: arguments,
    parameters: parameters,
  );
}

// ================= 返回界面 ============== //

// 返回到指定界面
// `Get.until((route) => Get.currentRoute == '/home')`
currentUntil({required String name}) {
  return Get.until((route) => Get.currentRoute == name);
}

/// 返回上一个界面
void currentGoBack({Map? info}) {
  return Get.back(
    result: info,
  );
}

/// 获取界面传值 parameters
Map<String, String?> currentGetParams() {
  return Get.parameters;
}

/// 获取界面传值 arguments
dynamic currentGetArguments() {
  return Get.arguments;
}
