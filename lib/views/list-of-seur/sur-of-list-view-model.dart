import 'package:flutter/cupertino.dart';
import 'package:quran/models/sura-list.dart';
import 'package:quran/services/sur-services.dart';

class SurProvider extends ChangeNotifier{
  List<SuraModel> surList = [];
  get getSurList => surList;
  fetchsurList()async{
    surList = await SurApi().fetchSurList();
    notifyListeners();
  }
}