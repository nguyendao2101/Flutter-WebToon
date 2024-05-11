class GetDetailManga {
  MangaDetailData? mangaDetailData;

  GetDetailManga({this.mangaDetailData});

  GetDetailManga.fromJson(Map<String, dynamic> json) {
    mangaDetailData =
        json['data'] != null ? MangaDetailData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.mangaDetailData != null) {
      data['data'] = this.mangaDetailData!.toJson();
    }
    return data;
  }
}

class MangaDetailData {
  int? id;
  String? name;
  String? coverUrl;
  String? coverMobileUrl;
  String? panoramaUrl;
  String? panoramaMobileUrl;
  String? newestChapterNumber;
  int? newestChapterId;
  String? newestChapterCreatedAt;
  Author? author;
  String? description;
  String? fullDescription;
  String? officialUrl;
  bool? isRegionLimited;
  bool? isAds;
  int? chaptersCount;
  int? viewsCount;
  bool? isNsfw;
  List<Tags>? tags;
  Team? team;
  bool? isFollowing;
  List<Titles>? titles;
  String? createdAt;
  String? updatedAt;

  MangaDetailData(
      {this.id,
      this.name,
      this.coverUrl,
      this.coverMobileUrl,
      this.panoramaUrl,
      this.panoramaMobileUrl,
      this.newestChapterNumber,
      this.newestChapterId,
      this.newestChapterCreatedAt,
      this.author,
      this.description,
      this.fullDescription,
      this.officialUrl,
      this.isRegionLimited,
      this.isAds,
      this.chaptersCount,
      this.viewsCount,
      this.isNsfw,
      this.tags,
      this.team,
      this.isFollowing,
      this.titles,
      this.createdAt,
      this.updatedAt});

  MangaDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coverUrl = json['cover_url'];
    coverMobileUrl = json['cover_mobile_url'];
    panoramaUrl = json['panorama_url'];
    panoramaMobileUrl = json['panorama_mobile_url'];
    newestChapterNumber = json['newest_chapter_number'];
    newestChapterId = json['newest_chapter_id'];
    newestChapterCreatedAt = json['newest_chapter_created_at'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    description = json['description'];
    fullDescription = json['full_description'];
    officialUrl = json['official_url'];
    isRegionLimited = json['is_region_limited'];
    isAds = json['is_ads'];
    chaptersCount = json['chapters_count'];
    viewsCount = json['views_count'];
    isNsfw = json['is_nsfw'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    isFollowing = json['is_following'];
    if (json['titles'] != null) {
      titles = <Titles>[];
      json['titles'].forEach((v) {
        titles!.add(Titles.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover_url'] = coverUrl;
    data['cover_mobile_url'] = coverMobileUrl;
    data['panorama_url'] = panoramaUrl;
    data['panorama_mobile_url'] = panoramaMobileUrl;
    data['newest_chapter_number'] = newestChapterNumber;
    data['newest_chapter_id'] = newestChapterId;
    data['newest_chapter_created_at'] = newestChapterCreatedAt;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['description'] = description;
    data['full_description'] = fullDescription;
    data['official_url'] = officialUrl;
    data['is_region_limited'] = isRegionLimited;
    data['is_ads'] = isAds;
    data['chapters_count'] = chaptersCount;
    data['views_count'] = viewsCount;
    data['is_nsfw'] = isNsfw;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['is_following'] = isFollowing;
    if (titles != null) {
      data['titles'] = titles!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Author {
  String? name;

  Author({this.name});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Tags {
  String? name;
  String? slug;
  int? taggingCount;

  Tags({this.name, this.slug, this.taggingCount});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    taggingCount = json['tagging_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['tagging_count'] = taggingCount;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? description;
  bool? isAds;
  String? facebookAddress;
  int? viewsCount;
  int? translationsCount;
  String? createdAt;
  String? updatedAt;

  Team(
      {this.id,
      this.name,
      this.description,
      this.isAds,
      this.facebookAddress,
      this.viewsCount,
      this.translationsCount,
      this.createdAt,
      this.updatedAt});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isAds = json['is_ads'];
    facebookAddress = json['facebook_address'];
    viewsCount = json['views_count'];
    translationsCount = json['translations_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['is_ads'] = isAds;
    data['facebook_address'] = facebookAddress;
    data['views_count'] = viewsCount;
    data['translations_count'] = translationsCount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Titles {
  int? id;
  String? name;
  bool? primary;

  Titles({this.id, this.name, this.primary});

  Titles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    primary = json['primary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['primary'] = primary;
    return data;
  }
}
