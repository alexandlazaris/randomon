class Pokemon {
  final String? id;
  final String? name;
  final List<String>? types;
  final String? spriteUrl;
  //TODO: add base stat total
  //TODO: add switch case to extract types and create coloured boxes for each type found
  //TODO: find out why app doesn't make API call on device

  Pokemon(
      {required this.id,
      required this.name,
      required this.types,
      required this.spriteUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: '#${json['id'].toString()}',
        name: json['name'],
        types: List<String>.from(json['types'].map((x) => (x['type']['name']))),
        spriteUrl: json['sprites']['other']['showdown']['front_default']);
  }
}
