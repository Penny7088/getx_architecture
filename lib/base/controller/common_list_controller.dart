import 'package:easy_refresh/easy_refresh.dart';

import '../state/page_state.dart';
import '../view/mixin/refresh_mixin.dart';
import 'common_controller.dart';

/// FileName common_list_controller
///
/// @Author mac
/// @Date 2024/5/28 17:33
///
/// @Description  list controller

abstract class CommonListController<S extends BaseState>
    extends CommonController<S> with AbstractRefreshMethod {

  EasyRefreshController? refreshController;
  bool controlFinishRefresh = true;
  bool controlFinishLoad = true;

  @override
  configUI() {
    super.configUI();
    configRefreshController();
  }

  @override
  void configRefreshController() {
    refreshController = EasyRefreshController(
      controlFinishLoad: controlFinishLoad,
      controlFinishRefresh: controlFinishRefresh,
    );
  }

  // 上拉加载
  @override
  void configLoading() {
    page++;
    fetchNetWorkData(
      refreshType: RefreshType.push,
    );
  }

  // 下啦刷新
  @override
  void configRefresh() {
    page = 1;
    fetchNetWorkData(
      refreshType: RefreshType.pull,
    );
  }

  // 配置结束刷新操作
  PageState configRefreshPageState({
    int? allNum,
    int? netWorkNum,
    required RefreshType type,
  }) {
    return endRefresh(
      type: type,
      state: configPageState(
        allNum: allNum ?? 0,
        networkNum: netWorkNum ?? 0,
      ),
    );
  }

  @override
  PageState endRefresh({required RefreshType type, required PageState state}) {
    return configEndRefresh(
      type: type,
      state: state,
      refreshController: refreshController,
    );
  }
}