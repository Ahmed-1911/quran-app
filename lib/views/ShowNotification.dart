import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class shownotification extends StatefulWidget {
  @override
  _shownotificationState createState() => _shownotificationState();
}

class _shownotificationState extends State<shownotification> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var a=AudioPlayer();

  @override
  var d;
  void shroe() async{
     print("************************************************************************************");
     print(d.toString());
     print("************************************************************************************");

     print(a.getDuration());

   }
  void initState() {
     flutterLocalNotificationsPlugin=new FlutterLocalNotificationsPlugin();
    var andriod=new AndroidInitializationSettings("@mipmap/ic_launcher");
    var ios=new IOSInitializationSettings();
    var seting=new InitializationSettings(android: andriod,iOS: ios);
    flutterLocalNotificationsPlugin.initialize(seting);
    a.setUrl("https://server11.mp3quran.net/hazza/015.mp3",isLocal: false);
     super.initState();
    _repeatNotification();
  }

  Future<void> _showNotification(){
    var andriod=AndroidNotificationDetails("channelId", "channelName", "channelDescription",playSound: true,priority: Priority.high);
    var ios =IOSNotificationDetails();
    var platform=new NotificationDetails(iOS: ios,android: andriod);
    flutterLocalNotificationsPlugin.show(1, "title", "body", platform,payload: "Message");
  }

  Future<void> _showNotificationCustomSound() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description',
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      playSound: true,
     // sound: ,
    );
    const IOSNotificationDetails iOSPlatformChannelSpecifics =
    IOSNotificationDetails(sound: 'slow_spring_board.aiff');
    const MacOSNotificationDetails macOSPlatformChannelSpecifics =
    MacOSNotificationDetails(sound: 'slow_spring_board.aiff');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
        macOS: macOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0,
        'custom sound notification title',
        'custom sound notification body',
        platformChannelSpecifics);
  }

  Future<void> _repeatNotification() async {
     AndroidNotificationDetails androidPlatformChannelSpecifics =new AndroidNotificationDetails(
       'repeating channel id',
       'repeating channel name',
       'repeating description',
       sound: RawResourceAndroidNotificationSound("salah"),

    );
     NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'اذكار',
        'صلى على محمد', RepeatInterval.everyMinute, platformChannelSpecifics,

        androidAllowWhileIdle: true);
  }
  
  Future<void> _repeatScheduledNotification() async {
      var scheduledNotificationDateTime =
        new DateTime.now().add(new Duration(seconds: 5));

      AndroidNotificationDetails androidPlatformChannelSpecifics =new AndroidNotificationDetails(
       'repeating channel id',
       'repeating channel name',
       'repeating description',
       sound: RawResourceAndroidNotificationSound("salah"),

    );
     NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(0, 'اذكار',
        'صلى على محمد', scheduledNotificationDateTime, platformChannelSpecifics,

        androidAllowWhileIdle: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: FlatButton(
        child: Text("asd"),
        onPressed:shroe,
      ),
    ));
  }
}
