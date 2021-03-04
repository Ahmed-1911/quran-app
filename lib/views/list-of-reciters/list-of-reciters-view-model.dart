import 'package:flutter/cupertino.dart';
import 'package:quran/models/reciter.dart';
import 'package:quran/services/reciter-services.dart';

class RecitersProvider extends ChangeNotifier{
  List<Reciter> recitersList = [];
  get getRecitersList => recitersList;
  fetchRecitersList(String condition)async{
    recitersList = await ReciterApi().fetchRecitersList(condition);
    notifyListeners();
  }
}