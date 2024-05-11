// To parse this JSON data, do
//
//     final chapterDetailResponse = chapterDetailResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'chapter_detail_response.g.dart';

ChapterDetailResponse chapterDetailResponseFromJson(String str) =>
    ChapterDetailResponse.fromJson(json.decode(str));

String chapterDetailResponseToJson(ChapterDetailResponse data) =>
    json.encode(data.toJson());

@JsonSerializable(nullable: true)
class ChapterDetailResponse {
  @JsonKey(name: "data")
  ChapterDetailData data;

  ChapterDetailResponse({
    required this.data,
  });

  factory ChapterDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ChapterDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterDetailResponseToJson(this);
}

@JsonSerializable(nullable: true)
class ChapterDetailData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "number")
  String number;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "views_count")
  int? viewsCount;
  @JsonKey(name: "comments_count")
  int? commentsCount;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "previous_chapter_id")
  dynamic previousChapterId;
  @JsonKey(name: "previous_chapter_number")
  dynamic previousChapterNumber;
  @JsonKey(name: "previous_chapter_name")
  dynamic previousChapterName;
  @JsonKey(name: "next_chapter_id")
  int? nextChapterId;
  @JsonKey(name: "next_chapter_number")
  String nextChapterNumber;
  @JsonKey(name: "next_chapter_name")
  String nextChapterName;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "manga")
  Manga manga;
  @JsonKey(name: "team")
  Team team;
  @JsonKey(name: "pages")
  List<Page> pages;

  ChapterDetailData({
    required this.id,
    required this.order,
    required this.number,
    required this.name,
    required this.viewsCount,
    required this.commentsCount,
    required this.status,
    required this.previousChapterId,
    required this.previousChapterNumber,
    required this.previousChapterName,
    required this.nextChapterId,
    required this.nextChapterNumber,
    required this.nextChapterName,
    required this.createdAt,
    required this.updatedAt,
    required this.manga,
    required this.team,
    required this.pages,
  });

  factory ChapterDetailData.fromJson(Map<String, dynamic> json) =>
      _$ChapterDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterDetailDataToJson(this);
}

@JsonSerializable(nullable: true)
class Manga {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "cover_url")
  String coverUrl;
  @JsonKey(name: "panorama_url")
  String panoramaUrl;
  @JsonKey(name: "marginless")
  bool marginless;
  @JsonKey(name: "is_region_limited")
  bool isRegionLimited;
  @JsonKey(name: "direction")
  String direction;
  @JsonKey(name: "is_nsfw")
  bool isNsfw;

  Manga({
    required this.id,
    required this.name,
    required this.description,
    required this.coverUrl,
    required this.panoramaUrl,
    required this.marginless,
    required this.isRegionLimited,
    required this.direction,
    required this.isNsfw,
  });

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

  Map<String, dynamic> toJson() => _$MangaToJson(this);
}

@JsonSerializable(nullable: true)
class Page {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "width")
  int? width;
  @JsonKey(name: "height")
  int? height;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "image_url")
  String imageUrl;
  @JsonKey(name: "image_path")
  String imagePath;
  @JsonKey(name: "image_url_size")
  int? imageUrlSize;
  @JsonKey(name: "drm_data")
  String drmData;

  Page({
    required this.id,
    required this.order,
    required this.width,
    required this.height,
    required this.status,
    required this.imageUrl,
    required this.imagePath,
    required this.imageUrlSize,
    required this.drmData,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}

@JsonSerializable(nullable: true)
class Team {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "facebook_address")
  String facebookAddress;
  @JsonKey(name: "is_ads")
  bool isAds;
  @JsonKey(name: "translations_count")
  int? translationsCount;
  @JsonKey(name: "mangas_count")
  int? mangasCount;

  Team({
    required this.id,
    required this.name,
    required this.description,
    required this.facebookAddress,
    required this.isAds,
    required this.translationsCount,
    required this.mangasCount,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
