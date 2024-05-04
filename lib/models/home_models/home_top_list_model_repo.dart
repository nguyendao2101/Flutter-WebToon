// ignore_for_file: unnecessary_this, unnecessary_getters_setters, unnecessary_new, prefer_collection_literals

class GetListTopMangaHomeResponse {
  List<MangaItem>? _mangaItem;
  Metadata? _mMetadata;

  GetListTopMangaHomeResponse(
      {List<MangaItem>? mangaItem, Metadata? mMetadata}) {
    if (mangaItem != null) {
      this._mangaItem = mangaItem;
    }
    if (mMetadata != null) {
      this._mMetadata = mMetadata;
    }
  }

  List<MangaItem>? get mangaItem => _mangaItem;
  set mangaItem(List<MangaItem>? mangaItem) => _mangaItem = mangaItem;
  Metadata? get mMetadata => _mMetadata;
  set mMetadata(Metadata? mMetadata) => _mMetadata = mMetadata;

  GetListTopMangaHomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['MangaItem'] != null) {
      _mangaItem = <MangaItem>[];
      json['MangaItem'].forEach((v) {
        _mangaItem!.add(new MangaItem.fromJson(v));
      });
    }
    _mMetadata = json['_metadata'] != null
        ? new Metadata.fromJson(json['_metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._mangaItem != null) {
      data['MangaItem'] = this._mangaItem!.map((v) => v.toJson()).toList();
    }
    if (this._mMetadata != null) {
      data['_metadata'] = this._mMetadata!.toJson();
    }
    return data;
  }
}

class MangaItem {
  int? _id;
  String? _name;
  String? _coverUrl;
  String? _coverMobileUrl;
  String? _newestChapterNumber;
  int? _newestChapterId;
  String? _newestChapterCreatedAt;
  int? _viewsCount;
  int? _viewsCountWeek;
  int? _viewsCountMonth;

  MangaItem(
      {int? id,
      String? name,
      String? coverUrl,
      String? coverMobileUrl,
      String? newestChapterNumber,
      int? newestChapterId,
      String? newestChapterCreatedAt,
      int? viewsCount,
      int? viewsCountWeek,
      int? viewsCountMonth}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (coverUrl != null) {
      this._coverUrl = coverUrl;
    }
    if (coverMobileUrl != null) {
      this._coverMobileUrl = coverMobileUrl;
    }
    if (newestChapterNumber != null) {
      this._newestChapterNumber = newestChapterNumber;
    }
    if (newestChapterId != null) {
      this._newestChapterId = newestChapterId;
    }
    if (newestChapterCreatedAt != null) {
      this._newestChapterCreatedAt = newestChapterCreatedAt;
    }
    if (viewsCount != null) {
      this._viewsCount = viewsCount;
    }
    if (viewsCountWeek != null) {
      this._viewsCountWeek = viewsCountWeek;
    }
    if (viewsCountMonth != null) {
      this._viewsCountMonth = viewsCountMonth;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get coverUrl => _coverUrl;
  set coverUrl(String? coverUrl) => _coverUrl = coverUrl;
  String? get coverMobileUrl => _coverMobileUrl;
  set coverMobileUrl(String? coverMobileUrl) =>
      _coverMobileUrl = coverMobileUrl;
  String? get newestChapterNumber => _newestChapterNumber;
  set newestChapterNumber(String? newestChapterNumber) =>
      _newestChapterNumber = newestChapterNumber;
  int? get newestChapterId => _newestChapterId;
  set newestChapterId(int? newestChapterId) =>
      _newestChapterId = newestChapterId;
  String? get newestChapterCreatedAt => _newestChapterCreatedAt;
  set newestChapterCreatedAt(String? newestChapterCreatedAt) =>
      _newestChapterCreatedAt = newestChapterCreatedAt;
  int? get viewsCount => _viewsCount;
  set viewsCount(int? viewsCount) => _viewsCount = viewsCount;
  int? get viewsCountWeek => _viewsCountWeek;
  set viewsCountWeek(int? viewsCountWeek) => _viewsCountWeek = viewsCountWeek;
  int? get viewsCountMonth => _viewsCountMonth;
  set viewsCountMonth(int? viewsCountMonth) =>
      _viewsCountMonth = viewsCountMonth;

  MangaItem.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _coverUrl = json['cover_url'];
    _coverMobileUrl = json['cover_mobile_url'];
    _newestChapterNumber = json['newest_chapter_number'];
    _newestChapterId = json['newest_chapter_id'];
    _newestChapterCreatedAt = json['newest_chapter_created_at'];
    _viewsCount = json['views_count'];
    _viewsCountWeek = json['views_count_week'];
    _viewsCountMonth = json['views_count_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['cover_url'] = this._coverUrl;
    data['cover_mobile_url'] = this._coverMobileUrl;
    data['newest_chapter_number'] = this._newestChapterNumber;
    data['newest_chapter_id'] = this._newestChapterId;
    data['newest_chapter_created_at'] = this._newestChapterCreatedAt;
    data['views_count'] = this._viewsCount;
    data['views_count_week'] = this._viewsCountWeek;
    data['views_count_month'] = this._viewsCountMonth;
    return data;
  }
}

class Metadata {
  int? _totalCount;
  int? _totalPages;
  int? _currentPage;
  int? _perPage;

  Metadata({int? totalCount, int? totalPages, int? currentPage, int? perPage}) {
    if (totalCount != null) {
      this._totalCount = totalCount;
    }
    if (totalPages != null) {
      this._totalPages = totalPages;
    }
    if (currentPage != null) {
      this._currentPage = currentPage;
    }
    if (perPage != null) {
      this._perPage = perPage;
    }
  }

  int? get totalCount => _totalCount;
  set totalCount(int? totalCount) => _totalCount = totalCount;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get currentPage => _currentPage;
  set currentPage(int? currentPage) => _currentPage = currentPage;
  int? get perPage => _perPage;
  set perPage(int? perPage) => _perPage = perPage;

  Metadata.fromJson(Map<String, dynamic> json) {
    _totalCount = json['total_count'];
    _totalPages = json['total_pages'];
    _currentPage = json['current_page'];
    _perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this._totalCount;
    data['total_pages'] = this._totalPages;
    data['current_page'] = this._currentPage;
    data['per_page'] = this._perPage;
    return data;
  }
}
