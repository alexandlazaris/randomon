import 'package:flutter/material.dart';

class Pokemon {
  final String? id;
  final String? name;
  final String? type1;
  final String? type2;
  final String? spriteUrl;

  //TODO: add base stat total
  //TODO: potentially add switch case here to extract types and create coloured boxes for each type found
  Pokemon(
      {required this.id,
      required this.name,
      required this.type1,
      this.type2,
      required this.spriteUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    print(json['id']);
    print(json['name'].toString().toUpperCase());
    print(json['types'][0]['type']['name'].toString().toUpperCase());
    List<dynamic> types = json['types'];
    print(types.length);
    var po;
    if (types.length == 1) {
      return Pokemon(
          id: json['id'].toString(),
          name: json['name'].toString().toUpperCase(),
          type1: json['types'][0]['type']['name'].toString().toUpperCase(),
          type2: "",
          spriteUrl: json['sprites']['versions']['generation-v']['black-white']
                  ['animated']['front_default'] ??
              json['sprites']['other']['showdown']['front_default']);
    } else if (types.length == 2) {
      return Pokemon(
          id: json['id'].toString(),
          name: json['name'].toString().toUpperCase(),
          type1: json['types'][0]['type']['name'].toString().toUpperCase(),
          type2: json['types'][1]['type']['name'].toString().toUpperCase(),
          spriteUrl: json['sprites']['versions']['generation-v']['black-white']
                  ['animated']['front_default'] ??
              json['sprites']['other']['showdown']['front_default']);
    }
    throw Error();
    // print(hasSecondType.isEmpty ? "is empty" : "not empty");
    // return Pokemon(
    //     id: json['id'].toString(),
    //     name: json['name'].toString().toUpperCase(),
    //     type1: json['types'][0]['type']['name'].toString().toUpperCase(),
    //     type2: "",
    //     spriteUrl: json['sprites']['versions']['generation-v']['black-white']
    //             ['animated']['front_default'] ??
    //         json['sprites']['other']['showdown']['front_default']);
  }
}
