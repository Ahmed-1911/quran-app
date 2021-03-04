class ListOfReciters {
  ListOfReciters({
    this.reciters,
  });

  List<dynamic> reciters;

  factory ListOfReciters.fromJson(Map<String, dynamic> json) => ListOfReciters(
    reciters: json["reciters"]
  );
}

class Reciter {
  Reciter({
    this.id,
    this.name,
    this.server,
    this.rewaya,
    this.count,
    this.letter,
  });

  String id;
  String name;
  String server;
  String rewaya;
  String count;
  String letter;

  factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
    id: json["id"],
    name: json["name"],
    server: json["Server"],
    rewaya: json["rewaya"],
    count: json["count"],
    letter: json["letter"],
  );

}
