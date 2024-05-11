// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterDetailResponse _$ChapterDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ChapterDetailResponse(
      data: ChapterDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChapterDetailResponseToJson(
        ChapterDetailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ChapterDetailData _$ChapterDetailDataFromJson(Map<String, dynamic> json) =>
    ChapterDetailData(
      id: (json['id'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      number: json['number'] as String,
      name: json['name'] as String,
      viewsCount: (json['views_count'] as num?)?.toInt(),
      commentsCount: (json['comments_count'] as num?)?.toInt(),
      status: json['status'] as String,
      previousChapterId: json['previous_chapter_id'],
      previousChapterNumber: json['previous_chapter_number'],
      previousChapterName: json['previous_chapter_name'],
      nextChapterId: (json['next_chapter_id'] as num?)?.toInt(),
      nextChapterNumber: json['next_chapter_number'] as String,
      nextChapterName: json['next_chapter_name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      manga: Manga.fromJson(json['manga'] as Map<String, dynamic>),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      pages: (json['pages'] as List<dynamic>)
          .map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChapterDetailDataToJson(ChapterDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'number': instance.number,
      'name': instance.name,
      'views_count': instance.viewsCount,
      'comments_count': instance.commentsCount,
      'status': instance.status,
      'previous_chapter_id': instance.previousChapterId,
      'previous_chapter_number': instance.previousChapterNumber,
      'previous_chapter_name': instance.previousChapterName,
      'next_chapter_id': instance.nextChapterId,
      'next_chapter_number': instance.nextChapterNumber,
      'next_chapter_name': instance.nextChapterName,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'manga': instance.manga,
      'team': instance.team,
      'pages': instance.pages,
    };

Manga _$MangaFromJson(Map<String, dynamic> json) => Manga(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      coverUrl: json['cover_url'] as String,
      panoramaUrl: json['panorama_url'] as String,
      marginless: json['marginless'] as bool,
      isRegionLimited: json['is_region_limited'] as bool,
      direction: json['direction'] as String,
      isNsfw: json['is_nsfw'] as bool,
    );

Map<String, dynamic> _$MangaToJson(Manga instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'cover_url': instance.coverUrl,
      'panorama_url': instance.panoramaUrl,
      'marginless': instance.marginless,
      'is_region_limited': instance.isRegionLimited,
      'direction': instance.direction,
      'is_nsfw': instance.isNsfw,
    };

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      id: (json['id'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      status: json['status'] as String,
      imageUrl: json['image_url'] as String,
      imagePath: json['image_path'] as String,
      imageUrlSize: (json['image_url_size'] as num?)?.toInt(),
      drmData: json['drm_data'] as String,
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'width': instance.width,
      'height': instance.height,
      'status': instance.status,
      'image_url': instance.imageUrl,
      'image_path': instance.imagePath,
      'image_url_size': instance.imageUrlSize,
      'drm_data': instance.drmData,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      facebookAddress: json['facebook_address'] as String,
      isAds: json['is_ads'] as bool,
      translationsCount: (json['translations_count'] as num?)?.toInt(),
      mangasCount: (json['mangas_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'facebook_address': instance.facebookAddress,
      'is_ads': instance.isAds,
      'translations_count': instance.translationsCount,
      'mangas_count': instance.mangasCount,
    };
