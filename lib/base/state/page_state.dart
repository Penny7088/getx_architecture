
enum PageState {
  // 初始状态
  initializedState,
  // 错误状态,显示失败界面
  errorState,
  // 错误状态,只弹错误信息
  errorOnlyTotal,
  // 错误状态,显示刷新按钮
  errorShowRefresh,
  // 没有更多数据
  noMoreDataState,
  // 空数据状态
  emptyDataState,
  // 数据获取成功状态
  dataFetchState,
}

abstract class BaseState {
  PageState pageState;
  bool isOk = true;
  String? msg;
  String? mark;
  BaseState({
    this.pageState = PageState.initializedState,
    this.msg,
  });

  void release();
}
