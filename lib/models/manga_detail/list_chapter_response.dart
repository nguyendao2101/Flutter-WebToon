// To parse this JSON data, do
//
//     final listChapterResponse = listChapterResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'list_chapter_response.g.dart';

ListChapterResponse listChapterResponseFromJson(String str) =>
    ListChapterResponse.fromJson(json.decode(str));

String listChapterResponseToJson(ListChapterResponse data) =>
    json.encode(data.toJson());

@JsonSerializable(nullable: true)
class ListChapterResponse {
  @JsonKey(name: "data")
  List<ChapterItem> data;

  ListChapterResponse({
    required this.data,
  });

  factory ListChapterResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChapterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListChapterResponseToJson(this);
}

@JsonSerializable(nullable: true)
class ChapterItem {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "order")
  int order;
  @JsonKey(name: "number")
  String number;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "views_count")
  int viewsCount;
  @JsonKey(name: "comments_count")
  int commentsCount;
  @JsonKey(name: "status")
  Status status;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  ChapterItem({
    required this.id,
    required this.order,
    required this.number,
    required this.name,
    required this.viewsCount,
    required this.commentsCount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChapterItem.fromJson(Map<String, dynamic> json) =>
      _$ChapterItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterItemToJson(this);
}

enum Status {
  @JsonValue("processed")
  // ignore: constant_identifier_names
  PROCESSED
}

final statusValues = EnumValues({"processed": Status.PROCESSED});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
