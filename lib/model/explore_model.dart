import 'package:explorer/utils/magic_string.dart';

class Explore {
  late String imgUrl;
  late String name;
  late String location;
  late int cost;

  Explore({
    required this.imgUrl,
    required this.name,
    required this.location,
    required this.cost,
  });

  Explore.fromJson(Map<String, dynamic> json) {
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

final bali = Explore(
    imgUrl: ImageNames.bali,
    name: "Bali",
    location: "Komodo National Park",
    cost: 56);

final grayMountain = Explore(
    imgUrl: ImageNames.bali,
    name: "Gray Mountain",
    location: "Komodo National Park",
    cost: 62);

List<Explore> explore = [
  bali,
  grayMountain,
];
