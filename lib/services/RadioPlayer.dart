import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';

class RadioPlayerProvider extends ChangeNotifier{
  String playNow='';
  FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();

  get getRadioPlayer => _flutterRadioPlayer.isPlayingStream;
  get togglePlayer => _flutterRadioPlayer.playOrPause();
  get getPlayNow => playNow;

  Future<void> initRadioService() async {
    try {
      await _flutterRadioPlayer.init("Radio Channel", "Live", "http://live.mp3quran.net:9992/;", "false");
    } on PlatformException {
      print("Exception occurred while trying to register the services.");
    }
  }

  Future<void> changeServer(String server) async {
      _flutterRadioPlayer.setUrl(server, "true");
      playNow=server;
      notifyListeners();
  }
}