// import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';

// part 'search_manga_response.g.dart';

// SearchMangaResponse searchMangaResponseFromJson(String str) => SearchMangaResponse.fromJson(json.decode(str));

// String searchMangaResponseToJson(SearchMangaResponse data) => json.encode(data.toJson());

// @JsonSerializable()
// class SearchMangaResponse {
//     @JsonKey(name: "data")
//     List<Datum> data;

//     SearchMangaResponse({
//         required this.data,
//     });

//     factory SearchMangaResponse.fromJson(Map<String, dynamic> json) => _$SearchMangaResponseFromJson(json);

//     Map<String, dynamic> toJson() => _$SearchMangaResponseToJson(this);
// }

// @JsonSerializable()
// class Datum {
//     @JsonKey(name: "id")
//     int id;
//     @JsonKey(name: "name")
//     String name;
//     @JsonKey(name: "author_name")
//     String authorName;
//     @JsonKey(name: "cover_url")
//     String coverUrl;
//     @JsonKey(name: "cover_mobile_url")
//     String coverMobileUrl;
//     @JsonKey(name: "newest_chapter_number")
//     String newestChapterNumber;
//     @JsonKey(name: "newest_chapter_id")
//     int newestChapterId;
//     @JsonKey(name: "newest_chapter_created_at")
//     DateTime newestChapterCreatedAt;

//     Datum({
//         required this.id,
//         required this.name,
//         required this.authorName,
//         required this.coverUrl,
//         required this.coverMobileUrl,
//         required this.newestChapterNumber,
//         required this.newestChapterId,
//         required this.newestChapterCreatedAt,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

//     Map<String, dynamic> toJson() => _$DatumToJson(this);
// }