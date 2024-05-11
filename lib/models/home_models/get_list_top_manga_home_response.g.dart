// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_top_manga_home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListTopMangaHomeResponse _$GetListTopMangaHomeResponseFromJson(
        Map<String, dynamic> json) =>
    GetListTopMangaHomeResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => TopMangaItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: Metadata.fromJson(json['_metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetListTopMangaHomeResponseToJson(
        GetListTopMangaHomeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      '_metadata': instance.metadata,
    };

TopMangaItem _$TopMangaItemFromJson(Map<String, dynamic> json) => TopMangaItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      coverUrl: json['cover_url'] as String,
      coverMobileUrl: json['cover_mobile_url'] as String,
      newestChapterNumber: json['newest_chapter_number'] as String,
      newestChapterId: (json['newest_chapter_id'] as num).toInt(),
      newestChapterCreatedAt:
          DateTime.parse(json['newest_chapter_created_at'] as String),
      viewsCount: (json['views_count'] as num).toInt(),
      viewsCountWeek: (json['views_count_week'] as num).toInt(),
      viewsCountMonth: (json['views_count_month'] as num).toInt(),
    );

Map<String, dynamic> _$TopMangaItemToJson(TopMangaItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover_url': instance.coverUrl,
      'cover_mobile_url': instance.coverMobileUrl,
      'newest_chapter_number': instance.newestChapterNumber,
      'newest_chapter_id': instance.newestChapterId,
      'newest_chapter_created_at':
          instance.newestChapterCreatedAt.toIso8601String(),
      'views_count': instance.viewsCount,
      'views_count_week': instance.viewsCountWeek,
      'views_count_month': instance.viewsCountMonth,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      totalCount: (json['total_count'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'total_count': instance.totalCount,
      'total_pages': instance.totalPages,
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
    };
