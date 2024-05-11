import 'package:untitled/models/manga_detail/list_chapter_response.dart';

class ReadDetailArgument {
  final int id;
  final List<ChapterItem> listChapter;
  final int index;

  ReadDetailArgument({
    required this.id,
    required this.listChapter,
    required this.index,
  });
}
