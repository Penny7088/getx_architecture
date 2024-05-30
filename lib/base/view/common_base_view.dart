import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/base/state/page_state.dart';

import '../config/normal_colors.dart';
import '../controller/common_controller.dart';
import 'common_place_holder_widget.dart';
import 'loading_center_widget.dart';
import 'mixin/appbar_mixin.dart';
import 'mixin/view_mixin.dart';

abstract class CommonBaseView<C extends CommonController>
    extends GetView<C> with ViewMixin, AppBarMixin {
  const CommonBaseView({super.key});

  @override
  String? get tag => controllerTag();

  String controllerTag();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => createScaffoldWidget(context: context),
    );
  }

  @override
  Widget? createScaffoldBottomNavigationBar(
      {required BuildContext context, BoxConstraints? constraints}) {
    return Container();
  }

  @override
  Widget? createLoadingWidget() {
    return const LoadingWidget();
  }

  @override
  Widget? createEmptyWidget() {
    return CommonPlaceHoldPage(
      placeHoldType: controller.placeHoldType,
      msg: controller.placeMsg,
      btnMsg: controller.placeBtnMsg,
      ontap: () {
        controller.tapPlaceHoldWidgetMethod(
          placeHoldType: controller.placeHoldType,
        );
      },
    );
  }


  /// UI配置项
  /// ---------------- 脚手架配置项 ---------------- ///
  /// 是否使用脚手架
  @override
  bool configIsNeedScaffold() {
    return controller.isNeedScaffold;
  }

  ///是否形变
  @override
  bool? configResizeToAvoidBottomInset() {
    return controller.resizeToAvoidBottomInset;
  }

  /// 脚手架背景颜色
  @override
  Color? configScaffoldBackgroundColor() {
    return controller.scaffoldBackGroundColor ?? NormalColorS.transparent;
  }

  @override
  bool configIsNeedBottomNavigation() {
    return controller.isShowBottomBar;
  }

  /// ---------------- AppBar配置项 ---------------- ///

  /// 是否需要导航栏
  @override
  bool configIsShowAppBar() {
    return controller.isShowAppBar;
  }

  @override
  leadingCallback({BuildContext? context}) {
    controller.tapNormalBack();
  }

  /// 配置导航栏标题
  @override
  String? createAppBarTitleStr() {
    return controller.appBarTitle;
  }

  /// 配置导航栏背景颜色
  @override
  Color? createAppBarNavBackColor() {
    return controller.navBackgroundColor ?? NormalColorS.transparent;
  }

  /// 配置导航栏背景视图
  @override
  Widget? createFlexBleSpace() {
    return null;
  }

  /// ---------------- 安全区域配置项 ---------------- ///
  /// 是否需要 安全区域 控件
  @override
  bool configIsNeedSafeArea() {
    return controller.isNeedScaffold;
  }

  /// 是否关闭顶部安全区域
  @override
  bool configSafeAreaTop() {
    return controller.safeAreaTop;
  }

  /// 是否关闭底部安全区域
  @override
  bool configSafeAreaBottom() {
    return controller.safeAreaBottom;
  }

  /// ---------------- 界面通用配置项 ---------------- ///
  /// 是否显示加载动画
  @override
  bool isShowLoading() {
    return controller.isShowLoadWidget.value;
  }

  /// 配置界面状态值
  @override
  configPageState() {
    return controller.pageState.value;
  }
}
