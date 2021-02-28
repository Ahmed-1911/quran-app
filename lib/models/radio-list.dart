class ListOfRadios {
  ListOfRadios({
    this.radios,
  });

  List<dynamic> radios;

  factory ListOfRadios.fromJson(Map<String, dynamic> json) => ListOfRadios(
    radios: json["radios"],
  );

}

class Radio {
  Radio({
    this.name,
    this.radioUrl,
  });

  String name;
  String radioUrl;

  factory Radio.fromJson(Map<String, dynamic> json) => Radio(
    name: json["name"],
    radioUrl: json["radio_url"],
  );
}