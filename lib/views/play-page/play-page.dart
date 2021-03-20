import 'dart:math';
import 'package:rxdart/rxdart.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/services/AudioPlayer.dart';

import '../test.dart';
/*
class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  final BehaviorSubject<double> _dragPositionSubject =
  BehaviorSubject.seeded(null);
  List<MediaItem> queue = [];

  bool _loading;
  @override
  void initState() {
    super.initState();
    /*if(AudioService.running==true)
      AudioService.stop();*/
    _loading = false;

    for (int i = 0; i < 1; i++) {
      queue.add(
        MediaItem(
        id: "https://server11.mp3quran.net/hazza/015.mp3",
        album: "قرآن",
        title: "سُورَةُ ٱلْفَاتِحَةِ",
        artist: "مشاري بن راشد",
        playable: true,
        duration: Duration(milliseconds: 50739),
        //artUri: "https://images-na.ssl-images-amazon.com/images/I/71Dpex3OrOL.png",
      ),);
    }
    _startAudioPlayerBtn();
  }

  double seekPos,position;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primColor,
      body: Column(
        children: <Widget>[
          myContainerAppBar('مشاري'),
          StreamBuilder<AudioState>(
            stream: _audioStateStream,
              builder: (context, snapshot) {
                final audioState = snapshot.data;
                final queue = audioState?.queue;
                final mediaItem = audioState?.mediaItem;
                final playbackState = audioState?.playbackState;
                final processingState =
                    playbackState?.processingState ?? AudioProcessingState.none;
                final playing = playbackState?.playing ?? false;
                return Container(
                  height: 0.93.sh,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        left: -(1.sw),
                        child: Container(
                          height: 0.93.sh,
                          width: 2.sw,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(800.r)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AnimatedContainer(
                              duration: Duration(seconds: 2),
                              curve: Curves.bounceInOut,
                              height: 150.h,
                              width: 150.h,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: primColor,
                                      width: 3.sp
                                  ),
                                  borderRadius: BorderRadius.circular(50.r)
                              ),
                              child: myImageContainer(context, '')
                          ),
                          autoText('سوره المائدة', 1, 17.ssp, FontWeight.w700,
                              Colors.black),
                          autoText(
                              'رواية حفص عن عاصم', 1, 10.ssp, FontWeight.w400,
                              Colors.black54),
                          StreamBuilder(
                            stream: Rx.combineLatest2<double, double, double>(
                                _dragPositionSubject.stream,
                                Stream.periodic(Duration(milliseconds: 20)),
                                    (dragPosition, _) => dragPosition),


                            builder: (context, snapshot) {

                              //print(snapshot.data.toString()+"*********************************************************");
                              position = snapshot.data  ?? playbackState.currentPosition.inMilliseconds.toDouble();
                               double duration = mediaItem?.duration?.inMilliseconds?.toDouble();
                              return Column(
                                children: [
                                  if (duration != null)
                                    Slider(
                                      min: 0.0,
                                      max: duration,
                                      value: max(0.0, min(position, duration)),
                                      activeColor: primColor,
                                      inactiveColor: Colors.grey,
                                      onChanged: (value) {
                                        _dragPositionSubject.add(value);
                                      },
                                      onChangeEnd: (value) {
                                        position = value;
                                        AudioService.seekTo(Duration(milliseconds: value.toInt()));
                                        _dragPositionSubject.add(null);
                                      },
                                    ),
                                  //    autoText("${state.currentPosition}",1,17.ssp,FontWeight.w700,Colors.black),
                                ],
                              );
                            },
                          ),
                          //positionIndicator(mediaItem, playbackState),
                     /*     Slider(
                            value: 5,
                            onChanged: (value) => {},
                            activeColor: primColor,
                            max: 20,
                          ),*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    position=0.0;
                                   });
                                  AudioService.seekTo(Duration(milliseconds: 0));

                                  AudioService.pause();
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 30.h,
                                  child: Icon(
                                   Icons.stop,
                                    color: primColor, size: 20.sp,),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      border: Border.all(
                                          color: primColor,
                                          width: 1.5.sp
                                      )
                                  ),
                                ),
                              ),
                              playing?
                              GestureDetector(
                                onTap:  AudioService.pause,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                                  height: 50.h,
                                  width: 50.h,
                                  child:  Icon(
                                    Icons.pause,
                                    color: Colors.white,
                                      size: 40.sp,),
                                  decoration: BoxDecoration(
                                      color: primColor,
                                      borderRadius: BorderRadius.circular(40.r),
                                      border: Border.all(
                                          color: primColor,
                                          width: 1.5.sp
                                      )
                                  ),
                                ),
                              ):
                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    if(position==0)
                                      position=50;
                                  });
                                  AudioService.play();
                                  },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                                  height: 50.h,
                                  width: 50.h,
                                  child:  Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 40.sp,),
                                  decoration: BoxDecoration(
                                      color: primColor,
                                      borderRadius: BorderRadius.circular(40.r),
                                      border: Border.all(
                                          color: primColor,
                                          width: 1.5.sp
                                      )
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap:AudioService.rewind ,
                                child: Container(
                                  height: 30.h,
                                  width: 30.h,
                                  child: Icon(Icons.repeat, color: primColor, size: 20.sp,),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      border: Border.all(
                                          color: primColor,
                                          width: 1.5.sp
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }


  _startAudioPlayerBtn() async {
    List<dynamic> list = List();
    for (int i = 0; i < queue.length; i++) {
      var m = queue[i].toJson();
      list.add(m);
    }
    var params = {"data": list};
        setState(() {
          _loading = true;
        });
        await AudioService.start(
          androidEnableQueue:true,
          androidNotificationClickStartsActivity: true,
          androidStopForegroundOnPause: true,
          androidResumeOnClick: true,
          androidNotificationChannelDescription: 'ya rab ',
          androidArtDownscaleSize: Size.fromHeight(50),
          androidNotificationOngoing: true,
          backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
          androidNotificationChannelName: 'Audio Player',
          androidNotificationColor: 0xFFFFFFFF,
          androidNotificationIcon: 'mipmap/ic_launcher',
          params: params,
        );
    await AudioServiceBackground.setState(
        controls:  [
          skipToPreviousControl,
          pauseControl,
          stopControl,
          skipToNextControl
        ],
    );
    setState(() {
          _loading = false;
        });
      }

  Widget positionIndicator(MediaItem mediaItem, PlaybackState state) {
    double seekPos;
    return StreamBuilder(
      stream: Rx.combineLatest2<double, double, double>(
          _dragPositionSubject.stream,
          Stream.periodic(Duration(milliseconds: 50)),
              (dragPosition, _) => dragPosition),
      builder: (context, snapshot) {
        double position = snapshot.data ?? state.currentPosition.inMilliseconds.toDouble();
        double duration = mediaItem?.duration?.inMilliseconds?.toDouble();
        return Column(
          children: [
            if (duration != null)
              Slider(
                min: 0.0,
                max: duration,
                value: seekPos ?? max(0.0, min(position, duration)),
                activeColor: primColor,
                inactiveColor: Colors.grey,
                onChanged: (value) {
                  _dragPositionSubject.add(value);
                },
                onChangeEnd: (value) {
                  AudioService.seekTo(Duration(milliseconds: value.toInt()));
                  seekPos = value;
                  _dragPositionSubject.add(null);
                },
              ),
          ],
        );
      },
    );
  }

  List<MediaControl> getControls() {
        [
        skipToPreviousControl,
        pauseControl,
        stopControl,
        skipToNextControl
      ];
  }
  MediaControl playControl = MediaControl(
    androidIcon: 'https://cdn2.vectorstock.com/i/1000x1000/60/26/play-button-for-video-or-music-play-icon-vector-20716026.jpg',
    label: 'Play',
    action: MediaAction.play,
  );
  MediaControl pauseControl = MediaControl(
    androidIcon: 'https://cdn2.vectorstock.com/i/1000x1000/60/26/play-button-for-video-or-music-play-icon-vector-20716026.jpg',
    label: 'Pause',
    action: MediaAction.pause,
  );
  MediaControl skipToNextControl = MediaControl(
    androidIcon: 'https://cdn2.vectorstock.com/i/1000x1000/60/26/play-button-for-video-or-music-play-icon-vector-20716026.jpg',
    label: 'Next',
    action: MediaAction.skipToNext,
  );
  MediaControl skipToPreviousControl = MediaControl(
    androidIcon: 'https://cdn2.vectorstock.com/i/1000x1000/60/26/play-button-for-video-or-music-play-icon-vector-20716026.jpg',
    label: 'Previous',
    action: MediaAction.skipToPrevious,
  );
  MediaControl stopControl = MediaControl(
    androidIcon: 'https://cdn2.vectorstock.com/i/1000x1000/60/26/play-button-for-video-or-music-play-icon-vector-20716026.jpg',
    label: 'Stop',
    action: MediaAction.stop,
  );

}



Stream<AudioState> get _audioStateStream {
  return Rx.combineLatest3<List<MediaItem>, MediaItem, PlaybackState,
      AudioState>(
    AudioService.queueStream,
    AudioService.currentMediaItemStream,
    AudioService.playbackStateStream,
        (queue, mediaItem, playbackState) => AudioState(
      queue,
      mediaItem,
      playbackState,
    ),
  );
}

void _audioPlayerTaskEntrypoint(List list) async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}
*/