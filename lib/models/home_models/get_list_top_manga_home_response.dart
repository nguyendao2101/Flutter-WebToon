// To parse this JSON data, do
//
//     final getListTopMangaHomeResponse = getListTopMangaHomeResponseFromJson(jsonString);

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_list_top_manga_home_response.g.dart';

GetListTopMangaHomeResponse getListTopMangaHomeResponseFromJson(String str) =>
    GetListTopMangaHomeResponse.fromJson(json.decode(str));
String getListTopMangaHomeResponseToJson(GetListTopMangaHomeResponse data) =>
    json.encode(data.toJson());

// ignore: deprecated_member_use
@JsonSerializable(nullable: true)
class GetListTopMangaHomeResponse {
  @JsonKey(name: "data")
  List<TopMangaItem> data;
  @JsonKey(name: "_metadata")
  Metadata metadata;

  GetListTopMangaHomeResponse({
    required this.data,
    required this.metadata,
  });

  factory GetListTopMangaHomeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListTopMangaHomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetListTopMangaHomeResponseToJson(this);
}

// ignore: deprecated_member_use
@JsonSerializable(nullable: true)
class TopMangaItem {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "cover_url")
  String coverUrl;
  @JsonKey(name: "cover_mobile_url")
  String coverMobileUrl;
  @JsonKey(name: "newest_chapter_number")
  String newestChapterNumber;
  @JsonKey(name: "newest_chapter_id")
  int newestChapterId;
  @JsonKey(name: "newest_chapter_created_at")
  DateTime newestChapterCreatedAt;
  @JsonKey(name: "views_count")
  int viewsCount;
  @JsonKey(name: "views_count_week")
  int viewsCountWeek;
  @JsonKey(name: "views_count_month")
  int viewsCountMonth;

  TopMangaItem({
    required this.id,
    required this.name,
    required this.coverUrl,
    required this.coverMobileUrl,
    required this.newestChapterNumber,
    required this.newestChapterId,
    required this.newestChapterCreatedAt,
    required this.viewsCount,
    required this.viewsCountWeek,
    required this.viewsCountMonth,
  });

  factory TopMangaItem.fromJson(Map<String, dynamic> json) =>
      _$TopMangaItemFromJson(json);

  Map<String, dynamic> toJson() => _$TopMangaItemToJson(this);
}

// ignore: deprecated_member_use
@JsonSerializable(nullable: true)
class Metadata {
  @JsonKey(name: "total_count")
  int totalCount;
  @JsonKey(name: "total_pages")
  int totalPages;
  @JsonKey(name: "current_page")
  int currentPage;
  @JsonKey(name: "per_page")
  int perPage;

  Metadata({
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
    required this.perPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
