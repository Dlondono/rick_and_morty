class EpisodeResponse {
  EpisodeResponse({
    required this.info,
    required this.results,
  });
  late final Info info;
  late final List<EpisodeModel> results;

  EpisodeResponse.fromJson(Map<String, dynamic> json){
    info = Info.fromJson(json['info']);
    results = List.from(json['results']).map((e)=>EpisodeModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['info'] = info.toJson();
    _data['results'] = results.map((e)=>e.toJson()).toList();
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

class EpisodeModel {
  EpisodeModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });
  late final int id;
  late final String name;
  late final String airDate;
  late final String episode;
  late final List<String> characters;
  late final String url;
  late final String created;

  EpisodeModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    airDate = json['air_date'];
    episode = json['episode'];
    characters = List.castFrom<dynamic, String>(json['characters']);
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['air_date'] = airDate;
    _data['episode'] = episode;
    _data['characters'] = characters;
    _data['url'] = url;
    _data['created'] = created;
    return _data;
  }
}