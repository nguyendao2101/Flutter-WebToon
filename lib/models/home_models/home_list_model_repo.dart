// ignore_for_file: unnecessary_this, unnecessary_getters_setters, unnecessary_new, prefer_collection_literals

class GetListMangaHomeResponse {
  Data? _data;

  GetListMangaHomeResponse({Data? data}) {
    if (data != null) {
      this._data = data;
    }
  }

  Data? get data => _data;
  set data(Data? data) => _data = data;

  GetListMangaHomeResponse.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  List<SpotlightMangas>? _spotlightMangas;
  List<NewChapterMangas>? _newChapterMangas;

  Data(
      {List<SpotlightMangas>? spotlightMangas,
      List<NewChapterMangas>? newChapterMangas}) {
    if (spotlightMangas != null) {
      this._spotlightMangas = spotlightMangas;
    }
    if (newChapterMangas != null) {
      this._newChapterMangas = newChapterMangas;
    }
  }

  List<SpotlightMangas>? get spotlightMangas => _spotlightMangas;
  set spotlightMangas(List<SpotlightMangas>? spotlightMangas) =>
      _spotlightMangas = spotlightMangas;
  List<NewChapterMangas>? get newChapterMangas => _newChapterMangas;
  set newChapterMangas(List<NewChapterMangas>? newChapterMangas) =>
      _newChapterMangas = newChapterMangas;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['spotlight_mangas'] != null) {
      _spotlightMangas = <SpotlightMangas>[];
      json['spotlight_mangas'].forEach((v) {
        _spotlightMangas!.add(new SpotlightMangas.fromJson(v));
      });
    }
    if (json['new_chapter_mangas'] != null) {
      _newChapterMangas = <NewChapterMangas>[];
      json['new_chapter_mangas'].forEach((v) {
        _newChapterMangas!.add(new NewChapterMangas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._spotlightMangas != null) {
      data['spotlight_mangas'] =
          this._spotlightMangas!.map((v) => v.toJson()).toList();
    }
    if (this._newChapterMangas != null) {
      data['new_chapter_mangas'] =
          this._newChapterMangas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpotlightMangas {
  int? _id;
  String? _name;
  String? _panoramaUrl;
  String? _panoramaMobileUrl;
  String? _panoramaDominantColor;
  String? _panoramaDominantColor2;
  String? _description;

  SpotlightMangas(
      {int? id,
      String? name,
      String? panoramaUrl,
      String? panoramaMobileUrl,
      String? panoramaDominantColor,
      String? panoramaDominantColor2,
      String? description}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (panoramaUrl != null) {
      this._panoramaUrl = panoramaUrl;
    }
    if (panoramaMobileUrl != null) {
      this._panoramaMobileUrl = panoramaMobileUrl;
    }
    if (panoramaDominantColor != null) {
      this._panoramaDominantColor = panoramaDominantColor;
    }
    if (panoramaDominantColor2 != null) {
      this._panoramaDominantColor2 = panoramaDominantColor2;
    }
    if (description != null) {
      this._description = description;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get panoramaUrl => _panoramaUrl;
  set panoramaUrl(String? panoramaUrl) => _panoramaUrl = panoramaUrl;
  String? get panoramaMobileUrl => _panoramaMobileUrl;
  set panoramaMobileUrl(String? panoramaMobileUrl) =>
      _panoramaMobileUrl = panoramaMobileUrl;
  String? get panoramaDominantColor => _panoramaDominantColor;
  set panoramaDominantColor(String? panoramaDominantColor) =>
      _panoramaDominantColor = panoramaDominantColor;
  String? get panoramaDominantColor2 => _panoramaDominantColor2;
  set panoramaDominantColor2(String? panoramaDominantColor2) =>
      _panoramaDominantColor2 = panoramaDominantColor2;
  String? get description => _description;
  set description(String? description) => _description = description;

  SpotlightMangas.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _panoramaUrl = json['panorama_url'];
    _panoramaMobileUrl = json['panorama_mobile_url'];
    _panoramaDominantColor = json['panorama_dominant_color'];
    _panoramaDominantColor2 = json['panorama_dominant_color_2'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['panorama_url'] = this._panoramaUrl;
    data['panorama_mobile_url'] = this._panoramaMobileUrl;
    data['panorama_dominant_color'] = this._panoramaDominantColor;
    data['panorama_dominant_color_2'] = this._panoramaDominantColor2;
    data['description'] = this._description;
    return data;
  }
}

class NewChapterMangas {
  int? _id;
  String? _name;
  String? _coverUrl;
  String? _coverMobileUrl;
  String? _newestChapterNumber;
  int? _newestChapterId;
  String? _newestChapterCreatedAt;

  NewChapterMangas(
      {int? id,
      String? name,
      String? coverUrl,
      String? coverMobileUrl,
      String? newestChapterNumber,
      int? newestChapterId,
      String? newestChapterCreatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (coverUrl != null) {
      this._coverUrl = coverUrl;
    }
    if (coverMobileUrl != null) {
      this._coverMobileUrl = coverMobileUrl;
    }
    if (newestChapterNumber != null) {
      this._newestChapterNumber = newestChapterNumber;
    }
    if (newestChapterId != null) {
      this._newestChapterId = newestChapterId;
    }
    if (newestChapterCreatedAt != null) {
      this._newestChapterCreatedAt = newestChapterCreatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get coverUrl => _coverUrl;
  set coverUrl(String? coverUrl) => _coverUrl = coverUrl;
  String? get coverMobileUrl => _coverMobileUrl;
  set coverMobileUrl(String? coverMobileUrl) =>
      _coverMobileUrl = coverMobileUrl;
  String? get newestChapterNumber => _newestChapterNumber;
  set newestChapterNumber(String? newestChapterNumber) =>
      _newestChapterNumber = newestChapterNumber;
  int? get newestChapterId => _newestChapterId;
  set newestChapterId(int? newestChapterId) =>
      _newestChapterId = newestChapterId;
  String? get newestChapterCreatedAt => _newestChapterCreatedAt;
  set newestChapterCreatedAt(String? newestChapterCreatedAt) =>
      _newestChapterCreatedAt = newestChapterCreatedAt;

  NewChapterMangas.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _coverUrl = json['cover_url'];
    _coverMobileUrl = json['cover_mobile_url'];
    _newestChapterNumber = json['newest_chapter_number'];
    _newestChapterId = json['newest_chapter_id'];
    _newestChapterCreatedAt = json['newest_chapter_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['cover_url'] = this._coverUrl;
    data['cover_mobile_url'] = this._coverMobileUrl;
    data['newest_chapter_number'] = this._newestChapterNumber;
    data['newest_chapter_id'] = this._newestChapterId;
    data['newest_chapter_created_at'] = this._newestChapterCreatedAt;
    return data;
  }
}
