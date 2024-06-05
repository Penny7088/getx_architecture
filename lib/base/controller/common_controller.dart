import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../state/page_state.dart';
import '../utils/getx_util_tool.dart';
import '../view/common_place_holder_widget.dart';
import '../view/mixin/app_life_cycle_abs.dart';
import '../view/mixin/refresh_mixin.dart';

/// FileName common_controller
///
/// @Author mac
/// @Date 2024/5/28 15:29
///
/// @Description  base controller

abstract class CommonController<S extends BaseState> extends GetxController
    with AbstractNetWork, WidgetsBindingObserver, AppLifeCycleAbs {

  CommonPlaceHoldType placeHoldType = CommonPlaceHoldType.nothing;

  /// 缺省页 描述语
  String? placeMsg;

  /// 缺省页 按钮文字
  String? placeBtnMsg;

  /// 配置界面状态
  /// PageState.initializedState 初始化中 默认状态
  var pageState = PageState.initializedState.obs;

  /// 是否显示导航栏
  var isShowAppBar = true;

  /// 导航栏标题
  var appBarTitle = "";

  /// 导航栏颜色
  Color? navBackgroundColor;

  /// 默认安全区顶部 忽略
  var safeAreaTop = true;

  /// 默认安全区底部 忽略
  var safeAreaBottom = false;

  /// 是否显示底部导航栏
  var isShowBottomBar = false;

  /// 背景颜色
  Color? scaffoldBackGroundColor;

  /// 是否显示Scaffold脚手架
  var isNeedScaffold = true;

  /// 滚动属性
  bool? resizeToAvoidBottomInset;

  // 配置界面是否显示 加载界面
  var isShowLoadWidget = false.obs;

  String? controllerTag;

  late S state = createState();

  @override
  void onInit() {
    super.onInit();
    configUI();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      configWidgetRenderingCompleted();
    });
  }

  S  createState();
  /// 配置默认选项
  configUI() {

  }
  /// 界面渲染完成
  configWidgetRenderingCompleted() async {}


  // 点击缺省页触发事件
  tapPlaceHoldWidgetMethod({
    required CommonPlaceHoldType placeHoldType,
  }) {}

  /// 点击返回按钮触发事件
  tapNormalBack() {
    currentGoBack();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      configAppLifeCycleResumed();
    } else if (state == AppLifecycleState.inactive) {
      configAppLifeCycleInactive();
    } else if (state == AppLifecycleState.paused) {
      configAppLifeCyclePaused();
    } else if (state == AppLifecycleState.detached) {
      configAppLifeCycleDetached();
    }
  }

  ///当前系统改主题改变回调
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    configPlatformBrightness();
  }

  /// 当前系统语言发生改变回调
  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    configChangeLocales(locales);
  }

  /// app进入前台
  @override
  configAppLifeCycleResumed() {}

  /// app在前台但不响应事件，比如电话，touch id等"
  @override
  configAppLifeCycleInactive() {}

  /// app进入后台
  @override
  configAppLifeCyclePaused() {}

  /// 没有宿主视图但是flutter引擎仍然有效
  @override
  configAppLifeCycleDetached() {}

  /// 主题变更事件回调
  @override
  configPlatformBrightness() {
  }

  @override
  onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
    state.release();
  }
}