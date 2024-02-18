import 'package:vmodel_blog_app/models/blogs_model.dart';
import 'package:rxdart/rxdart.dart';

class BLogsBLoc {
  final BehaviorSubject<List<BlogsModel>> _blogsList =
      BehaviorSubject<List<BlogsModel>>();

  Stream<List<BlogsModel>> get allBlogsModel => _blogsList.stream;
  addBlogsList(List<BlogsModel>? e) => _blogsList.sink.add(e!);

  dispose() {
    _blogsList.close();
  }
}
