/// 抽象类接口
abstract class ScreenAdaptationProvider {
  /// [width] 传入width 返回 适配后的width
  double setWidth(double width);

  /// [height] 传入height 返回 适配后的height
  double setHeight(double height);

  /// [fontSize] 传入fontSize 返回 适配后的fontSize
  double setSp(double fontSize);

  /// [wh] 传入width/height 返回较小的适配
  double setAutomatic(double wh);
}
