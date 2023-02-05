import 'package:explorer/utils/magic_string.dart';

class Places {
  late String imgUrl;
  late String name;
  late String location;
  late int cost;

  Places({
    required this.imgUrl,
    required this.name,
    required this.location,
    required this.cost,
  });

  Places.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    name = json['name'];
    location = json['location'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imgUrl'] = imgUrl;
    data['name'] = name;
    data['location'] = location;
    data['cost'] = cost;

    return data;
  }
}

//Lamps
final padar_island = Places(
    imgUrl: ImageNames.poland_island,
    name: "Padar Island",
    location: "Komodo National Park",
    cost: 72);

final skylar = Places(
    imgUrl: ImageNames.skylar,
    name: "Padar Island",
    location: "Komodo National Park",
    cost: 68);

List<Places> places = [
  padar_island,
  skylar,
];
