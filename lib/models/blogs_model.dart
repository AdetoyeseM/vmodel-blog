class BlogsModel {
  String? id;
  String? title;
  String? subTitle;
  String? body;
  String? dateCreated;

  BlogsModel({this.id, this.title, this.subTitle, this.body, this.dateCreated});

  BlogsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    body = json['body'];
    dateCreated = json['dateCreated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['body'] = body;
    data['dateCreated'] = dateCreated;
    return data;
  }
}
