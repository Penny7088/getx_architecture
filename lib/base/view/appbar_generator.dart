/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-15 22:15:22
 * @LastEditors: TT-hzy 
 * @LastEditTime: 2024-03-11 14:54:15
 */
import 'package:flutter/material.dart';

import '../config/normal_colors.dart';

class AppBarGenerator {
  static customAppBarWidget({
    required BuildContext context,
    String? title,
    List<Widget>? actions,
    Widget? titleView,
    Widget? leading,
    IconData? icon,
    bool showBack = true,
    double elevation = 0,
    double? toolbarHeight,
    Color? textColor,
    TextStyle? textStyle,
    double? fontSize,
    Color? leadingIconColor,
    Color? backgroundColor,
    Widget? flexibleSpace,
    Function()? leadingCallback,
  }) {
    ThemeData themeData = Theme.of(context);
    textStyle ??= (textColor != null || fontSize != null)
        ? TextStyle(
            color: textColor,
            fontSize: fontSize ??
                themeData.appBarTheme.titleTextStyle?.fontSize ??
                18,
          )
        : (themeData.appBarTheme.titleTextStyle ??
            TextStyle(
              color: textColor ??
                  themeData.appBarTheme.titleTextStyle?.color ??
                  NormalColorS.colffffff,
              fontSize: fontSize ??
                  themeData.appBarTheme.titleTextStyle?.fontSize ??
                  18,
            ));
    Widget leftWidget = configAppBarBackBtnWidget(
      context: context,
      leading: leading,
      icon: icon,
      showBack: showBack,
      leadingIconColor: leadingIconColor,
      leadingCallback: leadingCallback,
    );

    Widget textWidget = title == null
        ? Container()
        : Text(
            title,
            style: textStyle,
          );
    textWidget = titleView ?? textWidget;
    textWidget = Center(
      child: textWidget,
    );
    Widget rightWidget = Row(children: actions ?? []);

    Widget body = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget,
        rightWidget,
      ],
    );

    body = Container(
      height: MediaQuery.of(context).padding.top + kToolbarHeight,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white.withOpacity(0),
      ),
      child: body,
    );
    body = Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).padding.top,
          bottom: 0,
          child: textWidget,
        ),
        body,
      ],
    );
    return body;
  }

  /// 配置导航栏 返回按钮
  static configAppBarBackBtnWidget({
    required BuildContext context,
    Widget? leading,
    IconData? icon,
    bool showBack = true,
    Color? leadingIconColor,
    Function()? leadingCallback,
  }) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    bool canShowBack = parentRoute?.canPop ?? false;
    ThemeData themeData = Theme.of(context);
    leadingIconColor ??=
        (themeData.appBarTheme.iconTheme?.color ?? NormalColorS.col101010);

    Widget backBtn = leading ??
        IconButton(
          icon: Icon(
            icon ?? Icons.arrow_back_ios,
            color: leadingIconColor,
          ),
          onPressed: leadingCallback ?? () => Navigator.of(context).pop(),
        );
    backBtn = canShowBack ? backBtn : Container();
    backBtn = showBack ? backBtn : Container();
    return backBtn;
  }

  static PreferredSizeWidget getNormalAppBar({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    Widget? titleView,
    Widget? leading,
    IconData? icon,
    bool showBack = true,
    double elevation = 0,
    double? toolbarHeight,
    PreferredSizeWidget? bottom,
    Color? textColor,
    Color? leadingIconColor,
    Color? backgroundColor,
    Widget? flexibleSpace,
    double? fontSize,
    TextStyle? textStyle,
    Function()? leadingCallback,
  }) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    bool canShowBack = parentRoute?.canPop ?? false;
    ThemeData themeData = Theme.of(context);
    leadingIconColor ??=
        (themeData.appBarTheme.iconTheme?.color ?? NormalColorS.col101010);
    backgroundColor ??=
        (themeData.appBarTheme.backgroundColor ?? NormalColorS.colffffff);
    textStyle ??= (textColor != null || fontSize != null)
        ? TextStyle(
            color: textColor,
            fontSize: fontSize ??
                themeData.appBarTheme.titleTextStyle?.fontSize ??
                18,
          )
        : (themeData.appBarTheme.titleTextStyle ??
            TextStyle(
              color: textColor ??
                  themeData.appBarTheme.titleTextStyle?.color ??
                  NormalColorS.col101010,
              fontSize: fontSize ??
                  themeData.appBarTheme.titleTextStyle?.fontSize ??
                  18,
            ));
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      toolbarHeight: toolbarHeight,
      actions: actions,
      flexibleSpace: flexibleSpace,
      leading: showBack
          ? (canShowBack
              ? (leading ??
                  IconButton(
                    icon: Icon(
                      icon ?? Icons.arrow_back_ios_new,
                      color: leadingIconColor,
                    ),
                    onPressed:
                        leadingCallback ?? () => Navigator.of(context).pop(),
                  ))
              : null)
          : null,
      title: titleView ??
          Text(
            title,
            style: textStyle,
          ),
      elevation: elevation,
      bottom: bottom,
      automaticallyImplyLeading: showBack,
    );
  }

}
