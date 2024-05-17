// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class GetListTopMangaHomeResponse {
  List<TopMangaItem>? topMangaItem;
  Metadata? mMetadata;

  GetListTopMangaHomeResponse({this.topMangaItem, this.mMetadata});

  GetListTopMangaHomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['TopMangaItem'] != null) {
      topMangaItem = <TopMangaItem>[];
      json['TopMangaItem'].forEach((v) {
        topMangaItem!.add(TopMangaItem.fromMap(v));
      });
    }
    mMetadata = json['_metadata'] != null
        ? new Metadata.fromJson(json['_metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topMangaItem != null) {
      data['TopMangaItem'] = this.topMangaItem!.map((v) => v.toJson()).toList();
    }
    if (this.mMetadata != null) {
      data['_metadata'] = this.mMetadata!.toJson();
    }
    return data;
  }
}

class TopMangaItem {
  int? id;
  String? name;
  String? coverUrl;
  String? coverMobileUrl;
  String? newestChapterNumber;
  int? newestChapterId;
  String? newestChapterCreatedAt;
  int? viewsCount;
  int? viewsCountWeek;
  int? viewsCountMonth;

  TopMangaItem(
      {this.id,
      this.name,
      this.coverUrl,
      this.coverMobileUrl,
      this.newestChapterNumber,
      this.newestChapterId,
      this.newestChapterCreatedAt,
      this.viewsCount,
      this.viewsCountWeek,
      this.viewsCountMonth});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'coverUrl': coverUrl,
      'coverMobileUrl': coverMobileUrl,
      'newestChapterNumber': newestChapterNumber,
      'newestChapterId': newestChapterId,
      'viewsCount': viewsCount,
    };
  }

  factory TopMangaItem.fromMap(Map<String, dynamic> map) {
    return TopMangaItem(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      coverUrl: map['cover_url'] != null ? map['cover_url'] as String : null,
      coverMobileUrl: map['cover_mobile_url'] != null
          ? map['cover_mobile_url'] as String
          : null,
      newestChapterNumber: map['newest_chapter_number'] != null
          ? map['newest_chapter_number'] as String
          : null,
      newestChapterId: map['newest_chapter_id'] != null
          ? map['newest_chapter_id'] as int
          : null,
      viewsCount: map['views_count'] != null ? map['views_count'] as int : null,
    );
  }

  TopMangaItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coverUrl = json['cover_url'];
    coverMobileUrl = json['cover_mobile_url'];
    newestChapterNumber = json['newest_chapter_number'];
    newestChapterId = json['newest_chapter_id'];
    newestChapterCreatedAt = json['newest_chapter_created_at'];
    viewsCount = json['views_count'];
    viewsCountWeek = json['views_count_week'];
    viewsCountMonth = json['views_count_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cover_url'] = this.coverUrl;
    data['cover_mobile_url'] = this.coverMobileUrl;
    data['newest_chapter_number'] = this.newestChapterNumber;
    data['newest_chapter_id'] = this.newestChapterId;
    data['newest_chapter_created_at'] = this.newestChapterCreatedAt;
    data['views_count'] = this.viewsCount;
    data['views_count_week'] = this.viewsCountWeek;
    data['views_count_month'] = this.viewsCountMonth;
    return data;
  }
}

class Metadata {
  int? totalCount;
  int? totalPages;
  int? currentPage;
  int? perPage;

  Metadata({this.totalCount, this.totalPages, this.currentPage, this.perPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['total_pages'] = this.totalPages;
    data['current_page'] = this.currentPage;
    data['per_page'] = this.perPage;
    return data;
  }
}
