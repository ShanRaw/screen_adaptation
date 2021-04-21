import 'package:flutter/material.dart';
import 'package:screen_adaptation/screen_adaptation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(),
              builder: (BuildContext context, Widget child) {
                return ScreenAdaptationInit(
                    size: Size(750, 1334), child: child);
              },
            ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool _isPortrait =
        ScreenAdaptationUtil.getInstance().orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text('screen_adaptation'),
        actions: [
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => DomePage())),
              child: Text(
                'dome',
                style: TextStyle(fontSize: 48.s, color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30.w),
              child: Text(
                '旋转屏幕后UI会自动进行适配',
                style: TextStyle(fontSize: 48.s),
              ),
            ),
            Container(
              width: _isPortrait ? 750.w : 1334.w,
              height: 100.w,
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: Text(
                '宽度100%',
                style: TextStyle(color: Colors.white, fontSize: 35.s),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.w),
              width: _isPortrait ? 345.w : 667.w,
              height: _isPortrait ? 667.h : 345.w,
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: Text(
                '宽度50% 高度50%',
                style: TextStyle(color: Colors.white, fontSize: 35.s),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: ScreenAdaptationUtil.getInstance().statusBarHeight + 30.w,
            left: 30.w,
            right: 30.w,
            bottom: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 30.w,
              runSpacing: 30.w,
              children: [
                Container(
                  width: ScreenAdaptationUtil.getInstance().setWidth(100),
                  height: ScreenAdaptationUtil.getInstance().setWidth(100),
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                ),
                Container(
                  width: 100.h,
                  height: 100.w,
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                ),
                Container(
                  width: 100.w,
                  height: 100.h,
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                ),
                Container(
                  width: 100.h,
                  height: 100.h,
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                ),
                Container(
                  width: 100.r,
                  height: 100.r,
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                ),
              ],
            ),
            Container(
              child: Text('设计宽度:${ScreenAdaptationUtil.getInstance().width}'),
            ),
            Container(
              child: Text('设计高度:${ScreenAdaptationUtil.getInstance().height}'),
            ),
            Container(
              child: Text(
                  '屏幕宽度:${ScreenAdaptationUtil.getInstance().screenWidth}'),
            ),
            Container(
              child: Text(
                  '屏幕高度:${ScreenAdaptationUtil.getInstance().screenHeight}'),
            ),
            Container(
              child:
                  Text('屏幕密度:${ScreenAdaptationUtil.getInstance().pixelRatio}'),
            ),
            Container(
              child: Text(
                  '文字缩放比例:${ScreenAdaptationUtil.getInstance().textScaleFactor}'),
            ),
            Container(
              child: Text(
                  '状态栏高度:${ScreenAdaptationUtil.getInstance().statusBarHeight}'),
            ),
            Container(
              child: Text(
                  '底部安全距离:${ScreenAdaptationUtil.getInstance().bottomBarHeight}'),
            ),
            Container(
              child: Text(
                  '是否允许字体根据系统缩放变化:${ScreenAdaptationUtil.getInstance().allowFontScaling}'),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.w),
              child: Text(
                '不会根据系统缩放变化的文字',
                style: TextStyle(
                    fontSize: ScreenAdaptationUtil.getInstance()
                        .setSp(60, allowFontScaling: false)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.w),
              child: Text(
                '不会根据系统缩放变化的文字',
                style: TextStyle(fontSize: 60.sf),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.w),
              child: Text(
                '因为ScreenAdaptationInit allowFontScaling默认为false 我也不会变化',
                style: TextStyle(fontSize: 60.s),
              ),
            ),
            Container(
              child: Text(
                '会根据系统缩放变化的文字 缩放了 ${ScreenAdaptationUtil.getInstance().textScaleFactor}',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: ScreenAdaptationUtil.getInstance()
                        .setSp(60, allowFontScaling: true)),
              ),
            ),
            Container(
              child: Text(
                '会根据系统缩放变化的文字 缩放了 ${ScreenAdaptationUtil.getInstance().textScaleFactor}',
                style: TextStyle(color: Colors.blueGrey, fontSize: 60.st),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: TextButton(
        onPressed: () => Navigator.maybePop(context),
        child: Container(
          height: 100.w,
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(
            '返回',
            style: TextStyle(color: Colors.white, fontSize: 40.s),
          ),
        ),
      ),
    );
  }
}
