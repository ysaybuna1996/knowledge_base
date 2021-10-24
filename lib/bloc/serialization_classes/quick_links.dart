class QuickLinks {
  int? id;
  String? name;
  String? link;
  String? favicon;

  QuickLinks({this.id, this.name, this.link, this.favicon});

  QuickLinks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    favicon = json['favicon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['favicon'] = favicon;
    return data;
  }
}
