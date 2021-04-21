import 'package:flutter/widgets.dart';
import 'package:screen_adaptation/screen_adaptation_util.dart';

/// [child]
/// [size] UI设计图尺寸 默认750 1334
/// [landscapeSize] 横屏UI设计图尺寸 可不传 默认为 竖屏[size]尺寸反转 [landscapeSize.width]为[size.height] [landscapeSize.height]为[size.width]
/// [allowFontScaling] 字体是否根据系统缩放比例变化 默认为false
class ScreenAdaptationInit extends StatelessWidget {
  final Widget child;
  final Size size;
  final Size? landscapeSize;
  final bool allowFontScaling;

  ScreenAdaptationInit(
      {required this.child,
      this.size = const Size(750, 1337),
      this.allowFontScaling = false,
      this.landscapeSize});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      final mediaQuery = MediaQuery.of(context);
      ScreenAdaptationUtil.instance = ScreenAdaptationUtil(
          width: size.width,
          height: size.height,
          landscapeWidth: landscapeSize?.width,
          landscapeHeight: landscapeSize?.height,
          allowFontScaling: allowFontScaling,
          orientation: orientation,
          screenWidth: mediaQuery.size.width,
          screenHeight: mediaQuery.size.height,
          statusBarHeight: mediaQuery.padding.top,
          bottomBarHeight: mediaQuery.padding.bottom,
          textScaleFactor: mediaQuery.textScaleFactor,
          pixelRatio: mediaQuery.devicePixelRatio);
      return child;
    });
  }
}
