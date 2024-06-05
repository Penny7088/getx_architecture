
import 'package:flutter/material.dart';

import '../config/normal_colors.dart';
import '../state/page_state.dart';




class PlaceHolderConfig {
  static Widget? loadWidget;
}

class PlaceHolderWidget extends StatelessWidget {
  // 网络请求状态
  final PageState pageState;
  // 子视图
  final Widget? child;
  /// 加载动画
  final Widget? loadingWidget;
  // 站位图
  final Widget? errorWidget;
  // 是否显示加载动画
  final bool? isShowLoading;
  const PlaceHolderWidget({
    super.key,
    required this.pageState,
    this.child,
    this.errorWidget,
    this.loadingWidget,
    this.isShowLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (pageState == PageState.errorState ||
        pageState == PageState.errorShowRefresh ||
        pageState == PageState.emptyDataState) {
      return errorWidget ?? Container();
    } else if (isShowLoading! && pageState == PageState.initializedState) {
      return Container(
          color: NormalColorS.colffffff,
          child: Center(
        child: loadingWidget ?? (PlaceHolderConfig.loadWidget ?? Container()),
      ));
    }
    return child ?? Container();
  }
}
