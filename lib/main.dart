import 'package:audio_service/audio_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/models/radio-list.dart';
import 'package:quran/views/home/home.dart';
import 'package:quran/views/list-of-reciters/list-of-reciters.dart';
import 'package:quran/views/list-of-seur/list-of-sur.dart';
import 'package:quran/views/play-page/play-page.dart';
import 'package:quran/views/radio-list/radio-list.dart';

void main() => runApp(DevicePreview(builder: (context)=>AudioServiceWidget(child: MyApp())));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 877),
      allowFontScaling: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quran',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
