import 'package:flutter/material.dart';

class AppConstraints {
  AppConstraints._();

  static final _instance = AppConstraints._();

  factory AppConstraints() => _instance;
  bool _firstRun = true;

  final kDesignHeight = 932;
  final kDesignWidth = 430;
  final kDrawerWidth = 342;
  late final BuildContext _context;
  late final MediaQueryData _deviceProperties = MediaQuery.of(_context);
  late final double _screenHeight = _deviceProperties.size.height;
  late final _screenWidth = _deviceProperties.size.width;
  late final kDisplayWidth = _screenWidth -
      _deviceProperties.viewInsets.left -
      _deviceProperties.viewInsets.right;
  late final kDisplayWidthContext = _screenWidth -
      _deviceProperties.viewInsets.left -
      _deviceProperties.viewInsets.right;
  late final kDisplayHeight = _screenHeight -
      _deviceProperties.viewInsets.top -
      _deviceProperties.viewInsets.bottom;

  void initialize(BuildContext context) {
    if (!_firstRun) return;
    _context = context;
    _firstRun = false;
  }
}

extension NumExtension1 on num {
  double get height =>
      (this / AppConstraints().kDesignHeight) * AppConstraints().kDisplayHeight;

  double get width =>
      (this / AppConstraints().kDesignWidth) * AppConstraints().kDisplayWidth;

  double get drawerWidth =>
      (this / AppConstraints().kDesignWidth) * AppConstraints().kDrawerWidth;

  Radius get radius => Radius.circular(width.toDouble());

  BorderRadius get borderRadius => BorderRadius.circular(width.toDouble());
  BorderRadius get drawerBorderRadius =>
      BorderRadius.circular(drawerWidth.toDouble());
}
