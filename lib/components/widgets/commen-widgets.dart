import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/models/famous-radio.dart';
import 'package:quran/services/RadioPlayer.dart';
import 'package:quran/services/RadioPlayer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'dart:async';
myContainerAppBar(String title){
  return Container(
      height: 0.07.sh,
      color: primColor,
      alignment: Alignment.center,
      child:autoText(title, 1, 17.ssp, FontWeight.w700, Colors.white)
  );
}

//******************************************************
myAppBar(String title){
  return AppBar(
      backgroundColor: primColor,
      elevation: 0,
      centerTitle: true,
      title:autoText(title, 1, 19.ssp, FontWeight.w700, Colors.white)
  );
}

//******************************************************
SpinKitWave spinKit(BuildContext context) {
  return SpinKitWave(
    color: Colors.white,
    size: 50.0,
  );
}

//******************************************************
AutoSizeText autoText(String text, int maxLine, double fontSize,FontWeight fontWeight, Color color ) {
  return AutoSizeText(text,
      maxLines: maxLine,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style:GoogleFonts.elMessiri(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      )
  );
}

//******************************************************
myImageContainer(BuildContext context,String image){
  return ClipRRect(
    borderRadius: BorderRadius.circular(47.r),
    child: ProgressiveImage(
      placeholder: AssetImage('assets/images/loading.gif'),
      thumbnail: NetworkImage(
          'https://i.pinimg.com/originals/6c/07/09/6c07096f19511c98a0c861f3470e198a.jpg'),
      image: NetworkImage(
          'https://i.pinimg.com/originals/6c/07/09/6c07096f19511c98a0c861f3470e198a.jpg'),
      fadeDuration: Duration(seconds: 2),
      excludeFromSemantics: true,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width ,
      fit: BoxFit.fill,
    ),
  );
}


//************************************************************
Selector radioRunContainer(var item,double contHeight2){
  return Selector<RadioPlayerProvider,Stream<String>>(
    selector: (context,getRadioPlayer){
      getRadioPlayer.initRadioService();
      return getRadioPlayer.getRadioPlayer;},
    builder:(ctx, radioPlayer, widget)=> StreamBuilder(
        stream: radioPlayer,
        initialData:FlutterRadioPlayer.flutter_radio_paused,
        builder: (context, AsyncSnapshot<String> snapshot) {
          String returnData = snapshot.data;
          switch (returnData) {
            case FlutterRadioPlayer.flutter_radio_stopped:
              return Consumer<RadioPlayerProvider>(
                builder:(ctx, radioChange, widget)=> GestureDetector(
                  onTap: ()async{
                    item.radioUrl==radioChange.getPlayNow?
                    await radioChange.togglePlayer:
                    radioChange.changeServer(item.radioUrl);
                  },
                  child: Selector<RadioPlayerProvider,String>(
                    selector: (context,getPlay)=>getPlay.getPlayNow,
                    builder:(context,playNow,widget)=>
                        AnimatedContainer(
                      duration: Duration(seconds: 3),
                      curve: Curves.bounceInOut,
                      height: contHeight2,
                      width: 0.1.sh,
                      margin: EdgeInsets.all(7.sp),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                              color: primColor, width: 2.sp),
                          image: DecorationImage(
                            image: NetworkImage('https://jekashop.com/media/catalog/product/cache/12ad95d8a2fb3df88ee5f5df1ef6c6e8/d/9/d9pm16520-as200.jpg'),
                            fit: BoxFit.fill,
                            //colorFilter: ColorFilter.mode(Colors.black12, BlendMode.srcOver)
                          ),
                          boxShadow: [myBoxShadow]),
                    ),
                  ),
                ),
              );
              break;
            case FlutterRadioPlayer.flutter_radio_loading:
              return  Selector<RadioPlayerProvider,String>(
                selector: (context,getPlay)=>getPlay.getPlayNow,
                builder:(context,playNow,widget)=> AnimatedContainer(
                  duration: Duration(seconds: 3),
                  curve: Curves.bounceInOut,
                  height: contHeight2,
                  width: 0.1.sh,
                  margin: EdgeInsets.all(7.sp),
                  //alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: primColor, width: 2.sp),
                      image: DecorationImage(
                        image: NetworkImage(
                            playNow==item.radioUrl ?
                            'https://jokercodes.com//assets/imgs/ajax-loader.gif':
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjMML9kORyTVKM5lUsJkg29Sc4H-zmIwwJUA&usqp=CAU'
                        ),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [myBoxShadow]),
                ),
              );
            case FlutterRadioPlayer.flutter_radio_error:
              return RaisedButton(
                  child: Text("Retry ?"),
                  onPressed: () async {
                    // await initRadioService();
                  });
              break;
            default:
              return Consumer<RadioPlayerProvider>(
                builder:(ctx, radioChange, widget)=> GestureDetector(
                  onTap: ()async{
                    item.radioUrl==radioChange.getPlayNow?
                    await radioChange.togglePlayer:
                    await radioChange.changeServer(item.radioUrl);
                  },
                  child: Selector<RadioPlayerProvider,String>(
                    selector: (context,getPlay)=>getPlay.getPlayNow,
                    builder:(context,playNow,widget)=> AnimatedContainer(
                      duration: Duration(seconds: 3),
                      curve: Curves.bounceInOut,
                      height: contHeight2,
                      margin: EdgeInsets.all(7.sp),
                     // alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(color: primColor, width: 2.sp),
                          image: DecorationImage(
                            image: NetworkImage(
                                playNow==item.radioUrl && snapshot.data == FlutterRadioPlayer.flutter_radio_playing?
                                'https://i.gifer.com/Pf0j.gif':
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjMML9kORyTVKM5lUsJkg29Sc4H-zmIwwJUA&usqp=CAU'
                            ),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [myBoxShadow]),
                    ),
                  ),
                ),
              );
              break;
          }
        }
    ),
  );
}