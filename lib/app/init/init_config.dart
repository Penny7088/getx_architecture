import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../base/utils/light_model.dart';
import 'app_config.dart';

/// FileName init_config
///
/// @Author mac
/// @Date 2024/5/28 20:50
///
/// @Description TODO

configInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initThirdParty();
}

initThirdParty() async {
  await fromPlatform();
  await lightKV.config();
}


fromPlatform() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  AppConfig.version = packageInfo.version;
  AppConfig.appName = packageInfo.appName;
}