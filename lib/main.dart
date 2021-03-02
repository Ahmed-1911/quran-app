import 'package:audio_service/audio_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/views/play-page/play-page.dart';

void main() => runApp(DevicePreview(builder: (context)=>AudioServiceWidget(child: MyApp())));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    return ScreenUtilInit(
      designSize: Size(411, 877),
      allowFontScaling: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quran',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Play(),
      ),
    );
  }
}
