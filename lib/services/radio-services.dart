import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran/models/radio-list.dart';

class RadioApi{
  String apiKey='5748c9cc927b2d946e4d0c007bb63972';
  Future<List<Radio>> fetchRadioList() async {
    try {
      var url = 'http://api.mp3quran.net/radios/radio_english.json';
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (response.statusCode == 200) {
        ListOfRadios rList = ListOfRadios.fromJson(extractedData);
        List radioList=rList.radios.map((e) => Radio.fromJson(e)).toList();
        return radioList;
      }
      else {
        print(response.statusCode);
      }
    }
    catch (e) {
      print(e);
      return null;
    }
  }
}