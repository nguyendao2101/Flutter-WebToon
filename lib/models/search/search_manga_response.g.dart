// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_manga_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMangaResponse _$SearchMangaResponseFromJson(Map<String, dynamic> json) =>
    SearchMangaResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchMangaResponseToJson(
        SearchMangaResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      authorName: json['author_name'] as String,
      coverUrl: json['cover_url'] as String,
      coverMobileUrl: json['cover_mobile_url'] as String,
      newestChapterNumber: json['newest_chapter_number'] as String,
      newestChapterId: (json['newest_chapter_id'] as num).toInt(),
      newestChapterCreatedAt:
          DateTime.parse(json['newest_chapter_created_at'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author_name': instance.authorName,
      'cover_url': instance.coverUrl,
      'cover_mobile_url': instance.coverMobileUrl,
      'newest_chapter_number': instance.newestChapterNumber,
      'newest_chapter_id': instance.newestChapterId,
      'newest_chapter_created_at':
          instance.newestChapterCreatedAt.toIso8601String(),
    };
