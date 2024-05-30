import 'package:flutter/material.dart';

/// FileName context_extensions
///
/// @Author mac
/// @Date 2024/5/28 19:32
///
/// @Description TODO

extension ContextExtensions on BuildContext {
  /// return screen size
  Size size() => MediaQuery.of(this).size;

  /// return screen width
  double width() =>  MediaQuery.of(this).size.width;

  /// return screen height
  double height() => MediaQuery.of(this).size.height;

  /// return screen devicePixelRatio
  double pixelRatio() => MediaQuery.of(this).devicePixelRatio;

  /// returns brightness
  Brightness platformBrightness() => MediaQuery.of(this).platformBrightness;

  /// Return the height of status bar
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Return the height of navigation bar
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  /// Returns Theme.of(context)
  ThemeData get theme => Theme.of(this);

  /// Returns Theme.of(context).textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns DefaultTextStyle.of(context)
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  /// Returns Form.of(context)
  FormState? get formState => Form.of(this);

  /// Returns Scaffold.of(context)
  ScaffoldState get scaffoldState => Scaffold.of(this);

  /// Returns Overlay.of(context)
  OverlayState? get overlayState => Overlay.of(this);

  /// Returns primaryColor Color
  Color get primaryColor => theme.primaryColor;

  /// Returns accentColor Color
  Color get accentColor => theme.colorScheme.secondary;

  /// Returns scaffoldBackgroundColor Color
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  /// Returns cardColor Color
  Color get cardColor => theme.cardColor;

  /// Returns dividerColor Color
  Color get dividerColor => theme.dividerColor;

  /// Returns dividerColor Color
  Color get iconColor => theme.iconTheme.color!;

  /// Request focus to given FocusNode
  void requestFocus(FocusNode focus) {
    FocusScope.of(this).requestFocus(focus);
  }

  /// Request focus to given FocusNode
  void unFocus(FocusNode focus) {
    focus.unfocus();
  }


  Orientation get orientation => MediaQuery.of(this).orientation;

  /// Return true if current orientation is landscape
  bool get isLandscape => orientation == Orientation.landscape;

  /// Return true if current orientation is portrait
  bool get isPortrait => orientation == Orientation.portrait;

  bool get canPop => Navigator.canPop(this);

  void pop<T extends Object>([T? result]) => Navigator.pop(this, result);

  TargetPlatform get platform => Theme.of(this).platform;

  /// Return true if the platform is Android
  bool get isAndroid => platform == TargetPlatform.android;

  /// Return true if the platform is iOS
  bool get isIOS => platform == TargetPlatform.iOS;

  /// Return true if the platform is MacOS
  bool get isMacOS => platform == TargetPlatform.macOS;

  /// Return true if the platform is Windows
  bool get isWindows => platform == TargetPlatform.windows;

  /// Return true if the platform is Fuchsia
  bool get isFuchsia => platform == TargetPlatform.fuchsia;

  /// Return true if the platform is Linux
  bool get isLinux => platform == TargetPlatform.linux;

  /// Open Drawer
  void openDrawer() => Scaffold.of(this).openDrawer();

  /// Hide Drawer
  void openEndDrawer() => Scaffold.of(this).openEndDrawer();

  /// Returns true if keyboard is visible
  bool get isKeyboardShowing => MediaQuery.of(this).viewInsets.bottom > 0;
}