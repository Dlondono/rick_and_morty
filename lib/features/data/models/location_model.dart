class LocationResponse {
  LocationResponse({
    required this.info,
    required this.locations,
  });
  late final Info info;
  late final List<LocationModel> locations;

  LocationResponse.fromJson(Map<String, dynamic> json){
    info = Info.fromJson(json['info']);
    locations = List.from(json['results']).map((e)=>LocationModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['info'] = info.toJson();
    _data['results'] = locations.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Info {
  int? count;
  int? pages;
  String? next;
  String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    data['prev'] = prev;
    return data;
  }
}

class LocationModel {
  LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
  late final int id;
  late final String name;
  late final String type;
  late final String dimension;
  late final List<String> residents;
  late final String url;
  late final String created;

  LocationModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents = List.castFrom<dynamic, String>(json['residents']);
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['dimension'] = dimension;
    _data['residents'] = residents;
    _data['url'] = url;
    _data['created'] = created;
    return _data;
  }
}