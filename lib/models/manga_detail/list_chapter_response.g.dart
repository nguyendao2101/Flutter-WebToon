// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_chapter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListChapterResponse _$ListChapterResponseFromJson(Map<String, dynamic> json) =>
    ListChapterResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ChapterItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListChapterResponseToJson(
        ListChapterResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ChapterItem _$ChapterItemFromJson(Map<String, dynamic> json) => ChapterItem(
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      number: json['number'] as String,
      name: json['name'] as String,
      viewsCount: (json['views_count'] as num).toInt(),
      commentsCount: (json['comments_count'] as num).toInt(),
      status: $enumDecode(_$StatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ChapterItemToJson(ChapterItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'number': instance.number,
      'name': instance.name,
      'views_count': instance.viewsCount,
      'comments_count': instance.commentsCount,
      'status': _$StatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$StatusEnumMap = {
  Status.PROCESSED: 'processed',
};
