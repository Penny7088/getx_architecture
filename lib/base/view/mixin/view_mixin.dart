
import 'package:flutter/material.dart';

import '../../state/page_state.dart';
import '../place_holder_widget.dart';


/// 脚手架 [ViewMixin]
mixin ViewMixin {
  ///   创建流程
  ///   基类 调用 [createScaffoldWidget] -> 是否使用脚手架 是 -> [Scaffold]->[body]->[createScaffoldBody]->[createSafeArea]->->[createSafeBody]->[createChildBody]
  ///                                                  否 -> [createScaffoldBody]->[createSafeArea]->->[createSafeBody]->[createChildBody]
  ///

  createScaffoldWidget({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = createScaffoldBody(
      context: context,
      constraints: constraints,
    );
    body = configIsNeedScaffold()
        ?
        Scaffold(
            appBar: createAppBar(context: context),
            backgroundColor: configScaffoldBackgroundColor(),
            resizeToAvoidBottomInset: configResizeToAvoidBottomInset(),
            body: body,
            bottomNavigationBar: configIsNeedBottomNavigation() ? createScaffoldBottomNavigationBar(context: context): null,
          )
        : body;
    return body;
  }

  /// 安全区域 body
  Widget createSafeArea({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = createSafeBody(
      context: context,
      constraints: constraints,
    );
    body = configIsNeedSafeArea()
        ? SafeArea(
      top: configSafeAreaTop(),
      bottom: configSafeAreaBottom(),
      child: body,
    )
        : body;
    return body;
  }


  /// 创建safe body
  Widget createSafeBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = createChildBody(
      constraints: constraints,
      context: context,
    );
    body = isNeedPlaceHolder()
        ? PlaceHolderWidget(
      pageState: configPageState(),
      errorWidget: createEmptyWidget(),
      loadingWidget: createLoadingWidget(),
      isShowLoading: isShowLoading(),
      child: body,)

        : body;

    return body;
  }

  /// 创建真实body
  @protected
  Widget createChildBody({
    required BuildContext context,
    BoxConstraints? constraints,
  });


  /// 创建导航栏
  @protected
  PreferredSizeWidget? createAppBar({
    required BuildContext context,
  });

  /// 创建界面body
  @protected
  Widget createScaffoldBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }){
    return createSafeArea(context: context,constraints: constraints);
  }

  /// 创建底部导航栏
  @protected
  Widget? createScaffoldBottomNavigationBar({
    required BuildContext context,
    BoxConstraints? constraints,
  });

  /// 配置项 =================================================

  /// 配置界面状态
  configPageState() {
    return PageState.initializedState;
  }

  /// 是否需要安全区域
  bool configIsNeedSafeArea() {
    return true;
  }

  /// 是否打开顶部安全区域
  bool configSafeAreaTop() {
    return true;
  }

  /// 是否打开底部安全区域
  bool configSafeAreaBottom() {
    return true;
  }

  /// 是否需要占位图
  bool isNeedPlaceHolder() {
    return true;
  }

  /// 创建缺省页
  Widget? createEmptyWidget() {
    return null;
  }

  /// 创建加载界面
  Widget? createLoadingWidget() {
    return null;
  }

  /// 配置是否显示加载界面
  bool isShowLoading() {
    return false;
  }

  /// 是否需要脚手架
  bool configIsNeedScaffold() {
    return false;
  }

  bool configIsNeedBottomNavigation() {
    return false;
  }

  /// 键盘弹起 是否形变
  bool? configResizeToAvoidBottomInset() {
    return null;
  }

  /// 配置脚手架背景颜色
  Color? configScaffoldBackgroundColor() {
    return null;
  }
}
