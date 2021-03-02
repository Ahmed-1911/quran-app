import 'dart:math';
import 'package:rxdart/rxdart.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/services/AudioPlayer.dart';

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  final BehaviorSubject<double> _dragPositionSubject =
  BehaviorSubject.seeded(null);
  final _queue = <MediaItem>[];


  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
    for (int i = 0; i < 1; i++) {
      _queue.add(MediaItem(
        id: "https://server11.mp3quran.net/hazza/015.mp3",
        album: "قرآن",
        title: "سُورَةُ ٱلْفَاتِحَةِ",
        artist: "Science Friday and WNYC Studios",
        duration: Duration(milliseconds: 5739),
        artUri:
        "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
      ),);
    }
    _startAudioPlayerBtn();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primColor,
      body: Column(
        children: <Widget>[
          // myAppBar('مشاري'),
          myAppBar('مشاري'),
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
                        //   left: -(1.sw),
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
                          Slider(
                            value: 5,
                            onChanged: (value) => {},
                            activeColor: primColor,
                            max: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 30.h,
                                width: 30.h,
                                child: IconButton(
                                    icon: Icon(
                                    Icons.stop, color: primColor, size: 20.sp,),
                                  onPressed: AudioService.pause,

                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(
                                        color: primColor,
                                        width: 1.5.sp
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                height: 50.h,
                                width: 50.h,
                                child: IconButton(

                                  icon:  Icon(
                                    Icons.play_arrow, color: Colors.white,
                                    size: 40.sp,),
                                  onPressed: AudioService.play,
                                ),

                                decoration: BoxDecoration(
                                    color: primColor,
                                    borderRadius: BorderRadius.circular(40.r),
                                    border: Border.all(
                                        color: primColor,
                                        width: 1.5.sp
                                    )
                                ),
                              ),
                              Container(
                                height: 30.h,
                                width: 30.h,
                                child: Icon(
                                  Icons.repeat, color: primColor, size: 20.sp,),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(
                                        color: primColor,
                                        width: 1.5.sp
                                    )
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
    for (int i = 0; i < _queue.length; i++) {
      var m = _queue[i].toJson();
      list.add(m);
    }
    var params = {"data": list};

        setState(() {
          _loading = true;
        });
        await AudioService.start(
          backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
          androidNotificationChannelName: 'Audio Player',
          androidNotificationColor: 0xFF2196f3,
          androidNotificationIcon: 'mipmap/ic_launcher',
          params: params,
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
          Stream.periodic(Duration(milliseconds: 20)),
              (dragPosition, _) => dragPosition),
      builder: (context, snapshot) {
        double position =
            snapshot.data ?? state.currentPosition.inMilliseconds.toDouble();
        double duration = mediaItem?.duration?.inMilliseconds?.toDouble();
        return Column(
          children: [
            if (duration != null)
              Slider(
                min: 0.0,
                max: duration,
                value: seekPos ?? max(0.0, min(position, duration)),
                onChanged: (value) {
                  _dragPositionSubject.add(value);
                },
                onChangeEnd: (value) {
                  AudioService.seekTo(Duration(milliseconds: value.toInt()));
                  // Due to a delay in platform channel communication, there is
                  // a brief moment after releasing the Slider thumb before the
                  // new position is broadcast from the platform side. This
                  // hack is to hold onto seekPos until the next state update
                  // comes through.
                  // TODO: Improve this code.
                  seekPos = value;
                  _dragPositionSubject.add(null);
                },
              ),
            Text("${state.currentPosition}"),
          ],
        );
      },
    );
  }
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
void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}
