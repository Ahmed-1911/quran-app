class ListOfRadios {
  ListOfRadios({
    this.radios,
  });

  List<dynamic> radios;

  factory ListOfRadios.fromJson(Map<String, dynamic> json) => ListOfRadios(
    radios: json["radios"],
  );

}

class RadioModel {
  RadioModel({
    this.name,
    this.radioUrl,
  });

  String name;
  String radioUrl;

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
    name: json["name"],
    radioUrl: json["radio_url"],
  );
}