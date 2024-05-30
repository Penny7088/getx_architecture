import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_architecture/base/utils/extensions/int_extension.dart';

import '../../generated/assets.dart';
import '../config/font_config.dart';
import '../config/normal_colors.dart';

enum CommonPlaceHoldType {
  /// 无网络
  notNetwork,
  /// 未登录
  noLogin,

  ///空数据
  nothing,
}

class CommonPlaceHoldPage extends StatefulWidget {
  const CommonPlaceHoldPage({
    Key? key,
    required this.placeHoldType,
    this.ontap,
    this.btnMsg,
    this.msg,
  }) : super(key: key);
  final CommonPlaceHoldType placeHoldType;
  final String? msg;
  final String? btnMsg;
  final Function? ontap;
  @override
  State<StatefulWidget> createState() {
    return _CommonPlaceHoldPageState();
  }
}

class _CommonPlaceHoldPageState extends State<CommonPlaceHoldPage> {
  Widget createPlaceImageWidget() {
    return createNoDataWidget();
  }

  // 空数据动图
  Widget createNoDataWidget() {
    return Container(
      width: 200,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Center(
        child: Image.asset(
          Assets.baseNoDataStatus,
          width: 140,
          height: 140,
        ),
      ),
    );
  }

  /// 创建暂位图标语
  Widget createPlaceTitleWidget() {
    String title = "";
    if (widget.placeHoldType == CommonPlaceHoldType.notNetwork) {
      title = "暂无网络,请稍后重试";
    } else if (widget.placeHoldType == CommonPlaceHoldType.nothing) {
      title = "暂无数据";
    }
    title = widget.msg ?? title;
    return Text(
      title,
      style: TextStyle(color: NormalColorS.col333333,fontSize: 14.sp),
    );
  }

  /// 创建暂位图描述语
  Widget createPlaceMessageWidget() {
    return Container(child:Text("我是展位图"));
  }

  /// 创建暂位图 刷新按钮
  Widget createPlaceReloadBtnWidget() {
    return InkWell(
      onTap: () async {
        if (widget.ontap != null) {
          widget.ontap!();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 100.w,
        height: 40.w,
        decoration: BoxDecoration(
          boxShadow: [
            configThemeShadow(),
          ],
          color: NormalColorS.colffffff,
          borderRadius: BorderRadius.all(
            Radius.circular(20.w),
          ),
        ),
        child: Text(
          widget.btnMsg ?? "刷新",
          style: FontConfig.fontBold14Black,
        ),
      ),
    );
  }

  BoxShadow configThemeShadow({
    double opacity = 0.8,
  }) {
    return BoxShadow(
      color:NormalColorS.colffffff.withOpacity(
        opacity,
      ),
      offset: const Offset(0, 3),
      blurRadius: 10,
      spreadRadius: 0,
    );
  }

  /// 触发方法
  ///
  ///
  Widget placeWidget({
    int type = 1,
  }) {
    Widget? child = Container();
    switch (type) {
      case 1:
        child = createPlaceImageWidget();
        break;
      case 2:
        child = createPlaceTitleWidget();
        break;
      case 3:
        child = createPlaceMessageWidget();
        break;
      case 4:
        child = createPlaceReloadBtnWidget();
        break;
      default:
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: NormalColorS.colffffff.withOpacity(0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          placeWidget(type: 1),
          placeWidget(type: 2),
          12.height,
          placeWidget(type: 4),
        ],
      ),
    );
  }
}
