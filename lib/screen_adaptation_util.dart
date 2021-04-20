import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:screen_adaptation/screen_adaptation_provider.dart';

/// [width] 设计尺寸宽度
/// [width] 设计尺寸高度
/// [screenWidth] //屏幕宽度
/// [screenHeight] //屏幕高度
/// [orientation] //屏幕方向
/// [pixelRatio]  //像素比
/// [statusBarHeight] //距离顶部安全距离
/// [bottomBarHeight] //距离底部安全距离
/// [textScaleFactor] //文字缩放比例
/// [allowFontScaling] //是否允许文字缩放
class ScreenAdaptationUtil implements ScreenAdaptationProvider {
  double width;
  double height;
  double screenWidth;
  double screenHeight;
  Orientation orientation;
  double pixelRatio;
  double statusBarHeight;
  double bottomBarHeight;
  double textScaleFactor;
  bool allowFontScaling;

  static ScreenAdaptationUtil _adaptationUtil;

  static set instance(ScreenAdaptationUtil adaptationUtil) {
    _adaptationUtil = adaptationUtil;
  }

  ScreenAdaptationUtil({
    double width = 750,
    double height = 1334,
    this.screenWidth,
    this.screenHeight,
    this.orientation,
    this.pixelRatio,
    this.statusBarHeight,
    this.bottomBarHeight,
    this.textScaleFactor,
    this.allowFontScaling = false,
    double landscapeWidth,
    double landscapeHeight,
  }) {
    if (orientation == Orientation.portrait) {
      this.width = width;
      this.height = height;
    } else {
      this.width = landscapeWidth ?? height;
      this.height = landscapeHeight ?? width;
    }
  }

  static ScreenAdaptationUtil getInstance() {
    if (_adaptationUtil == null) {
      assert(
        _adaptationUtil != null,
        '\n请先调用ScreenAdaptationInit()进行实例化',
      );
      return ScreenAdaptationUtil();
    }
    return _adaptationUtil;
  }

  @override
  double setAutomatic(num wh) {
    // TODO: implement setAutomatic
    return wh * min(screenWidth / this.width, screenHeight / this.height);
  }

  @override
  double setHeight(num height) {
    return height * (screenHeight / this.height);
  }

  @override
  double setSp(num fontSize, {bool allowFontScaling}) {
    if (allowFontScaling == null) {
      if (this.allowFontScaling == false)
        return fontSize *
            min(screenWidth / this.width, screenHeight / this.height);
      return fontSize *
          min(screenWidth / this.width, screenHeight / this.height) *
          textScaleFactor;
    }
    if (allowFontScaling == false)
      return fontSize *
          min(screenWidth / this.width, screenHeight / this.height);
    return fontSize *
        min(screenWidth / this.width, screenHeight / this.height) *
        textScaleFactor;
  }

  @override
  double setWidth(num width) {
    // TODO: implement setWidth
    return width * (screenWidth / this.width);
  }
}
