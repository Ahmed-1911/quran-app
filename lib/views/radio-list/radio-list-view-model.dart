import 'package:flutter/cupertino.dart';
import 'package:quran/models/radio-list.dart';
import 'package:quran/services/radio-services.dart';

class RadioProvider extends ChangeNotifier{
  List<RadioModel> radioList = [];
  get getRadioList =>radioList;
  fetchRadioList()async{
    radioList =await RadioApi().fetchRadioList();
    notifyListeners();
  }
}