import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import '../../state/page_state.dart';
import '../../controller/common_controller.dart';

mixin class AbstractNetWork {
  /// 网络请求
  @protected
  fetchNetWorkData({
    RefreshType? refreshType,
    Map<String, dynamic>? info,
  }) {}
}


enum RefreshType {
  pull,
  push
}

mixin class AbstractRefreshMethod {
  int page = 1;

  int pageSize = 10;

  void configRefreshController() {}

  /// 结束刷新
  PageState endRefresh({
    required RefreshType type,
    required PageState state,
  }) {
    throw UnimplementedError();
  }

  /// 下啦刷新 触发事件
  void configRefresh() {}

  /// 上啦加载 触发事件
  void configLoading() {}

  configPageState({
    required int allNum,
    required int networkNum,
    int? pageSize,
  }) {
    PageState st = PageState.dataFetchState;
    if (allNum == 0) {
      st = PageState.emptyDataState;
    } else if (networkNum == 0) {
      st = PageState.noMoreDataState;
    } else if (pageSize != null && pageSize > networkNum) {
      st = PageState.noMoreDataState;
    }
    return st;
  }

  configEndRefresh({
    required RefreshType type,
    PageState? state,
    EasyRefreshController? refreshController,
  }) {
    IndicatorResult result = IndicatorResult.success;

    if (state == PageState.errorState || state == PageState.errorOnlyTotal || state == PageState.errorShowRefresh) {
      result = IndicatorResult.fail;
    } else if (state == PageState.noMoreDataState && type == RefreshType.push) {
      result = IndicatorResult.noMore;
    }
    if (refreshController != null) {
      if (type == RefreshType.pull) {
        refreshController.finishRefresh(result);
      } else if (type == RefreshType.push) {
        refreshController.finishLoad(result);
      }
    }
    return state;
  }
}

mixin class AbstractRefreshWidget<C extends CommonController> {
  /// 创建刷新控件
  Widget createRefreshWidget(BuildContext context) {
    throw UnimplementedError();
  }

  /// 创建列表
  Widget createListView(BuildContext context) {
    throw UnimplementedError();
  }

}