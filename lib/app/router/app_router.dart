import 'package:get/get.dart';
import 'package:getx_architecture/app/pages/splash/view.dart';

import '../pages/main/main_view.dart';

/// FileName app_router
///
/// @Author mac
/// @Date 2024/5/29 10:41
///
/// @Description TODO

class AppRouter{

  static getAllRoutS() {
    return [
      GetPage(
        name: RouterId.splash,
        page: () => const SplashPage(),
      ),
      GetPage(
        name: RouterId.main,
        page: () => const MainPage(),
      ),
      // ...ShopRouterS.routerS
    ];
  }

  // 设置默认入口页
  static configNormalRouts() {
    return RouterId.splash;
  }
}

class RouterId {
  static const String splash = '/app/splash';
  static const String main = '/app/main';
}