import 'package:screen_adaptation/screen_adaptation_util.dart';

extension UtilExtension on num {
  double get w => ScreenAdaptationUtil.getInstance().setWidth(this);

  double get h => ScreenAdaptationUtil.getInstance().setHeight(this);

  double get r => ScreenAdaptationUtil.getInstance().setAutomatic(this);

  double get s => ScreenAdaptationUtil.getInstance().setSp(this);

  double get st =>
      ScreenAdaptationUtil.getInstance().setSp(this, allowFontScaling: true);

  double get sf =>
      ScreenAdaptationUtil.getInstance().setSp(this, allowFontScaling: false);
}
