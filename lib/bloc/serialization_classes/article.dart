class Article {
  int? page;
  List<ArticlePage>? data;

  Article({this.page, this.data});

  Article.fromJson(Map<String, dynamic> json) {
    data = [];
    page = json['page'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data?.add(ArticlePage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArticlePage {
  String? id;
  String? title;
  String? diagnosis;
  String? publishDate;
  String? views;

  ArticlePage(
      {this.id, this.title, this.diagnosis, this.publishDate, this.views});

  ArticlePage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    diagnosis = json['diagnosis'];
    publishDate = json['publish_date'];
    views = json['views'];
    //(json['views']).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['diagnosis'] = diagnosis;
    data['publish_date'] = publishDate;
    data['views'] = views;
    return data;
  }
}
