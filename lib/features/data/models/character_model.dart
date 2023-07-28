class CharacterReponse {
  Info info;
  List<CharacterModel> characters;

  CharacterReponse({required this.info, required this.characters});

  CharacterReponse.fromJson(Map<String, dynamic> json):
    info = Info.fromJson(json['info']),
        characters= json['results'] == null ? <CharacterModel>[]
        : List<CharacterModel>.from(
      json["results"].map((x) => CharacterModel.fromJson(x)),
    );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (info != null) {
      data['info'] = info.toJson();
    }
    if (characters != null) {
      data['characters'] = characters.map((v) => v.toJson()).toList();
    }
    return data;
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

class CharacterModel {
  int? id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin origin;
  Origin location;
  String image;
  List<String> episode;
  String url;
  String created;

  CharacterModel(
      {this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
        required this.episode,
        required this.url,
        required this.created});

  CharacterModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    name = json['name'],
    status = json['status'],
    species = json['species'],
    type = json['type'],
    gender = json['gender'],
    origin =Origin.fromJson(json['origin']) ,
    location =Origin.fromJson(json['location']),
    image = json['image'],
    episode = json['episode'].cast<String>(),
    url = json['url'],
    created = json['created'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['image'] = image;
    data['episode'] = episode;
    data['url'] = url;
    data['created'] = created;
    return data;
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
