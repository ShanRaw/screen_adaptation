# screen_adaptation
[![pub package](https://img.shields.io/pub/v/flutter_screenutil.svg)](https://pub.dev/packages/flutter_screenutil)

 *flutter 屏幕适配方案*
 
###配置pubspec.yaml
```yaml
dependencies:
  screen_adaptation: ^{latest version}
```
###使用的时候引入
```dart
import 'package:screen_adaptation/screen_adaptation.dart';
```
###使用方法
```dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// [OrientationBuilder] 不需要旋转屏幕方向UI可以省略 直接返回MaterialApp
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
          builder: (BuildContext context, Widget child) {
            return ScreenAdaptationInit(
                allowFontScaling: true,
                size: Size(750, 1334),
                child: child);
          },
        ));
  }
}
``` 
###参数说明
####ScreenAdaptationInit
- [size] UI设计图尺寸 默认750 1334
- [landscapeSize] 横屏UI设计图尺寸 可不传 默认为 竖屏[size]尺寸反转 [landscapeSize.width]为[size.height] [landscapeSize.height]为[size.width]
- [allowFontScaling] 字体是否根据系统缩放比例变化 默认为false
####ScreenAdaptationUtil.getIntance()
