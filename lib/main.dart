import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:device_frame/device_frame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/init/init_config.dart';
import 'app/init/local/i18_tr.dart';
import 'app/router/app_router.dart';
import 'base/utils/util.dart';

void main() {
  runZonedGuarded(
        () => init(),
        (err, stace) {
      if (kDebugMode) {
        print(FlutterErrorDetails(exception: err, stack: stace));
      }
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, line);
      },
    ),
  );
}


Size screenSize = const Size(390, 844);
/// 4.7
Size screenIphone7 = const Size(375, 667);
/// 5.8
Size screenIphoneX = const Size(375, 812);

void init() async {
  await configInit();
  runApp(initRunApp());
}

Widget initGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(

    initialRoute: AppRouter.configNormalRouts(),
    getPages: AppRouter.getAllRoutS(),
    defaultTransition: Transition.rightToLeft,
    /// 本地支持语言
    supportedLocales: const [
      Locale('zh', 'CN'),
      Locale('en', 'US'),
    ],
    useInheritedMediaQuery: true,
    translations: I18TRMessages(),
    fallbackLocale: const Locale('zh', 'CN'),
    /// 是否显示 导航栏右上角 debug 标识
    debugShowCheckedModeBanner: false,
    /// 国际化配置 代理
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate, // ios
    ],

    builder: builder,
  );
}

/// 初始屏幕适配
Widget initScreenUtil({
  required Widget Function(BuildContext, Widget?) builder,
  bool useInheritedMediaQuery = true,
}) {
  return ScreenUtilInit(
    /// UI尺寸
    designSize: const Size(375, 667),
    useInheritedMediaQuery: useInheritedMediaQuery,
    builder: builder,
  );
}

/// 配置根部手势
initRootGestureDetector({
  Widget? child,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      keyDismiss(
        context,
      );
    },
    child: child,
  );
}

initConfig() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

/// 初始化App
initRunApp() {
  if (!kIsWeb) {
    initConfig();
  }


  Widget body = initGetMaterialApp(
    builder: (context, child) {
      FlutterView window = View.of(context);

      double width = window.physicalSize.width / window.devicePixelRatio;
      bool hasFrame = width > 500;
      if (hasFrame && kIsWeb) {
        return DeviceFrame(
          device: Devices.ios.iPhone13,
          screen: initScreenUtil(
            builder: (p0, p1) {
              Widget body = initRootGestureDetector(
                child: child,
                context: context,
              );
              return body;
            },
          ),
        );
      } else {
        return initScreenUtil(
          builder: (p0, p1) {
            Widget body = initRootGestureDetector(
              child: child,
              context: context,
            );
            return body;
          },
        );
      }
    },
  );
  return body;
}